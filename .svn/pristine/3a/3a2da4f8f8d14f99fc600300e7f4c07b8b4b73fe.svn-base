package com.xiaomu.renderer
{
	import com.xiaomu.component.IconButton;
	import com.xiaomu.data.Question;
	import com.xiaomu.manager.DataManager;
	
	import flash.events.MouseEvent;
	
	import coco.component.Alert;
	import coco.component.DefaultItemRenderer;
	import coco.component.Image;
	import coco.component.TextAlign;
	import coco.event.ItemRendererEvent;
	import coco.event.UIEvent;
	
	public class QuestionItemRenderer extends DefaultItemRenderer
	{
		public function QuestionItemRenderer()
		{
			super();
			mouseChildren = true;
		}
		
		private var icon:Image;
		private var editButton:IconButton;
		private var deleteButton:IconButton;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			labelDisplay.leftMargin = 30;
			labelDisplay.textAlign = TextAlign.LEFT;
			
			icon = new Image();
			icon.x = 6;
			icon.width = icon.height = 18;
			icon.source = "assets/question.png";
			addChild(icon);
			
			editButton = new IconButton();
			editButton.toolTip = "编辑";
			editButton.source = "assets/edit.png";
			addChild(editButton);
			
			deleteButton = new IconButton();
			deleteButton.toolTip = "删除"; 
			deleteButton.source = "assets/delete.png";
			deleteButton.addEventListener(MouseEvent.CLICK, deleteButton_clickHandler);
			addChild(deleteButton);
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			icon.y = (height - icon.height) / 2;
			
			deleteButton.x = width - 3 - deleteButton.width;
			deleteButton.y = (height - deleteButton.height) / 2;
			
			editButton.x = deleteButton.x - editButton.width;
			editButton.y = (height - editButton.height) / 2;
		}
		
		override protected function this_selectedHandler(event:ItemRendererEvent):void
		{
			event.preventDefault();
		}
		
		protected function deleteButton_clickHandler(event:MouseEvent):void
		{
			Alert.show("确认要删除这个问题吗?", "提示", Alert.CANCEL|Alert.OK, deleteAlertCloseHandler);
		}
		
		private function deleteAlertCloseHandler(e:UIEvent):void
		{
			if (e.detail == Alert.OK)
			{
				DataManager.getInstance().removeQuestion((data as Question).id);
			}
		}
		
	}
}