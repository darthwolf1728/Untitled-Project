package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class MyButton extends MyButton_Super
	{
		public function MyButton() 
		{
			
		}
		
		public function InitializeValues(textWidth:int, textHeight:int, fontSize:int, buttonName:String):void
		{
			stop();
			buttonText = new TextField();
			var format:TextFormat = new TextFormat();
			
			var yOffset = ((textHeight / 6) - 2);
			
			buttonText.y = yOffset;
			buttonText.width = textWidth; //80
			buttonText.height = textHeight; //16
			
			format.align =  TextFormatAlign.CENTER;
			format.font = "Arial";
			format.bold = true;
			format.size = fontSize; //10
			
			var textToSet:String = null;
			
			if (buttonName != null)
			{
				textToSet = buttonName;
			}
			else
			{
				textToSet = this.name;
			}
			
			var tempArray:Array = textToSet.split(Constants.ButtonSplitName);
			
			if (tempArray[1] != null)
			{
				textToSet = tempArray[1];
			}
			else
			{
				textToSet = Constants.ButtonSplitError
			}
			
			textToSet = StringHelper.Replace("_", " ", textToSet);
			
			buttonText.text = textToSet;
			buttonText.setTextFormat(format);
			
			addChild(buttonText);
		}
	}
}