package 
{
	import flash.events.Event;
	import flash.display.MovieClip;
	import flash.utils.getDefinitionByName;
	
	public class Overworld extends MovieClip 
	{
		public var Player:OverworldPlayer;
		public var DontRenderClipNames:Array;
		
		private var OverworldBackgroundName:String;
		private var OverworldBackground:Background;
		
		public static const PlayerClipName = "PlayerClipName";
		
		private static const MessageClipName = "MessageClipName";
		
		public var MessageIsShown:Boolean;
		private var RemoveMessage:Boolean;
		private var MakingDecion:Boolean;
		
		private var MessageQueue:String;
		private var CommandName:String;
		
		public function Overworld(instanceName:String, xPos:int, yPos:int, dontRenderClipNames:Array)
		{
			init();
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(Event.REMOVED, Unload);
			
			DontRenderClipNames = dontRenderClipNames;
			AddContent(instanceName, xPos, yPos);
		}
		
		private function init():void
		{
			MessageIsShown = false;
			RemoveMessage = false;
			MakingDecion = false;
			
			DontRenderClipNames = new Array();
			
			MessageQueue = StringHelper.Empty;
		}
		
		private function Unload(event:Event):void
		{
			if (event.target.name == this.name)
			{
				removeChildren();
				removeEventListener(Event.ENTER_FRAME, EnterFrame);
			}
		}
		
		private function EnterFrame(event:Event):void
		{
			if (RemoveMessage)
			{
				DeleteMessage();
			}
			if (!MessageIsShown)
			{
				if (Game.UpIsDown || Game.DownIsDown || Game.LeftIsDown || Game.RightIsDown)
				{
					Player.CaptureXY();
					if (Game.UpIsDown)
					{
						Player.MoveUp();
					}
					if (Game.DownIsDown)
					{
						Player.MoveDown();
					}
					if (Game.LeftIsDown)
					{
						Player.MoveLeft();
					}
					if (Game.RightIsDown)
					{
						Player.MoveRight();
					}
				}
				if (Game.CIsPressed)
				{
					//parent is Game movieclip
					goToMenu();
				}
			}
			else
			{
				if (!MakingDecion)
				{
					if (Game.ZIsPressed)
					{
						RemoveMessage = true;
					}
				}
			}
		}
		
		private function goToMenu():void
		{
			if (parent != null)
			{
				var theGame:Game = (parent as Game);
				theGame.SetOverworldInfo(OverworldBackgroundName, Player.x, Player.y, DontRenderClipNames);
				theGame.dispatchEvent(new Event(Game.EventMainMenu));
			}
		}
		
		public function GoToBattle():void
		{
			if (parent != null)
			{
				var theGame:Game = (parent as Game);
				theGame.SetOverworldInfo(OverworldBackgroundName, Player.x, Player.y, DontRenderClipNames);
				theGame.dispatchEvent(new Event(Game.EventBattle));
			}
		}
		
		private function goToMainMenu():void
		{
			if (parent != null)
			{
				var theGame:Game = (parent as Game);
				theGame.dispatchEvent(new Event(Game.EventStartingMenu));
			}
		}
		
		private function removeChildren():void
		{
			if (numChildren > 0)
			{
				removeChildAt(0);
				removeChildren();
			}
		}
		
		public function AddContent(instanceName:String, playerX:int, playerY:int):void
		{
			removeChildren();
			
			var tempPlayer:OverworldPlayer = new OverworldPlayer();
			tempPlayer.name = PlayerClipName;
			tempPlayer.x = playerX;
			tempPlayer.y = playerY;
			
			Player = tempPlayer;

			var copyBkg:Class = getDefinitionByName(instanceName) as Class;
			OverworldBackgroundName = instanceName;
			OverworldBackground = (new copyBkg);
	
			addChild(OverworldBackground);
			addChild(Player);
		}
		
		public function DeleteMessage()
		{
			if (StringHelper.IsNullOrEmpty(MessageQueue))
			{
				actuallyDeleteMessage();
			}
			else
			{
				RenderMessage(MessageQueue);
			}
		}
		
		private function actuallyDeleteMessage():void
		{
			var messageBox:MovieClip = getChildByName(MessageClipName) as MovieClip;
			if (messageBox != null)
			{
				removeChild(messageBox);
			}
			MessageIsShown = false;
			RemoveMessage = false;
			MakingDecion = false;
		}
		
		public function DisplayMessage(variableToGet:String):void
		{
			if (!MessageIsShown)
			{
				var tempArray:Array = variableToGet.split(Constants.MessageSplitCharacter);
				var index:int = tempArray[1];
				var messageText:String = OverworldBackground.Messages[index];
				RenderMessage(messageText);
			}
		}
		
		public function RenderMessage(messageText:String)
		{
			actuallyDeleteMessage();
			
			var tempArray:Array = messageText.split(Constants.NewlineCharacter);
			messageText = tempArray[0];
			
			MessageQueue = StringHelper.Empty;
			for (var i:int = 1; i < tempArray.length; i++)
			{
				MessageQueue += tempArray[i];
			}
			
			tempArray = messageText.split(Constants.CommandSplitCharacter);
			messageText = tempArray[0];
			CommandName = tempArray[1];
			if (StringHelper.IsNullOrEmpty(CommandName))
			{
				MakingDecion = false;
			}
			else
			{
				MakingDecion = true;
			}
			
			var tempMessageBox:MessageBox = new MessageBox(messageText, MakingDecion)
			tempMessageBox.name = MessageClipName;
			addChild(tempMessageBox);
			MessageIsShown = true;
		}
		
		private function saveGame():void
		{
			var theGame:Game = (this.parent as Game);
			SaveGameManager.SaveGame(theGame);
		}
		
		public function YesSelected():void
		{
			switch(CommandName)
			{
				case Constants.Command_SaveGame:
					saveGame();
					RenderMessage("Game saved!" + Constants.NewlineCharacter + Constants.ContinuePlayingDialogue);
				break;
				case Constants.Command_ContinuePlaying:
					DeleteMessage();
				break;
			}
		}
		public function NoSelected():void
		{
			switch(CommandName)
			{
				case Constants.Command_SaveGame:
					RenderMessage(Constants.ContinuePlayingDialogue);
				break;
				case Constants.Command_ContinuePlaying:
					goToMainMenu();
				break;
			}
		}
	}
}