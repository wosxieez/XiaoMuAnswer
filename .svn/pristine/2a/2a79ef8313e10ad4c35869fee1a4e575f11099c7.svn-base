package com.xiaomu.view.studentview
{
	import com.xiaomu.event.DataManagerEvent;
	import com.xiaomu.manager.DataManager;
	import com.xiaomu.renderer.StudentTeamItemRenderer;
	
	import coco.component.List;
	import coco.component.SkinComponent;
	import coco.component.VerticalAlign;
	
	public class StudentTeamView extends SkinComponent
	{
		public function StudentTeamView()
		{
			super();
			DataManager.getInstance().addEventListener(DataManagerEvent.TEAM_DATA_CHANGED, dataChangeHandler);
			DataManager.getInstance().addEventListener(DataManagerEvent.STUDENT_DATA_CHANGED, dataChangeHandler);
			DataManager.getInstance().addEventListener(DataManagerEvent.ANSWER_DATA_CHANGED, dataChangeHandler);
		}
		
		
		private var teamList:List;
		
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			teamList = new List();
			teamList.touchScrollEnabled = false;
			teamList.labelField = "name";
			teamList.verticalAlign = VerticalAlign.JUSTIFY;
			teamList.itemRendererRowCount = 1;
			teamList.itemRendererClass = StudentTeamItemRenderer;
			addChild(teamList);
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			teamList.dataProvider = DataManager.getInstance().getTeams();
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			teamList.width = width;
			teamList.height = height;
		}
		
		protected function dataChangeHandler(event:DataManagerEvent):void
		{
			invalidateProperties();
		}
		
	}
}