package 
{
	public class JobButtonSmall extends MyButton 
	{
		public var ButtonJob:Job;
		
		public function JobButtonSmall(job:Job) 
		{
			init();
			ButtonJob = job;
			
			var buttonName:String = null;
			if (ButtonJob != null)
			{
				buttonName = ("btn" + ButtonJob.JobName);
			}
			InitializeValues(100, 20, 10, buttonName);
		}
		
		private function init():void
		{
			ButtonJob = null;
		}
	}
}