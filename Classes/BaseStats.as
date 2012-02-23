package 
{
	public class BaseStats
	{
		public var FrontRow:Boolean;

		public var Name:String;
		public var Experience:int;
		public var job:Job;
		public var Level:int;
		public var LP:int;
		public var PortraitClipName:String;
		public var JPArray:Array;
		
		public var Action1:Ability;
		public var Action2:Ability;
		public var Action3:Ability;
		public var Action4:Ability;
		public var Action5:Ability;
		public var Equip1:Ability;
		public var Equip2:Ability;
		public var Bonus1:Ability;
		public var Bonus2:Ability;
		
		public var RHandEquip:Equipment;
		public var LHandEquip:Equipment;
		public var BodyEquip:Equipment;
		public var AccessoryEquip:Equipment;
		
		public function get JP():int
		{
			return JPArray[job.JobId];
		}
		public function set JP(value:int):void
		{
			JPArray[job.JobId] = value;
		}
		
		//get bonuses
		public function get AttackBonus():int
		{
			return (RHandEquip.AttackBonus + LHandEquip.AttackBonus + BodyEquip.AttackBonus + AccessoryEquip.AttackBonus);
		}
		public function get DefenseBonus():int
		{
			return (RHandEquip.DefenseBonus + LHandEquip.DefenseBonus + BodyEquip.DefenseBonus + AccessoryEquip.DefenseBonus);
		}
		public function get MagicPwrBonus():int
		{
			return (RHandEquip.MagicPwrBonus + LHandEquip.MagicPwrBonus + BodyEquip.MagicPwrBonus + AccessoryEquip.MagicPwrBonus);
		}
		public function get MagicDefBonus():int
		{
			return (RHandEquip.MagicDefBonus + LHandEquip.MagicDefBonus + BodyEquip.MagicDefBonus + AccessoryEquip.MagicDefBonus);
		}
		public function get MaxHPBonus():int
		{
			return (RHandEquip.MaxHPBonus + LHandEquip.MaxHPBonus + BodyEquip.MaxHPBonus + AccessoryEquip.MaxHPBonus);
		}
		public function get MaxMPBonus():int
		{
			return (RHandEquip.MaxMPBonus + LHandEquip.MaxMPBonus + BodyEquip.MaxMPBonus + AccessoryEquip.MaxMPBonus);
		}
		public function get AccuracyBonus():int
		{
			return (RHandEquip.AccuracyBonus + LHandEquip.AccuracyBonus + BodyEquip.AccuracyBonus + AccessoryEquip.AccuracyBonus);
		}
		public function get EvasionBonus():int
		{
			return (RHandEquip.EvasionBonus + LHandEquip.EvasionBonus + BodyEquip.EvasionBonus + AccessoryEquip.EvasionBonus);
		}
		public function get SpeedBonus():int
		{
			return (RHandEquip.SpeedBonus + LHandEquip.SpeedBonus + BodyEquip.SpeedBonus + AccessoryEquip.SpeedBonus);
		}
		public function get LuckBonus():int
		{
			return (RHandEquip.LuckBonus + LHandEquip.LuckBonus + BodyEquip.LuckBonus + AccessoryEquip.LuckBonus);
		}
		
		public var BaseAttack;
		public function get Attack():int
		{
			return (BaseAttack + AttackBonus);
		}
		public var BaseDefense;
		public function get Defense():int
		{
			return (BaseDefense + DefenseBonus);
		}
		public var BaseMagicPwr;
		public function get MagicPwr():int
		{
			return (BaseMagicPwr + MagicPwrBonus);
		}
		public var BaseMagicDef;
		public function get MagicDef():int
		{
			return (BaseMagicDef + MagicDefBonus);
		}
		public var BaseMaxHealth;
		public function get MaxHealth():int
		{
			return (BaseMaxHealth + MaxHPBonus);
		}
		public var BaseMaxMagic;
		public function get MaxMagic():int
		{
			return (BaseMaxMagic + MaxMPBonus);
		}
		public var BaseAccuracy;
		public function get Accuracy():int
		{
			return (BaseAccuracy + AccuracyBonus);
		}
		public var BaseEvasion;
		public function get Evasion():int
		{
			return (BaseEvasion + EvasionBonus);
		}
		public var BaseSpeed;
		public function get Speed():int
		{
			return (BaseSpeed + SpeedBonus);
		}
		public var BaseLuck;
		public function get Luck():int
		{
			return (BaseLuck + LuckBonus);
		}
		
		private var _Health:int;
		public function set Health(value:int):void 
		{
			if (value > MaxHealth)
			{
				value = MaxHealth;
			}
			if (value < 0)
			{
				value = 0;
			}
			_Health = value;
		}
		public function get Health():int 
		{
			return _Health;
		}
		
		private var _Magic:int;
		public function set Magic(value:int):void 
		{
			if (value > MaxMagic)
			{
				value = MaxMagic;
			}
			if (value < 0)
			{
				value = 0;
			}
			_Magic = value;
		}
		public function get Magic():int 
		{
			return _Magic;
		}
		
		public function BaseStats()
		{
			init();
		}
		
		private function init():void
		{
			Name = StringHelper.Empty;

			job = new Job_None();
			JPArray = new Array(23);
			
			for (var i:int = 0; i < JPArray.length; i++)
			{
				JPArray[i] = 0;
			}
			
			Experience = 0;
			JP = 0;
			Level = 1;
			LP = 0;
			FrontRow = true;
			
			BaseAttack = 0;
			BaseDefense = 0;
			BaseMagicPwr = 0;
			BaseMagicDef = 0;
			BaseMaxHealth = 0;
			BaseMaxMagic = 0;
			BaseAccuracy = 0;
			BaseEvasion = 0;
			BaseSpeed = 0;
			BaseLuck = 0;
			
			PortraitClipName = StringHelper.Empty;
			Action1 = new Ability_None();
			Action2 = new Ability_None();
			Action3 = new Ability_None();
			Action4 = new Ability_None();
			Action5 = new Ability_None();
			Equip1 = new Ability_None();
			Equip2 = new Ability_None();
			Bonus1 = new Ability_None();
			Bonus2 = new Ability_None();
			
			RHandEquip = new Equipment_None();
			LHandEquip = new Equipment_None();
			BodyEquip = new Equipment_None();
			AccessoryEquip = new Equipment_None();
			
			Health = 0;
			Magic = 0;
		}
		
		public function SwitchRow():void
		{
			FrontRow = !FrontRow;
		}
		
		public function GetDescription():String
		{
			return "lv. " + Level.toString() + " " + job.JobName;
		}
		
		public function HasAccessToJob(newJob:Job):Boolean
		{
			var jobIdToCheck:int = 0;
			var jobIdToCheck2:int = 0;
			var tempJob:Job = null;
			var tempJob2:Job = null;
			//Base Job
			if (newJob.JobId == 0)
			{
				return true;
			}
			//Pirate, Magician, Criminal, MMA Fighter
			if (newJob.JobId == 1 || newJob.JobId == 2 || newJob.JobId == 3 || newJob.JobId == 4)
			{
				jobIdToCheck = 0;
				//If you have mastered the base job
				tempJob = Constants.GetJobByJobId(jobIdToCheck);
				if (JPArray[jobIdToCheck] == tempJob.PointsToLevel)
				{
					return true;
				}
				return false;
			}
			//Nerd, Fisherman, Policeman
			if (newJob.JobId == 5 || newJob.JobId == 6 || newJob.JobId == 7)
			{
				jobIdToCheck = 1;
				//If you have mastered the pirate job
				tempJob = Constants.GetJobByJobId(jobIdToCheck);
				if (JPArray[jobIdToCheck] == tempJob.PointsToLevel)
				{
					return true;
				}
				return false;
			}
			//Professor, Doctor, Better Magician
			if (newJob.JobId == 8 || newJob.JobId == 9 || newJob.JobId == 10)
			{
				jobIdToCheck = 2;
				//If you have mastered the magician job
				tempJob = Constants.GetJobByJobId(jobIdToCheck);
				if (JPArray[jobIdToCheck] == tempJob.PointsToLevel)
				{
					return true;
				}
				return false;
			}
			//Arsonist, Cowboy, Millionaire
			if (newJob.JobId == 11 || newJob.JobId == 12 || newJob.JobId == 13)
			{
				jobIdToCheck = 3;
				//If you have mastered the criminal job
				tempJob = Constants.GetJobByJobId(jobIdToCheck);
				if (JPArray[jobIdToCheck] == tempJob.PointsToLevel)
				{
					return true;
				}
				return false;
			}
			//Sumo Wrestler, Firefighter, Hunter
			if (newJob.JobId == 14 || newJob.JobId == 15 || newJob.JobId == 16)
			{
				jobIdToCheck = 4;
				//If you have mastered the MMA Fighter job
				tempJob = Constants.GetJobByJobId(jobIdToCheck);
				if (JPArray[jobIdToCheck] == tempJob.PointsToLevel)
				{
					return true;
				}
				return false;
			}
			//Sage
			if (newJob.JobId == 17)
			{
				jobIdToCheck = 5;
				jobIdToCheck2 = 8;
				//If you have mastered the Nerd and Professor jobs
				tempJob = Constants.GetJobByJobId(jobIdToCheck);
				tempJob2 = Constants.GetJobByJobId(jobIdToCheck2);
				if (JPArray[jobIdToCheck] == tempJob.PointsToLevel && JPArray[jobIdToCheck2] == tempJob2.PointsToLevel)
				{
					return true;
				}
				return false;
			}
			//Sorceror
			if (newJob.JobId == 18)
			{
				jobIdToCheck = 6;
				jobIdToCheck2 = 11;
				//If you have mastered the Fisherman and Arsonist jobs
				tempJob = Constants.GetJobByJobId(jobIdToCheck);
				tempJob2 = Constants.GetJobByJobId(jobIdToCheck2);
				if (JPArray[jobIdToCheck] == tempJob.PointsToLevel && JPArray[jobIdToCheck2] == tempJob2.PointsToLevel)
				{
					return true;
				}
				return false;
			}
			//Samurai
			if (newJob.JobId == 19)
			{
				jobIdToCheck = 7;
				jobIdToCheck2 = 14;
				//If you have mastered the Policeman and Sumo Wrestler jobs
				tempJob = Constants.GetJobByJobId(jobIdToCheck);
				tempJob2 = Constants.GetJobByJobId(jobIdToCheck2);
				if (JPArray[jobIdToCheck] == tempJob.PointsToLevel && JPArray[jobIdToCheck2] == tempJob2.PointsToLevel)
				{
					return true;
				}
				return false;
			}
			//Astronaut
			if (newJob.JobId == 20)
			{
				jobIdToCheck = 9;
				jobIdToCheck2 = 13;
				//If you have mastered the Doctor and Millionaire jobs
				tempJob = Constants.GetJobByJobId(jobIdToCheck);
				tempJob2 = Constants.GetJobByJobId(jobIdToCheck2);
				if (JPArray[jobIdToCheck] == tempJob.PointsToLevel && JPArray[jobIdToCheck2] == tempJob2.PointsToLevel)
				{
					return true;
				}
				return false;
			}
			//The Best Magician
			if (newJob.JobId == 21)
			{
				jobIdToCheck = 10;
				jobIdToCheck2 = 15;
				//If you have mastered the Better Magician and Firefighter jobs
				tempJob = Constants.GetJobByJobId(jobIdToCheck);
				tempJob2 = Constants.GetJobByJobId(jobIdToCheck2);
				if (JPArray[jobIdToCheck] == tempJob.PointsToLevel && JPArray[jobIdToCheck2] == tempJob2.PointsToLevel)
				{
					return true;
				}
				return false;
			}
			//Assassin
			if (newJob.JobId == 22)
			{
				jobIdToCheck = 12;
				jobIdToCheck2 = 16;
				//If you have mastered the Cowboy and Hutner jobs
				tempJob = Constants.GetJobByJobId(jobIdToCheck);
				tempJob2 = Constants.GetJobByJobId(jobIdToCheck2);
				if (JPArray[jobIdToCheck] == tempJob.PointsToLevel && JPArray[jobIdToCheck2] == tempJob2.PointsToLevel)
				{
					return true;
				}
				return false;
			}
			return false;
		}
	}
}