package 
{
	import flash.events.Event;
	public class MenuDefault extends MyMenu 
	{
		private static const CommandAttack:String = "Attack";
		private static const CommandAbility:String = "Ability";
		private static const CommandSwitch:String = "Switch";
		private static const CommandItem:String = "Win Battle";
		private static const CommandWait:String = "Wait";
		
		public function MenuDefault() 
		{
		}
		
		protected override function ButtonSelected():void
		{
			//parent.parent is the battle movie clip
			if (parent != null && parent.parent != null)
			{
				switch(SelectedButton)
				{
					case CommandAttack:
						parent.parent.dispatchEvent(new Event(Battle.EventAttack));
					break;
					case CommandAbility:
					break;
					case CommandSwitch:
					break;
					case CommandItem:
						parent.parent.parent.dispatchEvent(new Event(Game.EventOverworld));
					break;
					case CommandWait:
						parent.parent.dispatchEvent(new Event(Battle.EventWait));
					break;
				}
			}
		}
	}
}