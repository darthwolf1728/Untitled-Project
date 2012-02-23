package 
{
	public class Equipment_None extends Equipment
	{		
		public function Equipment_None() 
		{
			init();
		}
		
		private function init():void
		{
			DisplayName = "None";
			EquipmentType = Equipment.EquipmentTypeUndefined;
			
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