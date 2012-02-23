package 
{
	public class Job_Fisherman extends Job
	{
		public function Job_Fisherman()
		{
			init();
		}
		
		private function init():void
		{
			JobName = "Fisherman";
			PointsToLevel = 25;
			JobId = 6;
		}
	}
}