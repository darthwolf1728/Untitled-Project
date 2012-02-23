package 
{
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class StartingMenuMenu extends MyMenu
	{		
		private static const CommandNewGame:String = "New Game";
		private static const CommandLoadGame:String = "Load Game";
		private static const CommandDeleteGame:String = "Delete Game";

		public function StartingMenuMenu() 
		{

		}
		
		protected override function ButtonSelected():void
		{
			//parent.parent.parent is the starting menu movie clip
			if (parent.parent.parent != null)
			{
				var tempMenu:StartingMenuPlaceholder = (parent.parent.parent as StartingMenuPlaceholder);
				switch(SelectedButton)
				{
					case CommandNewGame:
						tempMenu.GoToNewGameMenu();
					break;
					case CommandLoadGame:
						tempMenu.GoToLoadGameMenu();
					break;
					case CommandDeleteGame:
						tempMenu.GoToDeleteGameMenu();
					break;
				}
			}
		}
	}
}