package com.xiaomu.view.menuview
{
	import com.xiaomu.component.IconButton;
	import com.xiaomu.manager.DataManager;
	import com.xiaomu.manager.ServiceManager;
	import com.xiaomu.util.Theme;
	import com.xiaomu.view.otherview.AppMenuView;
	
	import flash.events.MouseEvent;
	
	import coco.component.Alert;
	import coco.component.Image;
	import coco.component.Label;
	import coco.core.UIComponent;
	import coco.event.UIEvent;
	import coco.manager.PopUpManager;
	
	public class MenuView extends UIComponent
	{
		public function MenuView()
		{
			super();
			
			height = 40;
			
			addEventListener(MouseEvent.MOUSE_DOWN, this_mouseDownHandler);
		}
		
		
		private var logoDisplay:Image;
		private var titleDisplay:Label;
		private var settingButton:IconButton;
		private var closeAppButton:IconButton;
		
		override  protected function createChildren():void
		{
			super.createChildren();
			
			logoDisplay = new Image();
			logoDisplay.source = "assets/logo.png";
			logoDisplay.width = 41;
			logoDisplay.x = 15;
			logoDisplay.height = 11;
			addChild(logoDisplay);
			
			titleDisplay = new Label();
			titleDisplay.text = "小木答题-教师端" + DataManager.getInstance().appVersionNumber;
			titleDisplay.color = 0xFFFFFF;
			titleDisplay.fontSize = 15;
			titleDisplay.bold = true;
			titleDisplay.x = 60;
			addChild(titleDisplay);
			
			closeAppButton = new IconButton();
			closeAppButton.source = "assets/close1.png";
			closeAppButton.addEventListener(MouseEvent.CLICK, closeAppButton_clickHandler);
			addChild(closeAppButton);
			
			settingButton = new IconButton();
			settingButton.source = "assets/setting1.png";
			settingButton.addEventListener(MouseEvent.CLICK, settingButton_clickHandler);
			addChild(settingButton);
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			logoDisplay.y = (height - logoDisplay.height) / 2;
			
			titleDisplay.height = height;
			
			closeAppButton.x = width - 10 - closeAppButton.width;
			closeAppButton.y = (height - closeAppButton.height) / 2;
			
			settingButton.x = closeAppButton.x - 10 - settingButton.width;
			settingButton.y = closeAppButton.y;
		}
		
		override protected function drawSkin():void
		{
			graphics.clear();
			graphics.lineStyle(1, Theme.COLOR3);
			graphics.beginFill(Theme.COLOR3);
			graphics.drawRect(0, 0, width, height);
			graphics.endFill();
		}
		
		protected function this_mouseDownHandler(event:MouseEvent):void
		{
			stage.nativeWindow.startMove();
		}
		
		protected function closeAppButton_clickHandler(event:MouseEvent):void
		{
			Alert.show("确认关闭程序吗？", "提示", Alert.OK|Alert.CANCEL, function close(e:UIEvent):void
			{
				if (e.detail == Alert.OK)
				{
					// 关闭之前存储程序数据
					DataManager.getInstance().storeAppData();
					ServiceManager.getInstance().dispose();
					stage.nativeWindow.close();
				}
			});
		}
		
		protected function settingButton_clickHandler(event:MouseEvent):void
		{
			AppMenuView.getInstance().y = 24;
			AppMenuView.getInstance().x = -12;
			PopUpManager.addPopUp(AppMenuView.getInstance(), settingButton, false, true);
		}
		
	}
}