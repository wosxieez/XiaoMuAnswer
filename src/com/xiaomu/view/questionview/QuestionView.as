package com.xiaomu.view.questionview
{
	import com.xiaomu.event.DataManagerEvent;
	import com.xiaomu.manager.DataManager;
	import com.xiaomu.renderer.QuestionItemRenderer;
	
	import flash.events.MouseEvent;
	
	import coco.component.Button;
	import coco.component.List;
	import coco.component.Panel;
	import coco.component.VerticalAlign;
	
	public class QuestionView extends Panel
	{
		public function QuestionView()
		{
			super();
			title = "问题列表";
			DataManager.getInstance().addEventListener(DataManagerEvent.QUESTION_DATA_CHANGED, questionChangeHandler);
		}
		
		private var questionList:List;
		private var addButton:Button;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			questionList = new List();
			questionList.labelField = "name";
			questionList.gap = questionList.padding = 10;
			questionList.itemRendererClass = QuestionItemRenderer;
			questionList.verticalAlign = VerticalAlign.TOP;
			addChild(questionList);
			
			addButton = new Button();
			addButton.height = 30;
			addButton.x = 10;
			addButton.label = "添加问题";
			addButton.addEventListener(MouseEvent.CLICK, addButton_clickHandler);
			addChild(addButton);
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			questionList.dataProvider = DataManager.getInstance().getQuestions();
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			addButton.width = width - 20;
			addButton.y = contentHeight - 10 - addButton.height;
			
			questionList.width = width;
			questionList.height = addButton.y;
		}
		
		protected function addButton_clickHandler(event:MouseEvent):void
		{
			AddQuestionView.getInstance().open();
		}
		
		protected function questionChangeHandler(event:DataManagerEvent):void
		{
			invalidateProperties();
		}
		
	}
}