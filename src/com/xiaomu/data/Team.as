package com.xiaomu.data
{
	import com.xiaomu.util.UIDUtil;
	
	/**
	 * 小组数据 
	 * @author coco
	 * 
	 */	
	public class Team
	{
		
		/**
		 * 小组唯一标示 
		 */		
		public var id:String = "TEAM_" + UIDUtil.createUID();
		
		/**
		 *  小组名称 
		 */		
		public var name:String;
		
	}
}