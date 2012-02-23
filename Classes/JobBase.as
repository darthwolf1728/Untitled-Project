package 
{
	import flash.display.MovieClip;
	
	public class JobBase extends JobButton
	{
		public function JobBase() 
		{
			init();
		}
		
		private function init():void
		{
			BtnJob = new Job_None();
		}
	}
}