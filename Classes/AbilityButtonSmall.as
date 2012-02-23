package 
{
	public class AbilityButtonSmall extends MyButton 
	{
		public var ButtonAbility:Ability;
		
		public function AbilityButtonSmall(ability:Ability, buttonName:String) 
		{
			init();
			ButtonAbility = ability;
			
			if (buttonName == null && ButtonAbility != null)
			{
				buttonName = ("btn" + ButtonAbility.DisplayName);
			}
			InitializeValues(100, 20, 10, buttonName);
		}
		
		private function init():void
		{
			ButtonAbility = null;
		}
	}
}