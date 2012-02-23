package 
{
	public class Job
	{
		public var JobName:String;
		public var PointsToLevel:int;
		public var JobId:int;
		
		public var JpCheckpoint1:int;
		public var JpCheckpoint2:int;
		public var JpCheckpoint3:int;
		public var JpCheckpoint4:int;
		
		public var Ability1:Ability;
		public var Ability2:Ability;
		public var Ability3:Ability;
		public var Ability4:Ability;
		public var Ability5:Ability;
		
		public function Job()
		{
			init();
		}
		
		private function init():void
		{
			JobId = -1;
			JobName = StringHelper.Empty;
			PointsToLevel = 0;
			
			JpCheckpoint1 = 0;
			JpCheckpoint2 = 0;
			JpCheckpoint3 = 0;
			JpCheckpoint4 = 0;
			
			Ability1 = null;
			Ability2 = null;
			Ability3 = null;
			Ability4 = null;
			Ability5 = null;
		}
		
		public function GetAbilities(jp:int):Array
		{
			var abilityArray:Array = new Array();
			if (jp >= JpCheckpoint1)
				abilityArray.push(Ability1);
			if (jp >= JpCheckpoint2)
				abilityArray.push(Ability2);
			if (jp >= JpCheckpoint3)
				abilityArray.push(Ability3);
			if (jp >= JpCheckpoint4)
				abilityArray.push(Ability4);
			if (jp >= PointsToLevel)
				abilityArray.push(Ability5);
			return abilityArray;
		}
		
		public function GetNumAbilities(jp:int):int
		{
			return GetAbilities(jp).length;
		}
	}
}