package 
{
	public class Job_Magician extends Job
	{
		public function Job_Magician()
		{
			init();
		}
		
		private function init():void
		{
			JobName = "Magician";
			PointsToLevel = 25;
			JobId = 2;
		}
	}
}