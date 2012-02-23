package
{
	public class StringHelper
	{
		public function StringHelper()
		{
		}
		
		public static const Empty = "";
		
		private static const FindParameterInvalidString = "Char to find must have length of 1!";
		private static const ReplaceParameterInvalidString = "Char to replace must have length of 1!";
		private static const SearchParameterInvalidString = "String to search must have length of at least 1!";
		
		public static function IsNullOrEmpty(stringToCheck:String):Boolean
		{
			if (stringToCheck == null || stringToCheck == Empty)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		public static function Replace(charToFind:String, charToReplace:String, stringToSearch:String):String
		{
			if (charToFind == null || charToFind.length != 1)
			{
				throw (FindParameterInvalidString);
			}
			if (charToReplace == null || charToReplace.length != 1)
			{
				throw (ReplaceParameterInvalidString);
			}
			if (stringToSearch == null || stringToSearch.length < 1)
			{
				throw (SearchParameterInvalidString);
			}
			
			var stringToReturn:String = StringHelper.Empty;
			var maxLength:int = (stringToSearch.length -1);
			
			for (var i:int = 0; i <= maxLength; i++)
			{
				var currentChar:String = stringToSearch.charAt(i);
				if (currentChar == charToFind)
				{
					currentChar = charToReplace;
				}
				stringToReturn += currentChar;
			}
			
			return stringToReturn;
		}
	}
}