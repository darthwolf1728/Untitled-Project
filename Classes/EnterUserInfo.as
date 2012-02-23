package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;	
	
	public class EnterUserInfo extends MovieClip 
	{
		public function EnterUserInfo() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddToStage);
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(Event.REMOVED, Unload);
		}
		
		private function onAddToStage(event:Event):void
		{
			stage.focus = tbName;
		}
		
		private function Unload(event:Event):void
		{
			if (event.target.name == this.name)
			{
				stage.focus = stage;
				removeEventListener(Event.ENTER_FRAME, EnterFrame);
			}
		}
		
		private function EnterFrame(event:Event):void
		{
			if (Game.EscIsPressed)
			{
				//parent.parent is starting menu placeholder
				var tempMenu:StartingMenuPlaceholder = (parent.parent as StartingMenuPlaceholder);
				tempMenu.DisplayStartingMenu();
			}
			
			if (Game.EnterIsPressed)
			{
				trace (this.parent.parent.parent);
				var theGame:Game = (this.parent.parent.parent as Game);
				theGame.MainInfo.UserName = tbName.text;
				var mainMenuPlaceholder:StartingMenuPlaceholder = (this.parent.parent as StartingMenuPlaceholder);
				mainMenuPlaceholder.StartNewGame();
			}
		}
	}
}