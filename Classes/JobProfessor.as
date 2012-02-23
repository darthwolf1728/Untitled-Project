package 
{
	import flash.display.MovieClip;
	
	public class JobProfessor extends JobButton
	{
		public function JobProfessor() 
		{
			init();
		}
		
		private function init():void
		{
			BtnJob = new Job_Professor();
		}
	}
}