package 
{
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Game extends MovieClip 
	{
		public static var DownIsDown:Boolean;
		public static var UpIsDown:Boolean;
		public static var LeftIsDown:Boolean;
		public static var RightIsDown:Boolean;
		public static var ZIsDown:Boolean;
		public static var XIsDown:Boolean;
		public static var CIsDown:Boolean;
		public static var EnterIsDown:Boolean;
		public static var EscIsDown:Boolean;
		
		public static var DownIsPressed:Boolean;
		public static var UpIsPressed:Boolean;
		public static var LeftIsPressed:Boolean;
		public static var RightIsPressed:Boolean;
		public static var ZIsPressed:Boolean;
		public static var XIsPressed:Boolean;
		public static var CIsPressed:Boolean;
		public static var EnterIsPressed:Boolean;
		public static var EscIsPressed:Boolean;
		
		private var DownIsUp:Boolean;
		private var UpIsUp:Boolean;
		private var LeftIsUp:Boolean;
		private var RightIsUp:Boolean;
		private var ZIsUp:Boolean;
		private var XIsUp:Boolean;
		private var CIsUp:Boolean;
		private var EnterIsUp:Boolean;
		private var EscIsUp:Boolean;
		
		public var SlotNumber:int;
		public var MainInfo:BasicInfo;

		public static const EventMainMenu = "MainMenu";
		public static const EventOverworld = "Overworld";
		public static const EventBattle = "Battle";
		public static const EventStartingMenu = "StartingMenu";
		
		private var OverworldBackgroundName:String;
		private var OverworldXPos:int;
		private var OverworldYPos:int;
		private var DontRenderClipNames:Array;
		
		private var myTimer:Timer;
		
		public function Game() 
		{
			init();
			
			myTimer.addEventListener(TimerEvent.TIMER, timerListener);
			myTimer.start();
			
			addEventListener(Event.ENTER_FRAME, EnterFrame)
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			addEventListener(EventMainMenu, displayMainMenu);
			addEventListener(EventOverworld, displayOverworld);
			addEventListener(EventBattle, displayBattle);
			addEventListener(EventStartingMenu, startingMenu);

			//dispatchEvent(new Event(EventMainMenu));
			dispatchEvent(new Event(EventStartingMenu));
		}
		
		private function init():void
		{
			DownIsDown = false;
			UpIsDown = false;
			LeftIsDown = false;
			RightIsDown = false;
			ZIsDown = false;
			XIsDown = false;
			CIsDown = false;
			EnterIsDown = false;
			EscIsDown = false;
			
			DownIsPressed = false;
			UpIsPressed = false;
			LeftIsPressed = false;
			RightIsPressed = false;
			ZIsPressed = false;
			XIsPressed = false;
			CIsPressed = false;
			EnterIsPressed = false;
			EscIsPressed = false;
			
			DownIsUp = true;
			UpIsUp = true;
			LeftIsUp = true;
			RightIsUp = true;
			ZIsUp = true;
			XIsUp = true;
			CIsUp = true;
			EnterIsUp = true;
			EscIsUp = true;
			
			myTimer = new Timer(1000);
			
			MainInfo = new BasicInfo();
			SlotNumber = -1;
			
			SetOverworldInfo("Background_Test1", 200, 200, new Array());
			
			//battle = new Battle();
//			
//			battle.baseStatsPlayer1 = Constants.GetPlayer1StartingStats();
//			battle.baseStatsPlayer2 = Constants.GetPlayer2StartingStats();
//			battle.baseStatsPlayer3 = Constants.GetPlayer3StartingStats();
//			
//			battle.InitializeValues();
		}
		
		//Button handling
		private function EnterFrame(event:Event):void
		{
			if (DownIsUp && DownIsDown)
			{
				DownIsUp = false;
				DownIsPressed = true;
			}
			else
			{
				DownIsPressed = false;
			}
			if (UpIsUp && UpIsDown)
			{
				UpIsUp = false;
				UpIsPressed = true;
			}
			else
			{
				UpIsPressed = false;
			}
			if (LeftIsUp && LeftIsDown)
			{
				LeftIsUp = false;
				LeftIsPressed = true;
			}
			else
			{
				LeftIsPressed = false;
			}
			if (RightIsUp && RightIsDown)
			{
				RightIsUp = false;
				RightIsPressed = true;
			}
			else
			{
				RightIsPressed = false;
			}
			if (ZIsUp && ZIsDown)
			{
				ZIsUp = false;
				ZIsPressed = true;
			}
			else
			{
				ZIsPressed = false;
			}
			if (XIsUp && XIsDown)
			{
				XIsUp = false;
				XIsPressed = true;
			}
			else
			{
				XIsPressed = false;
			}
			if (CIsUp && CIsDown)
			{
				CIsUp = false;
				CIsPressed = true;
			}
			else
			{
				CIsPressed = false;
			}
			if (EnterIsUp && EnterIsDown)
			{
				EnterIsUp = false;
				EnterIsPressed = true;
			}
			else
			{
				EnterIsPressed = false;
			}
			if (EscIsUp && EscIsDown)
			{
				EscIsUp = false;
				EscIsPressed = true;
			}
			else
			{
				EscIsPressed = false;
			}
		}
		
		private function onKeyPress(keyboardEvent:KeyboardEvent):void
		{
		 	if (keyboardEvent.keyCode == Keyboard.DOWN)
			{
				DownIsDown = true;
			}
			if (keyboardEvent.keyCode == Keyboard.UP)
			{
				UpIsDown = true;
			}
			if (keyboardEvent.keyCode == Keyboard.LEFT)
			{
				LeftIsDown = true;
			}
			if (keyboardEvent.keyCode == Keyboard.RIGHT)
			{
				RightIsDown = true;
			}
			if (keyboardEvent.keyCode == Constants.Keyboard_Z)
			{
				ZIsDown = true;
			}
			if (keyboardEvent.keyCode == Constants.Keyboard_X)
			{
				XIsDown = true;
			}
			if (keyboardEvent.keyCode == Constants.Keyboard_C)
			{
				CIsDown = true;
			}
			if (keyboardEvent.keyCode == Keyboard.ENTER)
			{
				EnterIsDown = true;
			}
			if (keyboardEvent.keyCode == Keyboard.ESCAPE)
			{
				EscIsDown = true;
			}
		}
		private function onKeyRelease(keyboardEvent:KeyboardEvent):void
		{
		 	if (keyboardEvent.keyCode == Keyboard.DOWN)
			{
				DownIsDown = false;
				DownIsUp = true;
			}
			if (keyboardEvent.keyCode == Keyboard.UP)
			{
				UpIsDown = false;
				UpIsUp = true;
			}
			if (keyboardEvent.keyCode == Keyboard.LEFT)
			{
				LeftIsDown = false;
				LeftIsUp = true;
			}
			if (keyboardEvent.keyCode == Keyboard.RIGHT)
			{
				RightIsDown = false;
				RightIsUp = true;
			}
			if (keyboardEvent.keyCode == Constants.Keyboard_Z)
			{
				ZIsDown = false;
				ZIsUp = true;
			}
			if (keyboardEvent.keyCode == Constants.Keyboard_X)
			{
				XIsDown = false;
				XIsUp = true;
			}
			if (keyboardEvent.keyCode == Constants.Keyboard_C)
			{
				CIsDown = false;
				CIsUp = true;
			}
			if (keyboardEvent.keyCode == Keyboard.ENTER)
			{
				EnterIsDown = false;
				EnterIsUp = true;
			}
			if (keyboardEvent.keyCode == Keyboard.ESCAPE)
			{
				EscIsDown = false;
				EscIsUp = true;
			}
		}
		
		private function timerListener (e:TimerEvent):void
		{
			if (MainInfo != null)
			{
				MainInfo.TimePlayed++;
			}
		}
		
		public function SetOverworldInfo(instanceName:String, xPos:int, yPos:int, dontRenderClipNames:Array)
		{
			OverworldBackgroundName = instanceName;
			OverworldXPos = xPos;
			OverworldYPos = yPos;
			DontRenderClipNames = dontRenderClipNames;
		}
		
		private function displayBattle(event:Event):void
		{
			RemoveChildren();
			addChild(new Battle(MainInfo.PartyLineup));
		}
		
		private function displayMainMenu(event:Event):void
		{
			RemoveChildren();
			addChild(new MainMenu(MainInfo));
		}
		
		private function displayOverworld(event:Event):void
		{
			RemoveChildren();
			addChild(new Overworld(OverworldBackgroundName, OverworldXPos, OverworldYPos, DontRenderClipNames));
		}
		
		private function startingMenu(event:Event):void
		{
			RemoveChildren();
			addChild(new StartingMenuPlaceholder());
		}
		
		public function RemoveChildren():void
		{
			if (numChildren > 0)
			{
				removeChildAt(0);
				RemoveChildren();
			}
		}
		
		private function onAddToStage(event:Event):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
		}
	}
}