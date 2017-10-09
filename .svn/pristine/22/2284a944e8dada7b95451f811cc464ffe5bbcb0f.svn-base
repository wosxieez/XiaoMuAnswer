package com.xiaomu.renderer
{
	import coco.component.DefaultItemRenderer;
	import coco.component.HorizontalAlign;
	import coco.component.Image;
	import coco.component.List;
	import coco.component.TextAlign;
	import coco.event.ItemRendererEvent;
	
	public class StudentItemRenderer extends DefaultItemRenderer
	{
		public function StudentItemRenderer()
		{
			super();
			mouseChildren = true;
		}
		
		private var icon:Image;
		private var heartList:List;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			labelDisplay.leftMargin = 30;
			labelDisplay.textAlign = TextAlign.LEFT;
			
			icon = new Image();
			icon.x = 6;
			icon.width = icon.height = 18;
			icon.source = "assets/student.png";
			addChild(icon);
			
			heartList = new List();
			heartList.x = 30;
			heartList.itemRendererRowCount = 1;
			heartList.touchScrollEnabled = false;
			heartList.verticalScrollEnabled = false;
			heartList.horizontalScrollEnabled = true;
			heartList.horizontalAlign = HorizontalAlign.RIGHT;
			heartList.itemRendererWidth = heartList.itemRendererHeight = 24;
			heartList.itemRendererClass = HeartItemRenderer;
			heartList.padding = 3;
			heartList.dataProvider = [1, 2, 3];
			addChild(heartList);
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			icon.y = (height - icon.height) / 2;
			
			heartList.width = width - heartList.x;
			heartList.height = height;
		}
		
		override protected function this_selectedHandler(event:ItemRendererEvent):void
		{
			event.preventDefault();
		}
		
	}
}