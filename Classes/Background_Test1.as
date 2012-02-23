package 
{
	import flash.display.MovieClip;
	
	public class Background_Test1 extends Background 
	{		
		public function Background_Test1() 
		{
			init();
		}
		
		private function init():void
		{
			ExitRight = "Background_Test2";
			
			Messages = new Array
			(
				"Man: Hello!", //0
				Constants.SaveGameDialogue //1
			)
		}
		
		
	}
}