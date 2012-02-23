package 
{
	import flash.display.MovieClip;
	
	public class JobAssassin extends JobButton 
	{
		public function JobAssassin() 
		{
			init();
		}
		
		private function init():void
		{
			BtnJob = new Job_Assassin();
		}
	}
}