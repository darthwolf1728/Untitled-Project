package 
{
	import flash.events.Event;
	public class MainMenuMenu extends MyMenu
	{		
		private static const CommandItem:String = "Item";
		private static const CommandSwitch:String = "Switch";
		private static const CommandStatus:String = "Status";
		private static const CommandAbilities:String = "Abilities";
		private static const CommandJob:String = "Job";

		public function MainMenuMenu() 
		{
		}
		
		protected override function ButtonSelected():void
		{
			//parent is the main menu movie clip
			if (parent != null)
			{
				switch(SelectedButton)
				{
					case CommandItem:
						parent.dispatchEvent(new Event(MainMenu.EventItem));
					break;
					case CommandSwitch:
						parent.dispatchEvent(new Event(MainMenu.EventSwitch));
					break;
					case CommandStatus:
						parent.dispatchEvent(new Event(MainMenu.EventStatus));
					break;
					case CommandAbilities:
						parent.dispatchEvent(new Event(MainMenu.EventAbilities));
					break;
					case CommandJob:
						parent.dispatchEvent(new Event(MainMenu.EventJob));
					break;
				}
			}
		}
	}
}