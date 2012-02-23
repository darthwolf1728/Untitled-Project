package 
{
	import flash.net.registerClassAlias;
	import flash.net.SharedObject;
	
	public class SaveGameManager
	{
		private static function registerAliases():void
		{
			registerClassAlias("BasicInfo", BasicInfo);
			registerClassAlias("BaseStats", BaseStats);
			
			registerClassAlias("Job", Job);
			registerClassAlias("Job_None", Job_None);
			
			registerClassAlias("Ability", Ability);
			registerClassAlias("Ability_None", Ability_None);
			
			registerClassAlias("Equipment", Equipment);
			registerClassAlias("Equipment_None", Equipment_None);
		}
		
		public static function SaveGame(theGame:Game):void
		{
			registerAliases();
			var sharedObject:SharedObject = SharedObject.getLocal( Constants.GameName );

			if (sharedObject.data.MainInfoArray == null)
			{
				var tempArray:Array = new Array();
				for (var i:int = 0; i < Constants.NumSaveFiles; i++)
				{
					tempArray.push(new BasicInfo());
				}
				
				sharedObject.data.MainInfoArray = tempArray;
			}
			theGame.MainInfo.LastSaved = new Date();
			sharedObject.data.MainInfoArray[theGame.SlotNumber] = theGame.MainInfo;
			sharedObject.flush();
		}
		
		public static function LoadGame(slot:int):BasicInfo
		{
			registerAliases();
			var sharedObject:SharedObject = SharedObject.getLocal( Constants.GameName );
			return sharedObject.data.MainInfoArray[slot];
		}
		
		public static function LoadMainInfoSlots():Array
		{
			registerAliases();
			var sharedObject:SharedObject = SharedObject.getLocal( Constants.GameName );
			//sharedObject.clear();
			//sharedObject.flush();
			return sharedObject.data.MainInfoArray;
		}
		
		public static function DeleteGame(slot:int):void
		{
			registerAliases();
			var sharedObject:SharedObject = SharedObject.getLocal( Constants.GameName );
			sharedObject.data.MainInfoArray[slot] = null;
			sharedObject.flush();
		}
	}
}