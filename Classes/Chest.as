package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	
	public class Chest extends MovieClip 
	{		
		public function Chest() 
		{
			init();
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(event:Event):void
		{
			if (Open)
			{
				chestNest.gotoAndStop(2);
			}
			else
			{
				chestNest.gotoAndStop(1);
			}
		}
		
		private function init():void
		{
			
		}
		
		public function get Contents():String
		{
			var tempArray:Array = this.name.split(Constants.MessageSplitCharacter);
			var index:int = tempArray[2];
			return TresureChestManager.ChestArray[index];
		}
		
		public function get ContentsClip():Item
		{
			var copyItem:Class = getDefinitionByName(Contents) as Class;
			return (new copyItem);
		}
		
		public function get Open():Boolean
		{
			var tempArray:Array = this.name.split(Constants.MessageSplitCharacter);
			var index:int = tempArray[2];
			//this.parent.parent.parent is game movieclip
			var theGame:Game = (this.parent.parent.parent as Game);
			return theGame.MainInfo.ChestArray[index];
		}
		
		public function MarkChestOpened():void
		{
			var tempArray:Array = this.name.split(Constants.MessageSplitCharacter);
			var index:int = tempArray[2];
			//this.parent.parent.parent is game movieclip
			var theGame:Game = (this.parent.parent.parent as Game);
			theGame.MainInfo.ChestArray[index] = true;
			chestNest.gotoAndStop(2);
			theGame.MainInfo.ItemNames.push(Contents);
		}

	}
}