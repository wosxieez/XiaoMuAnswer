package com.xiaomu.component
{
	import flash.events.MouseEvent;
	
	import coco.component.Image;
	import coco.core.UIComponent;
	import coco.manager.IToolTip;
	
	
	/**
	 * 图标按钮 
	 * @author coco
	 */	
	public class IconButton extends UIComponent implements IToolTip
	{
		public function IconButton()
		{
			super();
			
			width = 24;
			height = 24;
			mouseChildren = false;
			addEventListener(MouseEvent.MOUSE_OVER, this_mouseOverHandler);
			addEventListener(MouseEvent.MOUSE_OUT, this_mouseOutHandler);
			addEventListener(MouseEvent.MOUSE_DOWN, this_mouseDownHandler);
			addEventListener(MouseEvent.MOUSE_UP, this_mouseUpHandler);
		}
		
		
		//---------------------------------------------------------------------------------------------------------------------
		//
		// Properties
		//
		//---------------------------------------------------------------------------------------------------------------------
		
		protected var imageDisplay:Image;
		
		//-----------------
		// source
		//-----------------
		
		private var _source:Object;
		
		public function get source():Object
		{
			return _source;
		}
		
		public function set source(value:Object):void
		{
			if (_source == value) return;
			_source = value;
			invalidateProperties();
		}
		
		//-----------------
		// mouseOver
		//-----------------
		
		private var _mouseOver:Boolean = false;
		
		public function get mouseOver():Boolean
		{
			return _mouseOver;
		}
		
		public function set mouseOver(value:Boolean):void
		{
			if (_mouseOver == value) return;
			_mouseOver = value;
			invalidateSkin();
		}
		
		//-----------------
		// mouseDown
		//-----------------
		
		private var _mouseDown:Boolean = false;
		
		public function get mouseDown():Boolean
		{
			return _mouseDown;
		}
		
		public function set mouseDown(value:Boolean):void
		{
			if (_mouseDown == value) return;
			_mouseDown = value;
			invalidateSkin();
		}
		
		//-----------------
		// toolTip
		//-----------------
		
		private var _toolTip:String;

		public function get toolTip():String
		{
			return _toolTip;
		}

		public function set toolTip(value:String):void
		{
			_toolTip = value;
		}
		
		
		//---------------------------------------------------------------------------------------------------------------------
		//
		// Methods
		//
		//---------------------------------------------------------------------------------------------------------------------
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			imageDisplay = new Image();
			addChild(imageDisplay);
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			imageDisplay.source = source;
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			imageDisplay.width = width - 6;
			imageDisplay.height = height - 6;
			imageDisplay.x = (width - imageDisplay.width) / 2;
			imageDisplay.y = (height - imageDisplay.height) / 2;
		}
		
		override protected function drawSkin():void
		{
			// over FFFDF9
			// normal F8F3E4
			graphics.clear();
			if (mouseOver && !mouseDown)
				graphics.beginFill(0x000000, .2);
			else
				graphics.beginFill(0x000000, 0);
			graphics.drawRoundRectComplex(0, 0, width, height, 2, 2, 2, 2);
			graphics.endFill();
		}
		
		protected function this_mouseOverHandler(event:MouseEvent):void
		{
			mouseOver = true;
		}
		
		protected function this_mouseOutHandler(event:MouseEvent):void
		{
			mouseOver = mouseDown = false;
		}	
		
		protected function this_mouseDownHandler(event:MouseEvent):void
		{
			mouseDown = true;
		}
		
		protected function this_mouseUpHandler(event:MouseEvent):void
		{
			mouseDown = false;
		}
		
	}
}
