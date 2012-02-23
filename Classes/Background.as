package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class Background extends MovieClip 
	{		
		public var ExitLeft:String;
		public var ExitRight:String;
		public var ExitUp:String;
		public var ExitDown:String;
		public var Messages:Array;
		
		protected static const EventRemoveBackground = "EventRemoveBackground";
		
		public function Background() 
		{
			addEventListener(Event.REMOVED, Unload);
			addEventListener(Event.ENTER_FRAME, EnterFrame);
		}

		private function Unload(event:Event):void
		{
			if (event.target.name == this.name)
			{
				//removeChildren();
				removeEventListener(Event.ENTER_FRAME, EnterFrame);
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
		
		private function EnterFrame(event:Event):void
		{
			//this.parent is overworld
			var overworld:Overworld = (this.parent as Overworld);
			var player:OverworldPlayer = null;
			
			if (overworld != null)
			{
				player = overworld.Player;
				if (player != null)
				{
					if (player.x > this.width)
					{
						if (ExitRight != null)
						{
							overworld.AddContent(ExitRight, 0, player.y);
						}
					}
					if (player.x < (0 - player.width))
					{
						if (ExitLeft != null)
						{
							overworld.AddContent(ExitLeft, (stage.width - (player.width * 2)), player.y);
						}
					}
				}
			}
		}
		
	}
}