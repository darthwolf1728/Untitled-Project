package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.filters.*;

	public class Battle extends MovieClip 
	{
		private var baseStatsPlayer1:BaseStats;
		private var baseStatsPlayer2:BaseStats;
		private var baseStatsPlayer3:BaseStats;
		
		private var activePlayer:int;
		private var activePlayerToSearch:int;
		
		public static const EventAttack:String = "Attack";
		public static const EventWait:String = "Wait";
		
		public function Battle(lineup:Array) 
		{
			init();
			
			baseStatsPlayer1 = lineup[0];
			baseStatsPlayer2 = lineup[1];
			baseStatsPlayer3 = lineup[2];
			
			initializePlayer(1);
			initializePlayer(2);
			initializePlayer(3);
			
			addEventListener(Event.REMOVED, Unload);
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(EventAttack, attack);
			addEventListener(EventWait, wait);
		}
		
		private function init():void
		{
			activePlayer = 0;
			activePlayerToSearch = 1;
		}
		
		private function Unload(event:Event):void
		{
			if (event.target.name == this.name)
			{
				removeChildren();
				removeEventListener(Event.ENTER_FRAME, EnterFrame);
			}
		}
		
		private function removeChildren():void
		{
			if (menuHolder.numChildren > 0)
			{
				menuHolder.removeChildAt(0);
				removeChildren();
			}
		}
		
		private function initializePlayer(playerNum:int):void
		{
			var baseStats:BaseStats;
			var statBar:MovieClip;
			
			switch(playerNum)
			{
				case 1:
					baseStats = baseStatsPlayer1;
					statBar = statBar1;
				break;
				case 2:
					baseStats = baseStatsPlayer2;
					statBar = statBar2;
				break;
				case 3:
					baseStats = baseStatsPlayer3;
					statBar = statBar3;
				break;
			}
			
			statBar.hp.BarType = Constants.BarType_HEALTH;
			statBar.hp.MaxValue = baseStats.MaxHealth;
			statBar.hp.CurrentValue = baseStats.Health;
			statBar.hp.InitializeValues();
			
			statBar.mp.BarType = Constants.BarType_MAGIC;
			statBar.mp.MaxValue = baseStats.MaxMagic;
			statBar.mp.CurrentValue = baseStats.Magic;
			statBar.mp.InitializeValues();
			
			statBar.ap.BarType = Constants.BarType_ACTION;
			statBar.ap.InitializeValues();
			
			statBar.playerName.text = baseStats.Name;
		}
		
		private function EnterFrame(event:Event):void
		{
			statBar1.ap.CurrentValue += (Constants.GameSpeed + (baseStatsPlayer1.Speed / Constants.GameSpeedDivisor));
			statBar2.ap.CurrentValue += (Constants.GameSpeed + (baseStatsPlayer2.Speed / Constants.GameSpeedDivisor));
			statBar3.ap.CurrentValue += (Constants.GameSpeed + (baseStatsPlayer3.Speed / Constants.GameSpeedDivisor));
			
			switchPlayer();
		}
		
		private function switchPlayer():void
		{
			if (activePlayer == 0)
			{
				if (activePlayerToSearch > 3)
				{
					activePlayerToSearch = 1;
				}
				
				if (activePlayerToSearch == 1)
				{
					if (statBar1.ap.DisplayValue == Constants.MaxActionPoints)
					{
						activePlayer = 1;
						applyGlow(statBar1);
						popupMenu();
						return;
					}
					activePlayerToSearch++;
				}
				if (activePlayerToSearch == 2)
				{
					if (statBar2.ap.DisplayValue == Constants.MaxActionPoints)
					{
						activePlayer = 2;
						applyGlow(statBar2);
						popupMenu();
						return;
					}
					activePlayerToSearch++;
				}
				if (activePlayerToSearch == 3)
				{
					if (statBar3.ap.DisplayValue == Constants.MaxActionPoints  && activePlayerToSearch == 3)
					{
						activePlayer = 3;
						applyGlow(statBar3);
						popupMenu();
						return;
					}
					activePlayerToSearch++;
				}
			}
		}
		
		private function attack(event:Event):void
		{
			performedAction(true);
		}
		
		private function wait(event:Event):void
		{
			performedAction(false);
			activePlayerToSearch++;
		}
		
		private function performedAction(resetAP:Boolean):void
		{
			var statBar:MovieClip;
			
			switch(activePlayer)
			{
				case 1:
					statBar = statBar1;
				break;
				case 2:
					statBar = statBar2;
				break;
				case 3:
					statBar = statBar3;
				break;
			}
			
			if (resetAP)
			{
				statBar.ap.CurrentValue = 0;
			}
			
			statBar.filters = [];
			activePlayer = 0;
			menuHolder.RemoveChildren();
		}
		
		private function popupMenu():void
		{
			var menuDefault = new MenuDefault();
			menuHolder.PopupInitialMenu(menuDefault);
		}
		
		private function applyGlow(clip:MovieClip):void
		{
			var myGlow:GlowFilter = new GlowFilter();
			myGlow.color = 0xFFFF00;
			clip.filters = [myGlow];
		}
	}
}