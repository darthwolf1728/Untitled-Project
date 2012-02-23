package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	import flash.utils.getDefinitionByName;
	
	public class StatusDetailed extends MovieClip 
	{
		public var Stats:BaseStats;
		
		public function StatusDetailed(stats:BaseStats) 
		{
			Stats = stats;
			
			init();
			loadStats(Stats);
		}
		
		private function init():void
		{
			
		}

		private function loadStats(baseStats:BaseStats):void
		{
			hp.BarType = Constants.BarType_HEALTH;
			mp.BarType = Constants.BarType_MAGIC;
			expBar.BarType = Constants.BarType_EXP;
			jp.BarType = Constants.BarType_JP;
			
			var copyPortrait:Class = getDefinitionByName(Stats.PortraitClipName) as Class;
			portraitPlaceholder.addChild(new copyPortrait);
			
			nameText.text = baseStats.Name;
			
			hp.MaxValue = baseStats.MaxHealth;
			hp.CurrentValue = baseStats.Health;
			hp.InitializeValues();
			
			mp.MaxValue = baseStats.MaxMagic;
			mp.CurrentValue = baseStats.Magic;
			mp.InitializeValues();
			
			expBar.CurrentValue = baseStats.Experience;
			expBar.InitializeValues();
			
			jp.MaxValue = baseStats.job.PointsToLevel;
			jp.CurrentValue = baseStats.JP;
			jp.InitializeValues();
			
			job.text = baseStats.job.JobName;
			levelText.text = String(baseStats.Level);
			
			lp.text = String(baseStats.LP);
			
			if (baseStats.FrontRow == true)
			{
				portraitPlaceholder.x = 0;
			}
			else
			{
				portraitPlaceholder.x = 40;
			}
			
			action1.text = baseStats.Action1.DisplayName;
			action2.text = baseStats.Action2.DisplayName;
			action3.text = baseStats.Action3.DisplayName;
			action4.text = baseStats.Action4.DisplayName;
			action5.text = baseStats.Action5.DisplayName;
			equip1.text = baseStats.Equip1.DisplayName;
			equip2.text = baseStats.Equip2.DisplayName;
			bonus1.text = baseStats.Bonus1.DisplayName;
			bonus2.text = baseStats.Bonus2.DisplayName;
			
			rHandEquip.text = baseStats.RHandEquip.DisplayName;
			lHandEquip.text = baseStats.LHandEquip.DisplayName;
			bodyEquip.text = baseStats.BodyEquip.DisplayName;
			accEquip.text = baseStats.AccessoryEquip.DisplayName;
			
			baseAttack.text = String(baseStats.BaseAttack);
			baseDefense.text = String(baseStats.BaseDefense);
			baseMagicPower.text = String(baseStats.BaseMagicPwr);
			baseMagicDefense.text = String(baseStats.BaseMagicDef);
			baseMaxHP.text = String(baseStats.BaseMaxHealth);
			baseMaxMP.text = String(baseStats.BaseMaxMagic);
			baseAccuracy.text = String(baseStats.BaseAccuracy);
			baseEvasion.text = String(baseStats.BaseEvasion);
			baseSpeed.text = String(baseStats.BaseSpeed);
			baseLuck.text = String(baseStats.BaseLuck);
			
			equipAttack.text = String(baseStats.AttackBonus);
			equipDefense.text = String(baseStats.DefenseBonus);
			equipMagicPower.text = String(baseStats.MagicPwrBonus);
			equipMagicDefense.text = String(baseStats.MagicDefBonus);
			equipMaxHP.text = String(baseStats.MaxHPBonus);
			equipMaxMP.text = String(baseStats.MaxMPBonus);
			equipAccuracy.text = String(baseStats.AccuracyBonus);
			equipEvasion.text = String(baseStats.EvasionBonus);
			equipSpeed.text = String(baseStats.SpeedBonus);
			equipLuck.text = String(baseStats.LuckBonus);
			
			totalAttack.text = String(baseStats.Attack);
			totalDefense.text = String(baseStats.Defense);
			totalMagicPower.text = String(baseStats.MagicPwr);
			totalMagicDefense.text = String(baseStats.MagicDef);
			totalMaxHP.text = String(baseStats.MaxHealth);
			totalMaxMP.text = String(baseStats.MaxMagic);
			totalAccuracy.text = String(baseStats.Accuracy);
			totalEvasion.text = String(baseStats.Evasion);
			totalSpeed.text = String(baseStats.Speed);
			totalLuck.text = String(baseStats.Luck);
		}
	}
}