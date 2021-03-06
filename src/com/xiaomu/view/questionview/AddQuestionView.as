package com.xiaomu.view.questionview
{
	import com.xiaomu.data.Question;
	import com.xiaomu.manager.DataManager;
	import com.xiaomu.renderer.AnswerItemRenderer;
	
	import flash.events.MouseEvent;
	
	import coco.component.Button;
	import coco.component.List;
	import coco.component.Panel;
	import coco.component.TextArea;
	import coco.manager.PopUpManager;
	
	/**
	 * 添加问题视图 
	 * @author coco
	 * 
	 */	
	public class AddQuestionView extends Panel
	{
		public function AddQuestionView()
		{
			super();
			
			width = 500;
			height = 350;
			title = "添加问题";
		}
		
		//---------------------------------------------------------------------------------------------------------------------
		//
		//  Get Instance
		//
		//---------------------------------------------------------------------------------------------------------------------
		
		private static var instance:AddQuestionView;
		
		public static function getInstance():AddQuestionView
		{
			if (!instance)
				instance = new AddQuestionView();
			
			return instance;
		}
		
		
		//---------------------------------------------------------------------------------------------------------------------
		//
		//  Variables
		//
		//---------------------------------------------------------------------------------------------------------------------
		
		private var questionInput:TextArea;
		private var answerList:List;
		private var cancelButton:Button;
		private var okButton:Button;
		private var currentQuestion:Question;
		private var isUpdate:Boolean = false;
		
		//---------------------------------------------------------------------------------------------------------------------
		//
		//  Methods
		//
		//---------------------------------------------------------------------------------------------------------------------
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			questionInput = new TextArea();
			questionInput.x = questionInput.y = 10;
			questionInput.height = 100;
			addChild(questionInput);
			
			answerList = new List();
			answerList.x = 10;
			answerList.y = 120;
			answerList.gap = 10;
			answerList.allowMultipleSelection = true;
			answerList.mouseScrollEnabled = false;
			answerList.touchScrollEnabled = false;
			answerList.itemRendererClass = AnswerItemRenderer;
			answerList.itemRendererColumnCount = 2;
			addChild(answerList);
			
			cancelButton = new Button();
			cancelButton.label = "取消";
			cancelButton.height = 30;
			cancelButton.addEventListener(MouseEvent.CLICK, cancelButton_clickHandler);
			addChild(cancelButton);
			
			okButton = new Button();
			okButton.label = "确定";
			okButton.height = 30;
			okButton.addEventListener(MouseEvent.CLICK, okButton_clickHandler);
			addChild(okButton);
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			questionInput.text = currentQuestion.name;
			questionInput.setSelection(0, 1000);
			answerList.dataProvider = currentQuestion.answers;
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			questionInput.width = width - 20;
			
			cancelButton.width = width/2;
			cancelButton.y = contentHeight - cancelButton.height;
			
			okButton.width = cancelButton.width;
			okButton.x = cancelButton.width;
			okButton.y = cancelButton.y;
			
			answerList.width = contentWidth - 10 - answerList.x;
			answerList.height = okButton.y - 10 - answerList.y;
		}
		
		protected function okButton_clickHandler(event:MouseEvent):void
		{
			currentQuestion.name = questionInput.text;
			currentQuestion.answers = answerList.dataProvider;
			
			var correctCount:int = 0;
			for each(var answer:Object in currentQuestion.answers)
			{
				if (answer.correct)
					correctCount++;
			}
			
			currentQuestion.correctCount = correctCount;
			if (isUpdate)
				DataManager.getInstance().updateQuestion(currentQuestion);
			else
				DataManager.getInstance().addQuestion(currentQuestion);
			
			// 关闭窗口
			PopUpManager.removePopUp(this);
		}
		
		protected function cancelButton_clickHandler(event:MouseEvent):void
		{
			// 关闭窗口
			PopUpManager.removePopUp(this);
		}
		
		public function open(question:Question = null):void
		{
			if (question)
			{
				isUpdate = true;
				currentQuestion = question;
				title = "编辑问题";
			}
			else
			{
				isUpdate = false;
				currentQuestion = new Question();
				title = "添加问题";
			}
			
			invalidateProperties();
			PopUpManager.centerPopUp(PopUpManager.addPopUp(this, null, true, false, 0));
		}
		
	}
}