package 
{
	public class Job_Professor extends Job
	{
		public function Job_Professor()
		{
			init();
		}
		
		private function init():void
		{
			JobName = "Professor";
			PointsToLevel = 25;
			JobId = 8;
		}
	}
}