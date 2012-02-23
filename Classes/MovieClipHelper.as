package 
{
	import flash.display.MovieClip;
	
	public class MovieClipHelper
	{
		public function MovieClipHelper() 
		{
			
		}
		
		public static function Contains(arrayToCheck:Array, stringToCheck:String):Boolean
		{
			for(var i:int = 0; i < arrayToCheck.length; i++)
			{
				if (arrayToCheck[i] == stringToCheck)
				{
					return true;
				}
			}
			return false;
		}
		
		public static function GetAllChildren(mClip:MovieClip):Array
		{
			var array:Array = new Array();
			
			for (var i:int = 0; i < mClip.numChildren; i++)
			{
				array[i] = mClip.getChildAt(i);
			}
			
			return array;
		}
		
		public static function FormatTwoPlaces(intToFormat:int):String
		{
			switch (intToFormat)
			{
				case 0:
				case 1:
				case 2:
				case 3:
				case 4:
				case 5:
				case 6:
				case 7:
				case 8:
				case 9:
				return ("0" + intToFormat.toString());
				break;
				default:
					return intToFormat.toString();
				break;
			}
		}
		
		public static function FormatShortDate(dateToFormat:Date):String
		{
			return ((dateToFormat.month + 1) + "/" + dateToFormat.date + "/" + dateToFormat.fullYear);
		}
		
		public static function FormatShortTime(dateToFormat:Date):String
		{
			return ((dateToFormat.hours + 1) + ":" + dateToFormat.minutes + ":" + dateToFormat.seconds);
		}
		
		public static function FormatFullDateInfo(dateToFormat:Date):String
		{
			return (FormatShortDate(dateToFormat) + " " + FormatShortTime(dateToFormat));
		}
		
		public static function FormatIntAsTime(intToFormat:int):String
		{
			var numSeconds:int = intToFormat;
			var numMinutes:int = Math.floor(numSeconds / 60);
			var numHours:int = Math.floor(numMinutes / 60);
			
			numMinutes -= (numHours * 60);
			numSeconds -= (numMinutes * 60);
			
			var stringToReturn:String = (FormatTwoPlaces(numHours) + ":" + FormatTwoPlaces(numMinutes) + ":" + FormatTwoPlaces(numSeconds));
			return stringToReturn;
		}
		
		//public static function DeleteAllChildren(mClip:MovieClip, removeClip:Boolean)
//		{
//			if (mClip != null)
//			{
//				if (mClip.numChildren > 0)
//				{
//					var clipToDelete:MovieClip = (mClip.getChildAt(0) as MovieClip);
//					DeleteAllChildren(clipToDelete, true);
//				}
//				if (removeClip && mClip.parent != null)
//				{
//					mClip.parent.removeChild(mClip);
//				}
//			}
//		}
	}
}