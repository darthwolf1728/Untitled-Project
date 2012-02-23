package 
{
	import flash.display.MovieClip;
	
	public class JobFirefighter extends JobButton
	{
		public function JobFirefighter() 
		{
			init();
		}
		
		private function init():void
		{
			BtnJob = new Job_Firefighter();
		}
	}
}