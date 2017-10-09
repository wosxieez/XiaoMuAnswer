package com.xiaomu.renderer
{
	import com.xiaomu.manager.DataManager;
	
	import flash.events.ContextMenuEvent;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	
	import coco.component.Image;
	import coco.component.ItemRenderer;
	import coco.event.ItemRendererEvent;
	import coco.manager.IToolTip;
	
	public class HeartItemRenderer extends ItemRenderer implements IToolTip
	{
		public function HeartItemRenderer()
		{
			super();
			borderAlpha = 0;
			
			var reward:ContextMenuItem = new ContextMenuItem("取消星星");
			reward.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, reward_clickHandler);
			
			var menu:ContextMenu = new ContextMenu();
			menu.items = [reward];
			contextMenu = menu;
		}
		
		private var icon:Image;
		
		private var _toolTip:String;
		
		public function get toolTip():String
		{
			return _toolTip;
		}
		
		public function set toolTip(value:String):void
		{
			_toolTip = value;
		}
		
		override public function set data(value:Object):void
		{
			super.data = value;
			invalidateProperties();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			icon = new Image();
			icon.x = 3;
			icon.y = 3;
			addChild(icon);
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if (data)
			{
				icon.source = data.correct ? "assets/heart.png" : "assets/heart2.png";
				
				if (String(data.name).length >10)
					toolTip = String(data.name).substr(0, 10);
				else
					toolTip = data.name;
			}
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			icon.width = width - 6;
			icon.height = height - 6;
		}
		
		override protected function this_selectedHandler(event:ItemRendererEvent):void
		{
			event.preventDefault();
		}
		
		protected function reward_clickHandler(event:ContextMenuEvent):void
		{
			DataManager.getInstance().removeAnswer(data.studentID, data.questionID);
		}
		
	}
}