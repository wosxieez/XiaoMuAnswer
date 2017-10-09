package com.xiaomu.data
{
	import com.xiaomu.util.UIDUtil;
	
	public class Student
	{

		/**
		 * 学生唯一标示 
		 */		
		public var id:String = "STUDENT_" + UIDUtil.createUID();
		
		/**
		 * 学生姓名
		 */		
		public var name:String;
		
		/**
		 * 学生所属的团队id
		 */		
		public var teamID:String;
		
		public var correctCount:int = 0;
		
	}
}