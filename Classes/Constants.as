package
{
	public class Constants
	{		
		public static const BarType_HEALTH:int = 1;
		public static const BarType_MAGIC:int = 2;
		public static const BarType_ACTION:int = 3;
		public static const BarType_EXP:int = 4;
		public static const BarType_JP:int = 5;
		
		public static const NewlineCharacter = "^";
		
		public static const CommandSplitCharacter = "~";
		public static const Command_SaveGame = "Command_SaveGame";
		public static const Command_TreasureChest = "Command_TreasureChest";
		public static const Command_ContinuePlaying = "Command_ContinuePlaying";
		
		public static const SaveGameDialogue = "Would you like to save your game?" + CommandSplitCharacter + Command_SaveGame;
		public static const ContinuePlayingDialogue = "Continue Playing?" + CommandSplitCharacter + Command_ContinuePlaying;
		
		public static const GameName:String = "AwesomeGame";
		
		public static const NumPartyMembers:int = 7;
		public static const NumSaveFiles = 3;
		
		public static const MaxActionPoints:int = 100;
		public static const MaxExperiencePoints:int = 100;
		
		public static const GameSpeed:int = 1;
		public static const GameSpeedDivisor:int = 15;
		
		public static const NewFileName = "[New Game]";
		
		public static const ButtonSplitName:String = "btn";
		public static const ButtonSplitError:String = "ERROR";
		public static const StringSplitName:String = "string";
		public static const MessageSplitCharacter = "_";
		
		public static const Keyboard_Z:int = 90;
		public static const Keyboard_X:int = 88;
		public static const Keyboard_C:int = 67;
		
		public static const AbilitiesPerJob = 5;
		
		public static function GetAllJobs():Array
		{
			return new Array
			(
			 	new Job_None(),
				new Job_Pirate(),
				new Job_Magician(),
				new Job_Criminal(),
				new Job_MMAFighter(),
				new Job_Nerd(),
				new Job_Fisherman(),
				new Job_Policeman(),
				new Job_Professor(),
				new Job_Doctor(),
				new Job_BetterMagician(),
				new Job_Arsonist(),
				new Job_Cowboy(),
				new Job_Millionaire(),
				new Job_SumoWrestler(),
				new Job_Firefighter(),
				new Job_Hunter(),
				new Job_Sage(),
				new Job_Sorceror(),
				new Job_Samurai(),
				new Job_Astronaut(),
				new Job_BestMagician(),
				new Job_Assassin()
			 )
		}
		
		public static function GetJobByJobId(jobId:int):Job
		{
			var allJobs:Array = GetAllJobs();
			for (var i:int = 0; i < allJobs.length; i++)
			{
				if (allJobs[i].JobId == jobId)
				{
					return allJobs[i];
				}
			}
			return null;
		}
		
		public static function GetPlayer1StartingStats():BaseStats
		{
			var tempBaseStats:BaseStats = new BaseStats();
			
			tempBaseStats.BaseMaxHealth = 5;
			tempBaseStats.Health = 5;
			tempBaseStats.BaseMaxMagic = 5;
			tempBaseStats.Magic = 5;
			tempBaseStats.Name = "Name1";
			tempBaseStats.BaseSpeed = 0;
			tempBaseStats.PortraitClipName = "Portrait1";
			tempBaseStats.job = new Job_None();
			tempBaseStats.FrontRow = true;
			tempBaseStats.JP = 0;
			tempBaseStats.Experience = 0;
			
			return tempBaseStats;
		}
		
		public static function GetPlayer2StartingStats():BaseStats
		{
			var tempBaseStats:BaseStats = new BaseStats();
			
			tempBaseStats.BaseMaxHealth = 5;
			tempBaseStats.Health = 2;
			tempBaseStats.BaseMaxMagic = 5;
			tempBaseStats.Magic = 5;
			tempBaseStats.Name = "Name2";
			tempBaseStats.BaseSpeed = 0;
			tempBaseStats.PortraitClipName = "Portrait2";
			tempBaseStats.job = new Job_None();
			tempBaseStats.FrontRow = false;
			tempBaseStats.JP = 0;
			tempBaseStats.Experience = 0;
			
			return tempBaseStats;
		}
		
		public static function GetPlayer3StartingStats():BaseStats
		{
			var tempBaseStats:BaseStats = new BaseStats();
			
			tempBaseStats.BaseMaxHealth = 5;
			tempBaseStats.Health = 5;
			tempBaseStats.BaseMaxMagic = 5;
			tempBaseStats.Magic = 5;
			tempBaseStats.Name = "Name3";
			tempBaseStats.BaseSpeed = 1;
			tempBaseStats.PortraitClipName = "Portrait3";
			tempBaseStats.job = new Job_None();
			tempBaseStats.FrontRow = true;
			tempBaseStats.JP = 0;
			tempBaseStats.Experience = 0;
			
			return tempBaseStats;
		}
		
		public static function GetPlayer4StartingStats():BaseStats
		{
			var tempBaseStats:BaseStats = new BaseStats();
			
			tempBaseStats.BaseMaxHealth = 5;
			tempBaseStats.Health = 5;
			tempBaseStats.BaseMaxMagic = 5;
			tempBaseStats.Magic = 5;
			tempBaseStats.Name = "Name4";
			tempBaseStats.BaseSpeed = 1;
			tempBaseStats.PortraitClipName = "Portrait4";
			tempBaseStats.job = new Job_None();
			tempBaseStats.FrontRow = true;
			tempBaseStats.JP = 0;
			tempBaseStats.Experience = 0;
			
			return tempBaseStats;
		}
		
		public static function GetPlayer5StartingStats():BaseStats
		{
			var tempBaseStats:BaseStats = new BaseStats();
			
			tempBaseStats.BaseMaxHealth = 5;
			tempBaseStats.Health = 5;
			tempBaseStats.BaseMaxMagic = 5;
			tempBaseStats.Magic = 5;
			tempBaseStats.Name = "Name5";
			tempBaseStats.BaseSpeed = 1;
			tempBaseStats.PortraitClipName = "Portrait5";
			tempBaseStats.job = new Job_None();
			tempBaseStats.FrontRow = false;
			tempBaseStats.JP = 17;
			tempBaseStats.Experience = 0;
			
			return tempBaseStats;
		}
		
		public static function GetPlayer6StartingStats():BaseStats
		{
			var tempBaseStats:BaseStats = new BaseStats();
			
			tempBaseStats.BaseMaxHealth = 5;
			tempBaseStats.Health = 5;
			tempBaseStats.BaseMaxMagic = 5;
			tempBaseStats.Magic = 5;
			tempBaseStats.Name = "Name6";
			tempBaseStats.BaseSpeed = 1;
			tempBaseStats.PortraitClipName = "Portrait6";
			tempBaseStats.job = new Job_None();
			tempBaseStats.FrontRow = true;
			tempBaseStats.JP = 0;
			tempBaseStats.Experience = 56;
			
			return tempBaseStats;
		}
		
		public static function GetPlayer7StartingStats():BaseStats
		{
			var tempBaseStats:BaseStats = new BaseStats();
			
			tempBaseStats.BaseMaxHealth = 5;
			tempBaseStats.Health = 5;
			tempBaseStats.BaseMaxMagic = 5;
			tempBaseStats.Magic = 5;
			tempBaseStats.Name = "Name7";
			tempBaseStats.BaseSpeed = 1;
			tempBaseStats.PortraitClipName = "Portrait7";
			tempBaseStats.job = new Job_None();
			tempBaseStats.FrontRow = true;
			tempBaseStats.JP = 0;
			tempBaseStats.Experience = 0;
			
			return tempBaseStats;
		}
		
		//public static function GetBasicInfoArray():Array
//		{
//			var tempArray:Array = new Array();
//			var sharedObject:SharedObject = SharedObject.getLocal( GameName );
//			
//			if (sharedObject.data.MainInfoArray0 == null)
//			{
//				tempArray.push(null);
//			}
//			else
//			{
//				var tempBasicInfo0 = new BasicInfo();
//				tempBasicInfo0.UserName = sharedObject.data.MainInfoArray0.UserName;
//				tempBasicInfo0.TimePlayed = sharedObject.data.MainInfoArray0.TimePlayed;
//				tempBasicInfo0.LastSaved = sharedObject.data.MainInfoArray0.LastSaved;
//				tempArray.push(tempBasicInfo0);
//			}
//			if (sharedObject.data.MainInfoArray1 == null)
//			{
//				tempArray.push(null);
//			}
//			else
//			{
//				var tempBasicInfo1 = new BasicInfo();
//				tempBasicInfo1.UserName = sharedObject.data.MainInfoArray1.UserName;
//				tempBasicInfo1.TimePlayed = sharedObject.data.MainInfoArray1.TimePlayed;
//				tempBasicInfo1.LastSaved = sharedObject.data.MainInfoArray1.LastSaved;
//				tempArray.push(tempBasicInfo1);
//			}
//			if (sharedObject.data.MainInfoArray2 == null)
//			{
//				tempArray.push(null);
//			}
//			else
//			{
//				var tempBasicInfo2 = new BasicInfo();
//				tempBasicInfo2.UserName = sharedObject.data.MainInfoArray2.UserName;
//				tempBasicInfo2.TimePlayed = sharedObject.data.MainInfoArray2.TimePlayed;
//				tempBasicInfo2.LastSaved = sharedObject.data.MainInfoArray2.LastSaved;
//				tempArray.push(tempBasicInfo2);
//			}
//			
//			return tempArray;
//		}
		
		//public static function SaveGame(theGame:Game)
//		{
//			var sharedObject:SharedObject = SharedObject.getLocal( GameName );
//
//			sharedObject.clear();
//			
//			var slotToSave;
//			var lineupNum;
//			
//			switch(theGame.SlotNumber)
//			{
//				case 0:
//				slotToSave = sharedObject.data.MainInfoArray0;
//				break;
//				case 1:
//				slotToSave = sharedObject.data.MainInfoArray1;
//				break;
//				case 2:
//				slotToSave = sharedObject.data.MainInfoArray2;
//				break;
//			}
//			
//			slotToSave.UserName = theGame.MainInfo.UserName;
//			slotToSave.TimePlayed = theGame.MainInfo.TimePlayed;
//			slotToSave.LastSaved = theGame.MainInfo.LastSaved;
//			for(var i:int = 0; i < NumPartyMembers; i++)
//			{
//				switch(i)
//				{
//					case 0:
//					lineupNum = slotToSave.PartyLineup0;
//					break;
//					case 1:
//					lineupNum = slotToSave.PartyLineup1;
//					break;
//					case 2:
//					lineupNum = slotToSave.PartyLineup2;
//					break;
//					case 3:
//					lineupNum = slotToSave.PartyLineup3;
//					break;
//					case 4:
//					lineupNum = slotToSave.PartyLineup4;
//					break;
//					case 5:
//					lineupNum = slotToSave.PartyLineup5;
//					break;
//					case 6:
//					lineupNum = slotToSave.PartyLineup6;
//					break;
//				}
//			
//				lineupNum.FrontRow = theGame.MainInfo.PartyLineup[i].FrontRow;
//			}
//			
//			sharedObject.flush();
//		}
		
		//public static function LoadGame(theGame:Game)
//		{
//			var sharedObject:SharedObject = SharedObject.getLocal( GameName );
//			
//			var slotToSave;
//			var lineupNum;
//			
//			switch(theGame.SlotNumber)
//			{
//				case 0:
//				slotToSave = sharedObject.data.MainInfoArray0;
//				break;
//				case 1:
//				slotToSave = sharedObject.data.MainInfoArray1;
//				break;
//				case 2:
//				slotToSave = sharedObject.data.MainInfoArray2;
//				break;
//			}
//			
//			slotToSave.UserName = theGame.MainInfo.UserName;
//			slotToSave.TimePlayed = theGame.MainInfo.TimePlayed;
//			slotToSave.LastSaved = theGame.MainInfo.LastSaved;
//			for(var i:int = 0; i < NumPartyMembers; i++)
//			{
//				switch(i)
//				{
//					case 0:
//					lineupNum = slotToSave.PartyLineup0;
//					break;
//					case 1:
//					lineupNum = slotToSave.PartyLineup1;
//					break;
//					case 2:
//					lineupNum = slotToSave.PartyLineup2;
//					break;
//					case 3:
//					lineupNum = slotToSave.PartyLineup3;
//					break;
//					case 4:
//					lineupNum = slotToSave.PartyLineup4;
//					break;
//					case 5:
//					lineupNum = slotToSave.PartyLineup5;
//					break;
//					case 6:
//					lineupNum = slotToSave.PartyLineup6;
//					break;
//				}
//			
//				lineupNum.FrontRow = theGame.MainInfo.PartyLineup[i].FrontRow;
//			}
//		}
	}
}
