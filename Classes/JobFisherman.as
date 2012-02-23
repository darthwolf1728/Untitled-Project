package 
{
	import flash.display.MovieClip;
	
	public class JobFisherman extends JobButton
	{
		public function JobFisherman() 
		{
			init();
		}
		
		private function init():void
		{
			BtnJob = new Job_Fisherman();
		}
	}
}