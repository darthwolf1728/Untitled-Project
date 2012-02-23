package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class MyButton_Super extends MovieClip 
	{
		public var buttonText:TextField;
		
		public function MyButton_Super() 
		{
			init();
		}
		
		public function Hit(hitVal:Boolean):void
		{
			if (hitVal)
			{
				gotoAndStop(2);
			}
			else
			{
				gotoAndStop(1);
			}
		}
		
		public function get Active():Boolean
		{
			if (this.alpha == 0)
			{
				return false;
			}
			return true;
		}
	}
}