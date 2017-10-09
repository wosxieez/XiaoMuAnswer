package com.xiaomu.view.homeview
{
	import com.xiaomu.view.questionview.QuestionView;
	import com.xiaomu.view.studentview.StudentTeamView;
	import com.xiaomu.view.teamview.TeamView;
	
	import coco.core.UIComponent;
	
	/**
	 * 首页 
	 * @author coco
	 * 
	 */	
	public class HomeView extends UIComponent
	{
		public function HomeView()
		{
			super();
		}
		
		private var questionView:QuestionView;
		private var teamView:TeamView;
		private var studentView:StudentTeamView;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			questionView = new QuestionView();
			questionView.width = 200;
			addChild(questionView);
			
			teamView = new TeamView();
			teamView.width = 200;
			addChild(teamView);
			
			studentView = new StudentTeamView();
			studentView.x = 200;
			addChild(studentView);
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			questionView.height = height / 2;
			
			teamView.height = teamView.y = height / 2;
			
			studentView.width = width - studentView.x;
			studentView.height = height;
		}
		
	}
}