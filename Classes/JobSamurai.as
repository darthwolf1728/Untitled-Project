package 
{
	import flash.display.MovieClip;
	
	public class JobSamurai extends JobButton 
	{
		public function JobSamurai() 
		{
			init();
		}
		
		private function init():void
		{
			BtnJob = new Job_Samurai();
		}
	}
}