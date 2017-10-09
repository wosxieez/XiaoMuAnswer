package com.xiaomu.renderer
{
	import coco.component.Image;
	import coco.component.ItemRenderer;
	import coco.event.ItemRendererEvent;
	
	public class HeartItemRenderer extends ItemRenderer
	{
		public function HeartItemRenderer()
		{
			super();
			borderAlpha = 0;
		}
		
		private var icon:Image;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			icon = new Image();
			icon.x = 3;
			icon.y = 3;
			icon.source = "assets/heart.png";
			addChild(icon);
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
		
	}
}