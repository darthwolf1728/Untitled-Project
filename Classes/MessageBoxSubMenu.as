package 
{
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class MessageBoxSubMenu extends MyMenu
	{		
		private static const CommandYes:String = "Yes";
		private static const CommandNo:String = "No";

		public function MessageBoxSubMenu() 
		{

		}
		
		protected override function ButtonSelected():void
		{
			//parent.parent.parent is the overworld movie clip
			if (parent.parent.parent != null)
			{
				var tempOverworld:Overworld = (parent.parent.parent as Overworld);
				switch(SelectedButton)
				{
					case CommandYes:
						tempOverworld.YesSelected();
					break;
					case CommandNo:
						tempOverworld.NoSelected();
					break;
				}
			}
		}
	}
}