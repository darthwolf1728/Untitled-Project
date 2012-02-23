package 
{
	import flash.display.MovieClip;
	
	public class JobMagician extends JobButton
	{
		public function JobMagician() 
		{
			init();
		}
		
		private function init():void
		{
			BtnJob = new Job_Magician();
		}
	}
}