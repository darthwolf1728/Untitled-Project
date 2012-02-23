package 
{
	import flash.display.MovieClip;
	
	public class JobButton extends MyButton_Super 
	{
		public var BtnJob:Job;
		public function JobButton() 
		{
			init();
		}
		
		private function init():void
		{
			BtnJob = new Job();
		}
	}
}