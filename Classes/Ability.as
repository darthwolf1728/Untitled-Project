package 
{
	public class Ability
	{		
		public var DisplayName:String;
		public var AbilityType:int;
		
		public static const AbilityTypeAction = 1;
		public static const AbilityTypeEquip = 2;
		public static const AbilityTypeBonus = 3;
		public static const AbilityTypeUndefined = 4;
		
		public function Ability() 
		{
			init();
		}
		
		private function init():void
		{
			DisplayName = StringHelper.Empty
			AbilityType = AbilityTypeUndefined;
		}
	}
}