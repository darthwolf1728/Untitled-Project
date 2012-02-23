package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	
	public class JobMenu extends MovieClip 
	{
		public var MainInfo:BasicInfo;
		
		private static const defaultString:String = "Change whose job?";
		private static const partyMenuName:String = "partyMenu";
		private static const jobTreeMenuName:String = "jobTreeMenu";
		
		public function JobMenu(basicInfo:BasicInfo) 
		{
			MainInfo = basicInfo;
			
			init();
			
			loadItems();
			
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(Event.REMOVED, Unload);
			messageText.text = defaultString;
		}
		
		private function init():void
		{
			
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
			var partyMenu:MovieClip = null;
			var jobTreeMenu:MovieClip = null;
			
			if (partyPlaceholder.numChildren > 0)
			{
				partyMenu = (partyPlaceholder.getChildByName(partyMenuName) as MovieClip);
				jobTreeMenu = (partyPlaceholder.getChildByName(jobTreeMenuName) as MovieClip);
			}
			if (partyMenu != null && partyMenu.Active)
			{
				if (partyMenu.SelectedObject != null)
				{
					messageText.text = ("Change " + partyMenu.SelectedObject.Stats.Name + "'s job");
				}

				if (Game.XIsPressed)
				{
					if (this.parent != null)
					{
						var mainMenu:MovieClip = (this.parent.parent as MovieClip);
						mainMenu.dispatchEvent(new Event(MainMenu.EventReEnable));
					}
				}
				
				if (Game.ZIsPressed)
				{
					loadJobTree(partyMenu.SelectedObject.Stats);
				}
			}
			if (jobTreeMenu != null)
			{
				if (Game.XIsPressed)
				{
					removeChildren();
					loadItems();
				}
			}
		}
		
		private function removeChildren():void
		{
			if (partyPlaceholder.numChildren > 0)
			{
				partyPlaceholder.removeChildAt(0);
				removeChildren();
			}
		}
		
		private function createStatsArray():Array
		{
			var tempArray:Array = new Array();
			for(var i:int = 0; i < MainInfo.PartyLineup.length; i++)
			{
				var tempStats:StatsMedium = new StatsMedium(MainInfo.PartyLineup[i]);
				tempStats.scaleX = .5;
				tempStats.scaleY = .5;
				tempArray.push(tempStats);
			}
			return tempArray;
		}
		
		private function loadItems():void
		{
			var tempArray:Array = createStatsArray();
			var selectCharacterMenu:MyObjectMenu = new MyObjectMenu(1, tempArray, 0, 6);
			selectCharacterMenu.name = partyMenuName;
			selectCharacterMenu.x = 50;
			partyPlaceholder.addChild(selectCharacterMenu);
		}

		private function loadJobTree(stats:BaseStats):void
		{
			removeChildren();
			var jobTreeTemp:JobTree = new JobTree(stats);
			jobTreeTemp.name = jobTreeMenuName;
			partyPlaceholder.addChild(jobTreeTemp);
		}
	}
}