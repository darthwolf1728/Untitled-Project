package 
{
	public class Job_None extends Job
	{
		public function Job_None()
		{
			init();
		}
		
		private function init():void
		{
			JobName = "No Job";
			PointsToLevel = 25;
			JobId = 0;
			
			JpCheckpoint1 = 5;
			JpCheckpoint2 = 10;
			JpCheckpoint3 = 15;
			JpCheckpoint4 = 20;
		}
	}
}