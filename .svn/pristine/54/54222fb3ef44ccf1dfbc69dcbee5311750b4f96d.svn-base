package com.xiaomu.view.teamview
{
	import com.xiaomu.data.Team;
	import com.xiaomu.manager.DataManager;
	
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import coco.component.Alert;
	import coco.component.Button;
	import coco.component.Panel;
	import coco.component.TextInput;
	import coco.manager.PopUpManager;
	
	/**
	 * 添加小组视图 
	 * @author coco
	 * 
	 */	
	public class AddTeamView extends Panel
	{
		public function AddTeamView()
		{
			super();
			
			width = 250;
			height = 120;
		}
		
		//---------------------------------------------------------------------------------------------------------------------
		//
		//  Get Instance
		//
		//---------------------------------------------------------------------------------------------------------------------
		
		private static var instance:AddTeamView;
		
		public static function getInstance():AddTeamView
		{
			if (!instance)
				instance = new AddTeamView();
			
			return instance;
		}
		
		
		//---------------------------------------------------------------------------------------------------------------------
		//
		//  Variables
		//
		//---------------------------------------------------------------------------------------------------------------------
		
		private var teamNameInput:TextInput;
		private var cancelButton:Button;
		private var okButton:Button;
		private var currentTeam:Team;
		
		
		//---------------------------------------------------------------------------------------------------------------------
		//
		//  Methods
		//
		//---------------------------------------------------------------------------------------------------------------------
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			teamNameInput = new TextInput();
			teamNameInput.x = 10;
			teamNameInput.height = 30;
			teamNameInput.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			addChild(teamNameInput);
			
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
			
			teamNameInput.text = currentTeam ? currentTeam.name : "";
			teamNameInput.setSelection(0, 100);
		}
		
		override protected function updateDisplayList():void
		{
			super.updateDisplayList();
			
			cancelButton.width = width/2;
			cancelButton.y = contentHeight - cancelButton.height;
			
			okButton.width = cancelButton.width;
			okButton.x = cancelButton.width;
			okButton.y = cancelButton.y;
			
			teamNameInput.width = width - 20;
			teamNameInput.y = (contentHeight - okButton.height - teamNameInput.height) / 2;
		}
		
		protected function okButton_clickHandler(event:MouseEvent):void
		{
			if (!teamNameInput.text || teamNameInput.text.length == 0)
			{
				Alert.show("请输入小组名称");
				return;
			}
			
			if (currentTeam)
			{
				// team update
				currentTeam.name = teamNameInput.text;
				DataManager.getInstance().updateTeam(currentTeam);
			}
			else
			{
				// team new
				currentTeam = new Team();
				currentTeam.name = teamNameInput.text;
				DataManager.getInstance().addTeam(currentTeam);
			}
			
			// 关闭窗口
			PopUpManager.removePopUp(this);
		}
		
		protected function cancelButton_clickHandler(event:MouseEvent):void
		{
			// 关闭窗口
			PopUpManager.removePopUp(this);
		}
		
		public function open(team:Team = null):void
		{
			currentTeam = team;
			
			if (currentTeam)
				title = "编辑小组";
			else
				title = "添加小组";
			invalidateProperties();
			PopUpManager.centerPopUp(PopUpManager.addPopUp(this, null, true, false, 0));
		}
		
		protected function keyDownHandler(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.ENTER)
			{
				okButton_clickHandler(null);
			}
		}
		
	}
}