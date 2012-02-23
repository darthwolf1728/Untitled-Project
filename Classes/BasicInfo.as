package 
{
	import flash.display.MovieClip;
	
	public class BasicInfo
	{		
		public var PartyLineup:Array;
		public var ItemNames:Array;
		public var UserName:String;
		public var TimePlayed:int;
		public var LastSaved:Date;
		public var ChestArray:Array;
		
		public function BasicInfo() 
		{
			init();
		}
		
		private static function getStartingStats():Array
		{
			return new Array(
				Constants.GetPlayer1StartingStats(), 
				Constants.GetPlayer2StartingStats(), 
				Constants.GetPlayer3StartingStats(),
				Constants.GetPlayer4StartingStats(),
				Constants.GetPlayer5StartingStats(),
				Constants.GetPlayer6StartingStats(),
				Constants.GetPlayer7StartingStats()
				);
		}
		
		private static function getStartingItems():Array
		{
			return new Array("Item_Potion", "Item_Potion", "Item_Potion", "Item_NewTest", "Item_Potion", "Item_Potion", "Item_Potion");
		}
		
		private function getStartingChestArray():Array
		{
			var tempArray:Array = new Array(TresureChestManager.ChestArray.length);
			for (var i:int = 0; i < tempArray.length; i++)
			{
				tempArray[i] = false;
			}
			return tempArray;
		}
		
		private function init():void
		{
			PartyLineup = getStartingStats();
			ItemNames = getStartingItems();
			UserName = Constants.NewFileName;
			TimePlayed = 0;
			LastSaved = null;
			ChestArray = getStartingChestArray();
		}
	}
}