package com.xiaomu.view.teamview
{
	import com.xiaomu.event.DataManagerEvent;
	import com.xiaomu.manager.DataManager;
	import com.xiaomu.renderer.TeamItemRenderer;
	
	import flash.events.MouseEvent;
	
	import coco.component.Button;
	import coco.component.List;
	import coco.component.Panel;
	import coco.component.VerticalAlign;
	
	/**
	 * 团队视图 
	 * @author coco
	 */	
	public class TeamView extends Panel
	{
		public function TeamView()
		{
			super();
			
			title = "小组列表";
			width = 400;
			height = 300;
			DataManager.getInstance().addEventListener(DataManagerEvent.TEAM_DATA_CHANGED, teamChangeHandler);
		}
		
		
		//----------------------------------------------------------------------------------------------------------------------------------------
		//
		//  Properties
		//
		//----------------------------------------------------------------------------------------------------------------------------------------
		
		private var teamList:List;
		private var addButton:Button;
		
		
		//----------------------------------------------------------------------------------------------------------------------------------------
		//
		//  Methods
		//
		//----------------------------------------------------------------------------------------------------------------------------------------
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			teamList = new List();
			teamList.labelField = "name";
			teamList.gap = teamList.padding = 10;
			teamList.verticalAlign = VerticalAlign.TOP;
			teamList.itemRendererClass = TeamItemRenderer;
			addChild(teamList);
			
			addButton = new Button();
			addButton.height = 30;
			addButton.x = 10;
			addButton.label = "添加小组";
			addButton.addEventListener(MouseEvent.CLICK, addButton_clickHandler);
			addChild(addButton);
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			teamList.dataProvider = DataManager.getInstance().getTeams();
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			addButton.width = width - 20;
			addButton.y = contentHeight - 10 - addButton.height;
			
			teamList.width = width;
			teamList.height = addButton.y;
		}
		
		protected function addButton_clickHandler(event:MouseEvent):void
		{
			AddTeamView.getInstance().open();
		}
		
		protected function teamChangeHandler(event:DataManagerEvent):void
		{
			invalidateProperties();
		}
		
	}
}