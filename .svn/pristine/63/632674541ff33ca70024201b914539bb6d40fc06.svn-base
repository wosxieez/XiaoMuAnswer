package com.xiaomu.renderer
{
	import com.xiaomu.manager.DataManager;
	
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	
	import coco.component.DefaultItemRenderer;
	import coco.component.Image;
	import coco.component.TextAlign;
	import coco.component.TextInput;
	import coco.event.ItemRendererEvent;
	
	public class AnswerItemRenderer extends DefaultItemRenderer
	{
		public function AnswerItemRenderer()
		{
			super();
			mouseChildren = true;
			addEventListener(MouseEvent.CLICK, this_clickHandler);
		}
		
		private var rightDisplay:Image;
		private var inputDisplay:TextInput;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			rightDisplay = new Image();
			rightDisplay.source = "assets/right.png";
			rightDisplay.width = rightDisplay.height = 18;
			rightDisplay.x = 6;
			rightDisplay.y = 12;
			addChild(rightDisplay);
			
			labelDisplay.textAlign = TextAlign.LEFT;
			labelDisplay.leftMargin = 8
			
			inputDisplay = new TextInput();
			inputDisplay.x = 30;
			inputDisplay.addEventListener(MouseEvent.CLICK, inputDisplay_clickHandler);
			inputDisplay.addEventListener(FocusEvent.FOCUS_OUT, inputDisplay_focusOutHandler);
			addChild(inputDisplay);
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			labelDisplay.text = DataManager.getInstance().answerTitles[index];
			inputDisplay.text = data.name;
			rightDisplay.visible = data.correct;
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			inputDisplay.width = width - inputDisplay.x;
			inputDisplay.height = height;
		}
		
		override protected function this_selectedHandler(event:ItemRendererEvent):void
		{
			event.preventDefault();
		}
		
		protected function inputDisplay_focusOutHandler(event:FocusEvent):void
		{
			data.name = inputDisplay.text;
		}
		
		protected function this_clickHandler(event:MouseEvent):void
		{
			rightDisplay.visible = !rightDisplay.visible;
			data.correct = rightDisplay.visible;
		}
		
		protected function inputDisplay_clickHandler(event:MouseEvent):void
		{
			event.stopImmediatePropagation();
		}
		
		
	}
}