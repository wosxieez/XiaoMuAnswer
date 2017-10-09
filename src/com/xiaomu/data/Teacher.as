package com.xiaomu.data
{
	import com.xiaomu.util.UIDUtil;
	
	public class Teacher
	{
		
		/**
		 * 教师唯一标示 
		 */		
		public var id:String = "TEACHER_" + UIDUtil.createUID();
		
		/**
		 * 教师名称 
		 */		
		public var name:String;
		
		/**
		 * 教师定的团队 
		 */		
		public var teams:Array = new Array();
		
		/**
		 * 教师下面的学生 
		 */		
		public var students:Array = new Array();
		
		/**
		 * 教师定的题目
		 */		
		public var questions:Array = new Array();
		
		/**
		 * 教师收到的学生答案 
		 */		
		public var answers:Array = new Array();
		
	}
}