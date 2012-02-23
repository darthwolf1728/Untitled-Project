package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	
	public class LoadGameMenu_ extends MovieClip 
	{
		public var MenuType:int;
		
		private static const slotMenuName:String = "slotMenuName";
		
		public static const MenuTypeNewGame:int = 1;
		public static const MenuTypeDeleteGame:int = 2;
		public static const MenuTypeLoadGame:int = 3;
		
		public var SelectedSlot:int;
		
		public function LoadGameMenu_(menuType:int) 
		{
			init();
			MenuType = menuType;
			createObjects();
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(Event.REMOVED, Unload);
		}
		
		private function init():void
		{
			SelectedSlot = -1;
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
			var slotsMenu:MovieClip = null;
			
			if (slotPlaceholder.numChildren > 0)
			{
				slotsMenu = (slotPlaceholder.getChildByName(slotMenuName) as MovieClip);
			}
			if (slotsMenu != null && slotsMenu.Active)
			{
				if (Game.XIsPressed)
				{
					if (this.parent != null)
					{
						var mainMenu:StartingMenuPlaceholder = (this.parent.parent as StartingMenuPlaceholder);
						mainMenu.DisplayStartingMenu();
					}
				}
				
				if (Game.ZIsPressed)
				{
					if (this.parent != null)
					{
						if (MenuType == MenuTypeNewGame)
						{
							if (slotsMenu.SelectedObject.Name == Constants.NewFileName)
							{
								var theGame:Game = (this.parent.parent.parent as Game);
								theGame.SlotNumber = (slotsMenu.CurrentIndex - 1);
								var mainMenuPlaceholder:StartingMenuPlaceholder = (this.parent.parent as StartingMenuPlaceholder);
								mainMenuPlaceholder.GoToUserInfoInput();
							}
						}
						else if (MenuType == MenuTypeDeleteGame)
						{
							if (slotsMenu.SelectedObject.Name != Constants.NewFileName)
							{
								SelectedSlot = (slotsMenu.CurrentIndex - 1);
								slotsMenu.Active = false;
								surePlaceholder.addChild(new ConfirmDeleteMenu());
							}
						}
						else if (MenuType == MenuTypeLoadGame)
						{
							if (slotsMenu.SelectedObject.Name != Constants.NewFileName)
							{
								var theGame2:Game = (this.parent.parent.parent as Game);
								var slotNum:int = (slotsMenu.CurrentIndex - 1);
								theGame2.SlotNumber = slotNum;
								theGame2.MainInfo = SaveGameManager.LoadGame(slotNum);
								var mainMenuPlaceholder2:StartingMenuPlaceholder = (this.parent.parent as StartingMenuPlaceholder);
								mainMenuPlaceholder2.StartNewGame();
							}
						}
					}
				}
			}
		}
		
		public function ConfirmDeleteYes():void
		{
			SaveGameManager.DeleteGame(SelectedSlot);
			SelectedSlot = -1;
			deleteConfirmDialouge();
			createObjects();
		}
		
		public function ConfirmDeleteNo():void
		{
			var slotsMenu:MovieClip = null;
			
			if (slotPlaceholder.numChildren > 0)
			{
				slotsMenu = (slotPlaceholder.getChildByName(slotMenuName) as MovieClip);
			}
			
			deleteConfirmDialouge();
			slotsMenu.Active = true;
		}
		
		private function deleteConfirmDialouge():void
		{
			if (surePlaceholder.numChildren > 0)
			{
				surePlaceholder.removeChildAt(0);
				deleteConfirmDialouge();
			}
		}
		
		private function deleteSlots():void
		{
			if (slotPlaceholder.numChildren > 0)
			{
				slotPlaceholder.removeChildAt(0);
				deleteSlots();
			}
		}
		
		private function createObjects():void
		{
			deleteSlots();
			var existingMainInfoArray:Array = SaveGameManager.LoadMainInfoSlots();
			
			if (existingMainInfoArray == null)
			{
				existingMainInfoArray = new Array();
				for(var i:int = 0; i < Constants.NumSaveFiles; i++)
				{
					existingMainInfoArray.push(new BasicInfo());
				}
			}
			
			var tempArray:Array = new Array();
			for(var j:int = 0; j < Constants.NumSaveFiles; j++)
			{
				var tempBasicInfo:BasicInfo = existingMainInfoArray[j];
				if (tempBasicInfo == null)
				{
					tempBasicInfo = new BasicInfo();
				}
				tempArray.push(new Slot(tempBasicInfo.UserName, tempBasicInfo.TimePlayed, tempBasicInfo.LastSaved));
			}
			
			var slots:MyObjectMenu = new MyObjectMenu(1, tempArray, 0, 15);
			slots.name = slotMenuName;
			slotPlaceholder.addChild(slots);
		}
	}
}