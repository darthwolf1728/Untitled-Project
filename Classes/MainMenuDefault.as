package 
{
	import flash.display.MovieClip;
	import flash.utils.getDefinitionByName;
	
	public class MainMenuDefault extends MovieClip 
	{
		public function MainMenuDefault(basicInfo:BasicInfo) 
		{
			if (basicInfo.PartyLineup[0] != null)
			{
				initializeStatDetail(statsDetailed1, basicInfo.PartyLineup[0]);
			}
			if (basicInfo.PartyLineup[1] != null)
			{
				initializeStatDetail(statsDetailed2,  basicInfo.PartyLineup[1]);
			}
			if (basicInfo.PartyLineup[2] != null)
			{
				initializeStatDetail(statsDetailed3,  basicInfo.PartyLineup[2]);
			}
		}
		
		private static function initializeStatDetail(statBarDetail:MovieClip, baseStats:BaseStats)
		{
			statBarDetail.hp.BarType = Constants.BarType_HEALTH;
			statBarDetail.mp.BarType = Constants.BarType_MAGIC;
			statBarDetail.expBar.BarType = Constants.BarType_EXP;
			statBarDetail.jp.BarType = Constants.BarType_JP;
			
			var copyPortrait:Class = getDefinitionByName(baseStats.PortraitClipName) as Class;
			statBarDetail.portraitPlaceholder.addChild(new copyPortrait());
			statBarDetail.nameText.text = baseStats.Name;
			
			statBarDetail.hp.MaxValue = baseStats.MaxHealth;
			statBarDetail.hp.CurrentValue = baseStats.Health;
			statBarDetail.hp.InitializeValues();
			
			statBarDetail.mp.MaxValue = baseStats.MaxMagic;
			statBarDetail.mp.CurrentValue = baseStats.Magic;
			statBarDetail.mp.InitializeValues();
			
			statBarDetail.expBar.CurrentValue = baseStats.Experience;
			statBarDetail.expBar.InitializeValues();
			
			statBarDetail.jp.MaxValue = baseStats.job.PointsToLevel;
			statBarDetail.jp.CurrentValue = baseStats.JP;
			statBarDetail.jp.InitializeValues();
			
			statBarDetail.job.text = baseStats.job.JobName;
			statBarDetail.levelText.text = String(baseStats.Level);
			
			statBarDetail.lp.text = String(baseStats.LP);
			
			if (baseStats.FrontRow == true)
			{
				statBarDetail.portraitPlaceholder.x = 0;
			}
			else
			{
				statBarDetail.portraitPlaceholder.x = 40;
			}
		}
	}
}