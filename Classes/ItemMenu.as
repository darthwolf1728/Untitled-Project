package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	
	public class ItemMenu extends MovieClip 
	{
		private static const NoItem:String = "No Item";
		
		public var MainInfo:BasicInfo;
		
		private var itemSelected:Item;
		
		public function ItemMenu(basicInfo:BasicInfo) 
		{
			MainInfo = basicInfo;
			
			init();
			
			loadItems();
			
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(Event.REMOVED, Unload);
			messageText.text = NoItem;
		}
		
		private function init():void
		{
			itemSelected = null;
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
			var selectItemMenu:MovieClip = null;
			var selectCharacterMenu:MovieClip = null;
			
			if (itemMenuPlaceholder.numChildren > 0)
			{
				selectItemMenu = (itemMenuPlaceholder.getChildAt(0) as MovieClip);
			}
			if (itemMenuPlaceholder.numChildren > 0)
			{
				selectCharacterMenu = (partyMenuPlaceholder.getChildAt(0) as MovieClip);
			}
			if (selectItemMenu != null && selectItemMenu.Active)
			{
				if (selectItemMenu.SelectedObject != null)
				{
					messageText.text = selectItemMenu.SelectedObject.DisplayName;
				}
				else
				{
					messageText.text = NoItem;
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
					if (selectCharacterMenu != null && selectItemMenu.SelectedObject != null)
					{
						itemSelected = selectItemMenu.SelectedObject;
						selectItemMenu.Active = false;
						selectCharacterMenu.Active = true;
					}
				}
			}
			else if (selectCharacterMenu != null && selectCharacterMenu.Active)
			{
				if (selectCharacterMenu.SelectedObject != null)
				{
					messageText.text = "Use " + itemSelected.DisplayName + " on " + selectCharacterMenu.SelectedObject.Stats.Name;
				}
				if (Game.XIsPressed)
				{
					itemSelected = null;
					selectCharacterMenu.Active = false;
					selectItemMenu.Active = true;
				}
				
				if (Game.ZIsPressed)
				{
					if (selectCharacterMenu.SelectedObject != null && selectItemMenu != null)
					{
						itemSelected.UseItem(selectCharacterMenu.SelectedObject.Stats);
						selectCharacterMenu.SelectedObject.Refresh();
						MainInfo.ItemNames.splice((selectItemMenu.CurrentIndex - 1), 1);
						selectItemMenu.Refresh();
						itemSelected = null;
						selectCharacterMenu.Active = false;
						selectItemMenu.Active = true;
					}
				}
			}
		}
		
		private function loadItems():void
		{
			var tempItems:Array = new Array();
			for(var j:int = 0; j < MainInfo.ItemNames.length; j++)
			{
				var copyItem:Class = getDefinitionByName(MainInfo.ItemNames[j]) as Class;
				tempItems.push(new copyItem);
			}
			
			var selectItemMenu:MyObjectMenu = new MyObjectMenu(5, tempItems, 20, 20);
			itemMenuPlaceholder.addChild(selectItemMenu);
			
			var tempArray:Array = new Array();
			for(var i:int = 0; i < MainInfo.PartyLineup.length; i++)
			{
				var tempStats:StatsBasic = new StatsBasic(MainInfo.PartyLineup[i]);
				tempStats.scaleX = .5;
				tempStats.scaleY = .5;
				tempArray.push(tempStats);
			}
			
			var selectCharacterMenu:MyObjectMenu = new MyObjectMenu(1, tempArray, 0, 12);
			selectCharacterMenu.Active = false;
			partyMenuPlaceholder.addChild(selectCharacterMenu);
		}
		
		//private function removeMenuChildren():void
//		{
//			while (itemMenuPlaceholder.numChildren > 0)
//			{
//				itemMenuPlaceholder.removeChildAt(0);
//			}
//			
//			while (partyMenuPlaceholder.numChildren > 0)
//			{
//				partyMenuPlaceholder.removeChildAt(0);
//			}
//		}
		
	}
}