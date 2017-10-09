package com.xiaomu.data
{
	/**
	 * 答案
	 *  
	 * @author coco
	 */	
	public class Answer
	{
		/**
		 * 题目内容
		 */	
		public var name:String;
		/**
		 * 答案所属学生的ID 
		 */		
		public var studentID:String;
		
		/**
		 * 答案所属问题的ID 
		 */		
		public var questionID:String;
		
		/**
		 * 学生的答案 
		 */		
		public var answers:Array = [];
		
		/**
		 * 答案是否正确 
		 */		
		public var correct:Boolean = false;
		
	}
}