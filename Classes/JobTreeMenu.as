package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class JobTreeMenu extends MyMenu
	{
		public function JobTreeMenu() 
		{
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(Event.REMOVED, Unload);
		}
		
		protected override function EnterFrame(event:Event):void
		{
			if (Active)
			{
				if (Game.UpIsPressed || Game.RightIsPressed)
				{
					CurrentIndex++;
					hitButton(true, CurrentIndex);
				}
				if (Game.DownIsPressed || Game.LeftIsPressed)
				{
					CurrentIndex--;
					hitButton(false, CurrentIndex);
				}
				if (Game.ZIsPressed)
				{
					ButtonSelected();
				}
			}
		}
	}
}