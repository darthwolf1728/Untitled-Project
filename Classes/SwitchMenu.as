package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	
	public class SwitchMenu extends MovieClip 
	{
		public var MainInfo:BasicInfo;
		
		private static const defaultString:String = "Switch Who?";
		private var selectedChar1:MovieClip = null;
		
		public function SwitchMenu(basicInfo:BasicInfo) 
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
			
			if (partyPlaceholder.numChildren > 0)
			{
				partyMenu = (partyPlaceholder.getChildAt(0) as MovieClip);
			}
			if (partyMenu != null && partyMenu.Active)
			{
				if (selectedChar1 == null)
				{
					if (partyMenu.SelectedObject != null)
					{
						messageText.text = ("Switch " + partyMenu.SelectedObject.Stats.Name);
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
						selectedChar1 = partyMenu.SelectedObject;
					}
				}
				else
				{
					if (partyMenu.SelectedObject != null)
					{
						if (partyMenu.SelectedObject == selectedChar1)
						{
							messageText.text = ("Switch " + selectedChar1.Stats.Name + "'s row");
						}
						else
						{
							messageText.text = ("Switch " + selectedChar1.Stats.Name + " with " + partyMenu.SelectedObject.Stats.Name);
						}
					}
					if (Game.XIsPressed)
					{
						selectedChar1 = null;
					}
					if (Game.ZIsPressed)
					{
						if (partyMenu.SelectedObject == selectedChar1)
						{
							partyMenu.SelectedObject.Stats.SwitchRow();
							partyMenu.SelectedObject.Refresh();
						}
						else
						{
							var tempStats:BaseStats = null;
							var tempIndex:int = 0;
							var tempIndex2:int = (partyMenu.CurrentIndex - 1);
							for (var i:int = 0; i < MainInfo.PartyLineup.length; i++)
							{
								if  (selectedChar1.Stats == MainInfo.PartyLineup[i])
								{
									tempIndex = i;
									break;
								}
							}
							tempStats = MainInfo.PartyLineup[tempIndex2];
							MainInfo.PartyLineup[tempIndex2] = MainInfo.PartyLineup[tempIndex];
							MainInfo.PartyLineup[tempIndex] = tempStats;
							var tempArray:Array = createStatsArray();
							partyMenu.ItemCollection = tempArray;
							partyMenu.Refresh();
						}
						selectedChar1 = null;
					}
				}
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
			partyPlaceholder.addChild(selectCharacterMenu);
		}

	}
}