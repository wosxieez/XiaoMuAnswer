package com.xiaomu.view.otherview
{
	import com.xiaomu.manager.DataManager;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.net.FileFilter;
	
	import coco.component.Alert;
	import coco.component.Button;
	import coco.component.SkinComponent;
	import coco.manager.PopUpManager;
	
	public class AppMenuView extends SkinComponent
	{
		public function AppMenuView()
		{
			super();
			
			width = 80;
			height = 60;
		}
		
		//----------------------------------------------------------------------------------------------------------------------------------------
		//
		//  Get Instance
		//
		//----------------------------------------------------------------------------------------------------------------------------------------
		
		private static var instance:AppMenuView;
		
		public static function getInstance():AppMenuView
		{
			if (!instance)
				instance = new AppMenuView();
			
			return instance;
		}
		
		
		//----------------------------------------------------------------------------------------------------------------------------------------
		//
		//  Get Instance
		//
		//----------------------------------------------------------------------------------------------------------------------------------------
		
		private var importButton:Button;
		private var exportButton:Button;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			exportButton = new Button();
			exportButton.label = "导出";
			exportButton.width = 80;
			exportButton.height = 30;
			exportButton.y = 30;
			exportButton.addEventListener(MouseEvent.CLICK, openTeamButton_clickHandler);
			addChild(exportButton);
			
			importButton = new Button();
			importButton.label = "导入"
			importButton.width = 80;
			importButton.height = 30;
			importButton.addEventListener(MouseEvent.CLICK, importButton_clickHandler);
			addChild(importButton);
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			var child:DisplayObject;
			var childHeight:Number = height / numChildren;
			for (var i:int = 0; i < numChildren; i++)
			{
				child = getChildAt(i);
				child.width = width;
				child.height = childHeight;
				child.y = i * childHeight;
			}
		}
		
		protected function openTeamButton_clickHandler(event:MouseEvent):void
		{
			PopUpManager.removePopUp(this);
			// 导出数据
			var file:File = File.desktopDirectory;
			file.addEventListener(Event.SELECT, file_selectHandler);
			file.browseForSave("请选导出路径");
		}
		
		protected function file_selectHandler(event:Event):void
		{
			try
			{
				DataManager.getInstance().exportAppData(event.target as File);
				Alert.show("导出成功", "提示");
			} 
			catch(error:Error) 
			{
				Alert.show("导出失败", "提示");
			}
		}
		
		protected function importButton_clickHandler(event:MouseEvent):void
		{
			PopUpManager.removePopUp(this);
			
			// 导出数据
			var xmaFilter:FileFilter = new FileFilter("XMA", "*.xma");
			var file:File = File.desktopDirectory;
			file.addEventListener(Event.SELECT, importfile_selectHandler);
			file.browseForOpen("请选择导入文件", [xmaFilter]);
		}
		
		protected function importfile_selectHandler(event:Event):void
		{
			try
			{
				DataManager.getInstance().importAppData(event.target as File);
				//				Alert.show("导入成功", "提示");
			} 
			catch(error:Error) 
			{
				Alert.show("导入失败", "提示");
			}
		}
		
	}
}