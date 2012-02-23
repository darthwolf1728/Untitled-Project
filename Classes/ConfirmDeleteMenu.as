package 
{
	import flash.events.Event;
	public class ConfirmDeleteMenu extends MyMenu
	{		
		private static const CommandYes:String = "Yes";
		private static const CommandNo:String = "No";

		public function ConfirmDeleteMenu() 
		{
		}
		
		protected override function ButtonSelected():void
		{
			//parent.parent is the load info movie clip
			if (parent.parent != null)
			{
				var menu:LoadGameMenu_ = (parent.parent as LoadGameMenu_)
				switch(SelectedButton)
				{
					case CommandYes:
						menu.ConfirmDeleteYes();
					break;
					case CommandNo:
						menu.ConfirmDeleteNo();
					break;
				}
			}
		}
	}
}