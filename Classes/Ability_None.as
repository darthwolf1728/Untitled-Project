package 
{
	public class Ability_None extends Ability
	{		
		public function Ability_None() 
		{
			init();
		}
		
		private function init():void
		{
			DisplayName = "None";
			AbilityType = Ability.AbilityTypeUndefined;
		}
	}
}