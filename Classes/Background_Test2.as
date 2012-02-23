package 
{
	import flash.display.MovieClip;
	
	public class Background_Test2 extends Background 
	{		
		public function Background_Test2() 
		{
			init();
		}
		
		private function init():void
		{
			ExitLeft = "Background_Test1";
			
			Messages = new Array
			(
				"Man: What's up?", //0
				"You got a " + chest_1_0.ContentsClip.DisplayName //1
			)
		}
	}
}