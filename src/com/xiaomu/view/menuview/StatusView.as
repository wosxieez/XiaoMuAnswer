package com.xiaomu.view.menuview
{
	import com.xiaomu.manager.ServiceManager;
	
	import coco.component.Label;
	import coco.component.SkinComponent;
	import coco.event.SocketEvent;
	
	public class StatusView extends SkinComponent
	{
		public function StatusView()
		{
			super();
			
			height = 25;
			ServiceManager.getInstance().addEventListener(SocketEvent.LOG, logMessage);
		}
		
		private var titleDisplay:Label;
		
		override  protected function createChildren():void
		{
			super.createChildren();
			
			titleDisplay = new Label();
			titleDisplay.fontSize = 10;
			titleDisplay.color = 0x6C6C6C;
			addChild(titleDisplay);
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			titleDisplay.height = height;
			titleDisplay.width = width;
		}
		
		protected function logMessage(event:SocketEvent):void
		{
			if (titleDisplay)
				titleDisplay.text = event.descript;
		}		
		
	}
}