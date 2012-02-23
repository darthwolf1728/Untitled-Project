package 
{
	public class Equipment
	{		
		public var DisplayName:String;
		public var EquipmentType:int;
		
		public var AttackBonus:int;
		public var DefenseBonus:int;
		public var MagicPwrBonus:int;
		public var MagicDefBonus:int;
		public var MaxHPBonus:int;
		public var MaxMPBonus:int;
		public var AccuracyBonus:int;
		public var EvasionBonus:int;
		public var SpeedBonus:int;
		public var LuckBonus:int;
		
		public static const EquipmentTypeWeapon = 1;
		public static const EquipmentTypeArmor = 2;
		public static const EquipmentTypeAccessory = 3;
		public static const EquipmentTypeUndefined = 4;
		
		public function Equipment() 
		{
			init();
		}
		
		private function init():void
		{
			DisplayName = StringHelper.Empty
			EquipmentType = EquipmentTypeUndefined;
			
			AttackBonus = 0;
			DefenseBonus = 0;
			MagicPwrBonus = 0;
			MagicDefBonus = 0;
			MaxHPBonus = 0;
			MaxMPBonus = 0;
			AccuracyBonus = 0;
			EvasionBonus = 0;
			SpeedBonus = 0;
			LuckBonus = 0;
		}
	}
}