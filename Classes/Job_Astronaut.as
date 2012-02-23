package 
{
	public class Job_Astronaut extends Job
	{
		public function Job_Astronaut()
		{
			init();
		}
		
		private function init():void
		{
			JobName = "Astronaut";
			PointsToLevel = 25;
			JobId = 20;
		}
	}
}