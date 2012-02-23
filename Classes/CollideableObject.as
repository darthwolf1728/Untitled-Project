package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class CollideableObject extends MovieClip 
	{		
		public function CollideableObject() 
		{
			init();
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(Event.REMOVED, Unload);
		}
		
		private function init():void
		{
			this.alpha = 0;
		}
		
		private function Unload(event:Event):void
		{
			if (event.target.name == this.name)
			{
				removeEventListener(Event.ENTER_FRAME, EnterFrame);
			}
		}
		
		private function EnterFrame(event:Event):void
		{
			//this.parent.parent.parent is overworld
			var overworld:Overworld = (this.parent.parent.parent as Overworld);
			
			if (overworld != null)
			{
				if (this.hitTestObject(overworld.Player))
				{
					overworld.Player.StopPlayer();
				}
			}
		}
	}
}