package com.xiaomu.renderer
{
	import com.xiaomu.data.Answer;
	import com.xiaomu.data.Student;
	import com.xiaomu.manager.DataManager;
	import com.xiaomu.util.UIDUtil;
	
	import flash.events.ContextMenuEvent;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	
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
			addChild(heartList);
			
			var reward:ContextMenuItem = new ContextMenuItem("奖励星星");
			reward.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, reward_clickHandler);
			
			var menu:ContextMenu = new ContextMenu();
			menu.items = [reward];
			contextMenu = menu;
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			heartList.dataProvider = DataManager.getInstance().getStudentAnswers((data as Student).id);
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
		
		protected function reward_clickHandler(event:ContextMenuEvent):void
		{
			var answer:Answer = new Answer();
			answer.studentID = (data as Student).id;
			answer.questionID = UIDUtil.createUID(); // 独一无二的问题ID
			answer.correct = true;
			answer.name = "奖励的星星";
			DataManager.getInstance().addAnswer(answer);
		}
		
	}
}