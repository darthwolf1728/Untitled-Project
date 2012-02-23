package 
{
	public class Job_Doctor extends Job
	{
		public function Job_Doctor()
		{
			init();
		}
		
		private function init():void
		{
			JobName = "Doctor";
			PointsToLevel = 25;
			JobId = 9;
		}
	}
}