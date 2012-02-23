package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class StartingMenuPlaceholder extends MovieClip 
	{
		public function StartingMenuPlaceholder() 
		{
			init();
		}
		
		private function init():void
		{
			DisplayStartingMenu();
		}
		
		private function removeChildren():void
		{
			if (menuPlaceholder.numChildren > 0)
			{
				menuPlaceholder.removeChildAt(0);
				removeChildren();
			}
		}
		
		public function DisplayStartingMenu():void
		{
			removeChildren();
			menuPlaceholder.addChild(new StartingMenu());
		}
		
		public function GoToNewGameMenu():void
		{
			removeChildren();
			menuPlaceholder.addChild(new LoadGameMenu_(LoadGameMenu_.MenuTypeNewGame));
		}
		
		public function GoToLoadGameMenu():void
		{
			removeChildren();
			menuPlaceholder.addChild(new LoadGameMenu_(LoadGameMenu_.MenuTypeLoadGame));
		}
		
		public function GoToDeleteGameMenu():void
		{
			removeChildren();
			menuPlaceholder.addChild(new LoadGameMenu_(LoadGameMenu_.MenuTypeDeleteGame));
		}
		
		public function GoToUserInfoInput():void
		{
			removeChildren();
			menuPlaceholder.addChild(new EnterUserInfo());
		}
		
		public function StartNewGame():void
		{
			//this.parent is the game movie clip
			removeChildren();
			this.parent.dispatchEvent( new Event(Game.EventOverworld));
		}
		
	}
}