package 
{
	import flash.display.MovieClip;
	
	public class JobCowboy extends JobButton
	{
		public function JobCowboy() 
		{
			init();
		}
		
		private function init():void
		{
			BtnJob = new Job_Cowboy();
		}
	}
}