package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	
	public class JobTree extends MovieClip
	{		
		public var Stats:BaseStats;
		
		private static const statsBasicName:String = "statsBasic";
		
		public function JobTree(stats:BaseStats) 
		{
			Stats = stats;
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(Event.REMOVED, Unload);
			init();
			loadItems();
		}
		
		private function init():void
		{
			jpBar.BarType = Constants.BarType_JP;
			jpBar.InitializeValues();
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
			var tempJob:Job = jobTreeMenu.CurrentItem.BtnJob;
			var tempJp:int = Stats.JPArray[tempJob.JobId];
			selectedJob.text = tempJob.JobName;
			jpBar.MaxValue = tempJob.PointsToLevel;
			jpBar.CurrentValue = tempJp;
			abilityText.text = ("Abilities learned: " + tempJob.GetNumAbilities(tempJp) + "/5");
			
			if (Game.ZIsPressed)
			{
				Stats.job = tempJob;
				var statsBasic:MovieClip = (statsBasicPlaceholder.getChildByName(statsBasicName) as MovieClip);
				statsBasic.Refresh();
			}
			
		}
		
		private function loadItems():void
		{
			var statsBasic:StatsBasic = new StatsBasic(Stats);
			statsBasic.width = 185;
			statsBasic.height = 65;
			statsBasic.name = statsBasicName;
			statsBasicPlaceholder.addChild(statsBasic);
			
			hideAllJobs();
		}
		
		private function hideAllJobs():void
		{
			jobTreeMenu.jobPirate.alpha = Stats.HasAccessToJob(jobTreeMenu.jobPirate.BtnJob) ? 1 : 0;
			jobTreeMenu.jobMagician.alpha = Stats.HasAccessToJob(jobTreeMenu.jobMagician.BtnJob) ? 1 : 0;
			jobTreeMenu.jobCriminal.alpha = Stats.HasAccessToJob(jobTreeMenu.jobCriminal.BtnJob) ? 1 : 0;
			jobTreeMenu.jobMMAFighter.alpha = Stats.HasAccessToJob(jobTreeMenu.jobMMAFighter.BtnJob) ? 1 : 0;
			
			jobTreeMenu.jobNerd.alpha = Stats.HasAccessToJob(jobTreeMenu.jobNerd.BtnJob) ? 1 : 0;
			jobTreeMenu.jobFisherman.alpha = Stats.HasAccessToJob(jobTreeMenu.jobFisherman.BtnJob) ? 1 : 0;
			jobTreeMenu.jobPoliceman.alpha = Stats.HasAccessToJob(jobTreeMenu.jobPoliceman.BtnJob) ? 1 : 0;
			
			jobTreeMenu.jobProfessor.alpha = Stats.HasAccessToJob(jobTreeMenu.jobProfessor.BtnJob) ? 1 : 0;
			jobTreeMenu.jobDoctor.alpha = Stats.HasAccessToJob(jobTreeMenu.jobDoctor.BtnJob) ? 1 : 0;
			jobTreeMenu.jobBetterMagician.alpha = Stats.HasAccessToJob(jobTreeMenu.jobBetterMagician.BtnJob) ? 1 : 0;
			
			jobTreeMenu.jobArsonist.alpha = Stats.HasAccessToJob(jobTreeMenu.jobArsonist.BtnJob) ? 1 : 0;
			jobTreeMenu.jobCowboy.alpha = Stats.HasAccessToJob(jobTreeMenu.jobCowboy.BtnJob) ? 1 : 0;
			jobTreeMenu.jobMillionaire.alpha = Stats.HasAccessToJob(jobTreeMenu.jobMillionaire.BtnJob) ? 1 : 0;
			
			jobTreeMenu.jobSumoWrestler.alpha = Stats.HasAccessToJob(jobTreeMenu.jobSumoWrestler.BtnJob) ? 1 : 0;
			jobTreeMenu.jobFirefighter.alpha = Stats.HasAccessToJob(jobTreeMenu.jobFirefighter.BtnJob) ? 1 : 0;
			jobTreeMenu.jobHunter.alpha = Stats.HasAccessToJob(jobTreeMenu.jobHunter.BtnJob) ? 1 : 0;
			
			jobTreeMenu.jobSage.alpha = Stats.HasAccessToJob(jobTreeMenu.jobSage.BtnJob) ? 1 : 0;
			jobTreeMenu.jobSorceror.alpha = Stats.HasAccessToJob(jobTreeMenu.jobSorceror.BtnJob) ? 1 : 0;
			jobTreeMenu.jobSamurai.alpha = Stats.HasAccessToJob(jobTreeMenu.jobSamurai.BtnJob) ? 1 : 0;
			jobTreeMenu.jobAstronaut.alpha = Stats.HasAccessToJob(jobTreeMenu.jobAstronaut.BtnJob) ? 1 : 0;
			jobTreeMenu.jobBestMagician.alpha = Stats.HasAccessToJob(jobTreeMenu.jobBestMagician.BtnJob) ? 1 : 0;
			jobTreeMenu.jobAssassin.alpha = Stats.HasAccessToJob(jobTreeMenu.jobAssassin.BtnJob) ? 1 : 0;
		}
	}
}