package
{
	import com.xiaomu.component.AppLoading;
	import com.xiaomu.event.VersionEvent;
	import com.xiaomu.manager.DataManager;
	import com.xiaomu.manager.ServiceManager;
	import com.xiaomu.manager.VersionManager;
	import com.xiaomu.view.homeview.HomeView;
	import com.xiaomu.view.menuview.MenuView;
	import com.xiaomu.view.menuview.StatusView;
	
	import flash.desktop.NativeApplication;
	import flash.display.Screen;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	import coco.component.Alert;
	import coco.core.Application;
	import coco.event.UIEvent;
	import coco.manager.PopUpManager;
	import coco.manager.ToolTipManager;
	import coco.util.CocoUI;
	
	/**
	 * 小木答题-教师端
	 * @author coco
	 */	
	[SWF(width="1024", height="700")]
	public class XiaoMuAnswer extends Application
	{
		public function XiaoMuAnswer()
		{
			super();
			
			ToolTipManager.application = this; // init tooltip manager
			CocoUI.fontSize = 14;
			
			//			CocoUI.fontColor = 0xFFFFFF;
			//			CocoUI.fontBold = true;
			//			CocoUI.themeBackgroundColor = 0xF9F4E6;
			//			CocoUI.themeBorderThickness = 2;
			//			CocoUI.themeBorderColor = Theme.COLOR1;
			//			CocoUI.themeRadius = 5;
			//			CocoUI.themeBackgroundColorSelected = Theme.COLOR5;
			
			autoDrawSkin = true;
			borderAlpha = backgroundAlpha = 0;
			DataManager.getInstance().restoreAppData();
			addEventListener(Event.ADDED_TO_STAGE, this_addedToStageHandler);
			
			var localXML:XML = NativeApplication.nativeApplication.applicationDescriptor;
			var nss:Namespace = localXML.namespace();
			DataManager.getInstance().appVersionNumber = localXML.nss::versionNumber;
			DataManager.getInstance().appVersionLabel = localXML.nss::versionLabel;
		}
		
		
		private var menuView:MenuView;
		private var homeView:HomeView;
		private var statusView:StatusView;
		private var appLoading:AppLoading;
		
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			homeView = new HomeView();
			homeView.y = 40;
			addChild(homeView);
			
			menuView = new MenuView();
			menuView.height = 40;
			addChild(menuView);
			
			statusView = new StatusView();
			addChild(statusView);
			
			// 500毫秒后开始检查版本更新
			setTimeout(initApplication, 500);
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			menuView.width = width;
			
			statusView.width = width;
			statusView.y = height - statusView.height;
			
			homeView.width = width;
			homeView.height = statusView.y - homeView.y;
		}
		
		protected function this_addedToStageHandler(event:Event):void
		{
			// 程序居中代码
			stage.nativeWindow.x = Screen.mainScreen.visibleBounds.x + 
				(Screen.mainScreen.visibleBounds.width - stage.stageWidth) / 2;
			stage.nativeWindow.y = Screen.mainScreen.visibleBounds.y +
				(Screen.mainScreen.visibleBounds.height - stage.stageHeight) / 2;
			
			stage.nativeWindow.addEventListener(Event.CLOSING, stage_closeingHandler);
		}
		
		private function initApplication():void
		{
			// checkAppVersion();
			
			ServiceManager.getInstance().init(this);
		}
		
		
		//--------------------------------------------------------------------------------------------------------------------------------
		//
		//	版本更新逻辑
		//
		//--------------------------------------------------------------------------------------------------------------------------------
		
		/**
		 * 检查程序版本更新
		 */		
		private function checkAppVersion():void
		{
			VersionManager.getInstance().addEventListener(VersionEvent.CHECK_RESULT, version_checkResultHandler);
			VersionManager.getInstance().checkVersion();
		}
		
		protected function version_checkResultHandler(event:VersionEvent):void
		{
			if (event.available)
			{
				Alert.show(
					"最新版本:" + VersionManager.getInstance().latestVersionLabel +
					"\r当前版本:" + VersionManager.getInstance().curVersionLabel + 
					"\r\r发现新版应用程序，是否立即更新", 
					"版本提示", 
					Alert.OK|Alert.CANCEL, 
					versionCloseHandler);
			}
		}
		
		private function versionCloseHandler(e:UIEvent):void
		{
			if (e.detail == Alert.OK)
			{
				appLoading = new AppLoading();
				PopUpManager.addPopUp(appLoading, null, true);
				PopUpManager.centerPopUp(appLoading);
				
				VersionManager.getInstance().addEventListener(VersionEvent.PROGRESS, version_processHandler);
				VersionManager.getInstance().addEventListener(VersionEvent.DOWNLOAD_RESULT, version_downloadResultHandler);
				VersionManager.getInstance().download();
			}
		}
		
		protected function version_processHandler(event:VersionEvent):void
		{
			appLoading.value = event.progressValue / 100;
		}
		
		protected function version_downloadResultHandler(event:VersionEvent):void
		{
			// 新版本下载完毕， 开始安装更新
			VersionManager.getInstance().install();
		}
		
		protected function stage_closeingHandler(event:Event):void
		{
			// 关闭之前存储程序数据
			DataManager.getInstance().storeAppData();
			ServiceManager.getInstance().dispose();
			stage.nativeWindow.close();
		}
		
	}
}