package 
{
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class MainMenu extends MovieClip 
	{
		private var MainInfo:BasicInfo;
		
		public static const EventItem:String = "Item";
		public static const EventSwitch:String = "Switch";
		public static const EventStatus:String = "Status";
		public static const EventReEnable:String = "ReEnable";
		public static const EventAbilities:String = "Abilities";
		public static const EventJob:String = "Job";
		
		public function MainMenu(basicInfo:BasicInfo) 
		{
			MainInfo = basicInfo;
			
			init();
			
			setDefaultMenu();
			
			addEventListener(EventSwitch, switchFunc);
			addEventListener(EventItem, item);
			addEventListener(EventStatus, statusFunc);
			addEventListener(EventReEnable, reEnable);
			addEventListener(EventAbilities, abilities);
			addEventListener(EventJob, job);
			addEventListener(Event.ENTER_FRAME, EnterFrame)
			addEventListener(Event.REMOVED, Unload);
		}
		
		private function EnterFrame(event:Event):void
		{
			if (Game.XIsPressed)
			{
				if (mainMenuMenu.Active)
				{
					//parent is Game movieclip
					if (parent != null)
					{
						parent.dispatchEvent(new Event(Game.EventOverworld));
					}
				}
			}
		}
		
		private function Unload(event:Event):void
		{
			if (event.target.name == this.name)
			{
				removeEventListener(Event.ENTER_FRAME, EnterFrame);
			}
		}
		
		private function item(event:Event):void
		{
			mainMenuMenu.Active = false;
			removeMenuChildren();
			menuPlaceholder.addChild(new ItemMenu(MainInfo));
		}
		private function statusFunc(event:Event):void
		{
			mainMenuMenu.Active = false;
			removeMenuChildren();
			menuPlaceholder.addChild(new StatusMenu(MainInfo));
		}
		private function switchFunc(event:Event):void
		{
			mainMenuMenu.Active = false;
			removeMenuChildren();
			menuPlaceholder.addChild(new SwitchMenu(MainInfo));
		}
		private function abilities(event:Event):void
		{
			mainMenuMenu.Active = false;
			removeMenuChildren();
			menuPlaceholder.addChild(new AbilitiesMenu(MainInfo));
		}
		private function job(event:Event):void
		{
			mainMenuMenu.Active = false;
			removeMenuChildren();
			menuPlaceholder.addChild(new JobMenu(MainInfo));
		}
		
		private function reEnable(event:Event):void
		{
			setDefaultMenu();
		}
		
		private function setDefaultMenu():void
		{
			mainMenuMenu.Active = true;
			removeMenuChildren();
			menuPlaceholder.addChild(new MainMenuDefault(MainInfo));
		}
		
		private function removeMenuChildren():void
		{
			while (menuPlaceholder.numChildren > 0)
			{
				menuPlaceholder.removeChildAt(0);
			}
		}
	}
}