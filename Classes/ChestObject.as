package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class ChestObject extends MovieClip 
	{		
		public function ChestObject() 
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
			var theChest:Chest = (parent as Chest);
			//this.parent.parent is background
			var tempBackground:Background = (this.parent.parent as Background);
			
			if (tempBackground != null)
			{
				var overworld:Overworld = (tempBackground.parent as Overworld);
				if (overworld != null)
				{
					if (Game.ZIsPressed && this.hitTestObject(overworld.Player) && !overworld.MessageIsShown)
					{
						if (!theChest.Open)
						{
							theChest.MarkChestOpened();
							overworld.DisplayMessage(this.parent.name);
						}
					}
				}
			}
		}
	}
}