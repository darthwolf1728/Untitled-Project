package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.utils.getDefinitionByName;
	
	public class StatsBasic extends MovieClip 
	{
		public var Stats:BaseStats;
		
		public function StatsBasic(baseStats:BaseStats) 
		{
			Stats = baseStats;
			init();
		}
		
		private function init():void
		{
			hp.BarType = Constants.BarType_HEALTH;
			mp.BarType = Constants.BarType_MAGIC;
			
			var copyPortrait:Class = getDefinitionByName(Stats.PortraitClipName) as Class;
			portraitPlaceholder.addChild(new copyPortrait);
			
			Refresh();
			
			hp.InitializeValues();
			mp.InitializeValues();
		}
		
		public function Refresh():void
		{
			hp.MaxValue = Stats.MaxHealth;
			hp.CurrentValue = Stats.Health;
			
			mp.MaxValue = Stats.MaxMagic;
			mp.CurrentValue = Stats.Magic;
			
			descriptionText.text = Stats.GetDescription();
			
			if (Stats.FrontRow)
			{
				portraitPlaceholder.x = 0;
			}
			else
			{
				portraitPlaceholder.x = 30;
			}
		}
	}
}