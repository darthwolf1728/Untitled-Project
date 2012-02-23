package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class StartingMenu extends MovieClip 
	{
		public function StartingMenu() 
		{
			addEventListener(Event.REMOVED, Unload);
			init();
		}
		
		protected function Unload(event:Event):void
		{
			if (event.target.name == this.name)
			{
				removeChildren();
			}
		}
		
		private function removeChildren():void
		{
			if (numChildren > 0)
			{
				removeChildAt(0);
				removeChildren();
			}
		}
		
		private function init():void
		{
			
		}
	}
}