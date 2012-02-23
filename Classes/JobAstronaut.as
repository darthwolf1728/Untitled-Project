package 
{
	import flash.display.MovieClip;
	
	public class JobAstronaut extends JobButton
	{
		public function JobAstronaut() 
		{
			init();
		}
		
		private function init():void
		{
			BtnJob = new Job_Astronaut();
		}
	}
}