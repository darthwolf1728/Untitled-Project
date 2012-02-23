package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.utils.getDefinitionByName;
	
	public class StatsMedium extends MovieClip 
	{
		public var Stats:BaseStats;
		
		public function StatsMedium(baseStats:BaseStats) 
		{
			Stats = baseStats;
			init();
		}
		
		private function init():void
		{
			hp.BarType = Constants.BarType_HEALTH;
			mp.BarType = Constants.BarType_MAGIC;
			exp.BarType = Constants.BarType_EXP;
			jp.BarType = Constants.BarType_JP;
			
			var copyPortrait:Class = getDefinitionByName(Stats.PortraitClipName) as Class;
			portraitPlaceholder.addChild(new copyPortrait);
			
			Refresh();
			
			hp.InitializeValues();
			mp.InitializeValues();
			exp.InitializeValues();
			jp.InitializeValues();
		}
		
		public function Refresh():void
		{
			hp.MaxValue = Stats.MaxHealth;
			hp.CurrentValue = Stats.Health;
			
			mp.MaxValue = Stats.MaxMagic;
			mp.CurrentValue = Stats.Magic;
			
			exp.MaxValue = Constants.MaxExperiencePoints;
			exp.CurrentValue = Stats.Experience;
			
			jp.MaxValue = Stats.job.PointsToLevel;
			jp.CurrentValue = Stats.JP;
			
			if (Stats.FrontRow)
			{
				portraitPlaceholder.x = 0;
			}
			else
			{
				portraitPlaceholder.x = 30;
			}
			
			nameText.text = Stats.Name;
			levelText.text = String(Stats.Level);
			LPText.text = String(Stats.LP);
			jobText.text = Stats.job.JobName;
		}
	}
}