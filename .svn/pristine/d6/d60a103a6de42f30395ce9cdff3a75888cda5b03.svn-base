package com.xiaomu.renderer
{
	import com.xiaomu.manager.DataManager;
	
	import coco.component.DefaultItemRenderer;
	import coco.component.List;
	import coco.event.ItemRendererEvent;
	
	public class StudentTeamItemRenderer extends DefaultItemRenderer
	{
		public function StudentTeamItemRenderer()
		{
			super();
			mouseChildren = true;
		}
		
		private var studentList:List;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			studentList = new List();
			studentList.y = 30;
			studentList.touchScrollEnabled = false;
			studentList.labelField = "name";
			studentList.gap = studentList.padding = 10;
			studentList.itemRendererClass = StudentItemRenderer;
			addChild(studentList);
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			studentList.dataProvider = DataManager.getInstance().getStudents();
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			labelDisplay.height = 30;
			
			studentList.width = width;
			studentList.height = height;
		}
		
		override protected function drawSkin():void
		{
			super.drawSkin();
			
			graphics.beginFill(backgroundColor, backgroundAlpha);
			graphics.drawRoundRectComplex(0, 30, width, height, 
				0, 0, bottomLeftRadius, bottomRightRadius);
			graphics.endFill();
		}
		
		override protected function this_selectedHandler(event:ItemRendererEvent):void
		{
			event.preventDefault();
		}
		
	}
}