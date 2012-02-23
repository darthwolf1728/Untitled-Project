package 
{
	public class Job_Cowboy extends Job
	{
		public function Job_Cowboy()
		{
			init();
		}
		
		private function init():void
		{
			JobName = "Cowboy";
			PointsToLevel = 25;
			JobId = 12;
		}
	}
}