package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	
	public class ChooseAbilitiesMenu extends MovieClip
	{		
		public var Stats:BaseStats;
		public var MessageText:String;
		
		private static const jobMenuName:String = "jobMenuName";
		private static const abilityMenuName:String = "jobAbilityName";
		private static const actionAbilityMenyName:String = "actionAbilityMenyName";
		private static const equipAbilityMenyName:String = "equipAbilityMenyName";
		private static const bonusAbilityMenyName:String = "bonusAbilityMenyName";
		
		
		public function ChooseAbilitiesMenu(stats:BaseStats) 
		{
			Stats = stats;
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(Event.REMOVED, Unload);
			loadItems();
		}
		
		private function Unload(event:Event):void
		{
			if (event.target.name == this.name)
			{
				removeEventListener(Event.ENTER_FRAME, EnterFrame);
			}
		}
		
		private function EnterFrame(event:Event):void
		{
			var jobMenu:MovieClip = null;
			var abilityMenu:MovieClip = null;
			
			if (jobsPlaceholder.numChildren > 0)
			{
				jobMenu = (jobsPlaceholder.getChildByName(jobMenuName) as MovieClip);
			}
			if (abilitiesPlaceholder.numChildren > 0)
			{
				abilityMenu = (abilitiesPlaceholder.getChildByName(abilityMenuName) as MovieClip);
			}
			
			if (abilityMenu != null && abilityMenu.Active)
			{
				var tempAbility:Ability = null;
				if (abilityMenu.SelectedObject != null)
				{
					tempAbility = abilityMenu.SelectedObject.ButtonAbility;
				}
				if (tempAbility != null)
				{
					MessageText = tempAbility.DisplayName;
				}
				
				if (Game.XIsPressed)
				{
					loadJobs();
				}
			}
			if (jobMenu != null && jobMenu.Active)
			{
				var tempJob:Job = null;
				
				if (jobMenu.SelectedObject != null)
				{
					tempJob = jobMenu.SelectedObject.ButtonJob;
				}
				
				if (tempJob != null)
				{
					MessageText = tempJob.JobName;
				}
				if (Game.XIsPressed)
				{
					// this.parent.parent is abilities menu
					if (this.parent != null && this.parent.parent != null)
					{
						var abilitiesMenu = (this.parent.parent as MovieClip);
						abilitiesMenu.loadItems();
					}
				}
				if (Game.ZIsPressed)
				{
					if (tempJob != null)
					{
						loadAbilities(tempJob);
					}
				}
			}
		}
		
		private function loadAbilities(job:Job):void
		{
			removeChildren();
			var abilities:Array = job.GetAbilities(Stats.JPArray[job.JobId]);
			var btnAbilities:Array = new Array();
			var tempAbility:Ability = null;
			var newButton:AbilityButtonSmall = null;
			
			for(var i:int = 0; i < abilities.length; i++)
			{
				tempAbility = abilities[i];
				newButton = new AbilityButtonSmall(tempAbility, null);
				btnAbilities.push(newButton);
			}
			
			for (var j:int = btnAbilities.length; j < Constants.AbilitiesPerJob; j++)
			{
				newButton = new AbilityButtonSmall(new Ability_None(), "btnLocked");
				btnAbilities.push(newButton);
			}
			
			var objectMenu = new MyObjectMenu(1, btnAbilities, 0, 20);
			objectMenu.name = abilityMenuName;
			abilitiesPlaceholder.addChild(objectMenu);
		}
		
		private function removeChildren():void
		{
			if (jobsPlaceholder.numChildren > 0)
			{
				jobsPlaceholder.removeChildAt(0);
				removeChildren();
			}
			if (abilitiesPlaceholder.numChildren > 0)
			{
				abilitiesPlaceholder.removeChildAt(0);
				removeChildren();
			}
		}
		
		private function loadItems():void
		{
			var statsBasic:StatsBasic = new StatsBasic(Stats);
			statsBasic.width = 185;
			statsBasic.height = 65;
			statsBasicPlaceholder.addChild(statsBasic);
			loadJobs();
			loadBaseAbilities();
		}
		
		private function loadBaseAbilities():void
		{
			var btnActionAbilities:Array = new Array();
			btnActionAbilities.push(new AbilityButtonSmall(Stats.Action1, null));
			btnActionAbilities.push(new AbilityButtonSmall(Stats.Action2, null));
			btnActionAbilities.push(new AbilityButtonSmall(Stats.Action3, null));
			btnActionAbilities.push(new AbilityButtonSmall(Stats.Action4, null));
			btnActionAbilities.push(new AbilityButtonSmall(Stats.Action5, null));
			
			var objectActionMenu = new MyObjectMenu(1, btnActionAbilities, 0, 3);
			objectActionMenu.name = actionAbilityMenyName;
			objectActionMenu.Active = false;
			actionabilPlaceholder.addChild(objectActionMenu);
			
			var btnEquipAbilities:Array = new Array();
			btnEquipAbilities.push(new AbilityButtonSmall(Stats.Equip1, null));
			btnEquipAbilities.push(new AbilityButtonSmall(Stats.Equip1, null));
			
			var objectEquipMenu = new MyObjectMenu(1, btnEquipAbilities, 0, 3);
			objectEquipMenu.name = equipAbilityMenyName;
			objectEquipMenu.Active = false;
			equipabilPlaceholder.addChild(objectEquipMenu);
			
			var btnBonusAbilities:Array = new Array();
			btnBonusAbilities.push(new AbilityButtonSmall(Stats.Bonus1, null));
			btnBonusAbilities.push(new AbilityButtonSmall(Stats.Bonus2, null));
			
			var objectBonusMenu = new MyObjectMenu(1, btnBonusAbilities, 0, 3);
			objectBonusMenu.name = bonusAbilityMenyName;
			objectBonusMenu.Active = false;
			bonusAbilPlaceholder.addChild(objectBonusMenu);
		}

		private function loadJobs():void
		{
			removeChildren();
			var allJobs:Array = Constants.GetAllJobs();
			var btnJobs:Array = new Array();
			var tempJob:Job = null;
			var newButton:JobButtonSmall = null;
			
			for(var i:int = 0; i < allJobs.length; i++)
			{
				tempJob = allJobs[i];
				if (Stats.HasAccessToJob(tempJob))
				{
					newButton = new JobButtonSmall(tempJob);
					btnJobs.push(newButton);
				}
			}
			
			var objectMenu = new MyObjectMenu(1, btnJobs, 0, -6);
			objectMenu.name = jobMenuName;
			jobsPlaceholder.addChild(objectMenu);
		}
	}
}