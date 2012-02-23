package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;	
	
	public class Slot extends MovieClip 
	{
		public var Name:String;
		public var TimePlayed:int;
		public var LastSaved:Date;
		
		public function Slot(playerName:String, time, lastSaved)
		{
			Name = playerName;
			TimePlayed = time;
			LastSaved = lastSaved;
			
			setDiplayInfo();
		}
		
		private function setDiplayInfo():void
		{
			tbNameText.text = Name;
			if (LastSaved != null)
			{
				tbDate.text = MovieClipHelper.FormatFullDateInfo(LastSaved);
			}
			if (TimePlayed != 0)
			{
				tbTimePlayed.text = MovieClipHelper.FormatIntAsTime(TimePlayed);
			}
		}
	}
}