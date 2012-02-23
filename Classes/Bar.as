package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	
	public class Bar extends MovieClip 
	{		
		public var bar_slider:Bar_Slider;
		public var CurrentValue:Number;
		public var MaxValue:int;
		public var BarType:int;
		public var DisplayValue:int;
		
		public function Bar() 
		{
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(Event.REMOVED, Unload);
			init();
		}
		
		private function init():void
		{
			bar_slider = null;
			CurrentValue = 0;
			MaxValue = 0;
			BarType = 0;
			DisplayValue = 0;
		}
		
		public function InitializeValues():void
		{
			switch(BarType)
			{
				case Constants.BarType_HEALTH:
					var barSliderGreen = new Bar_Slider_Green();
					bar_slider = barSliderGreen;
				break;
				case Constants.BarType_MAGIC:
					var barSliderBlue = new Bar_Slider_Blue();
					bar_slider = barSliderBlue;
				break;
				case Constants.BarType_ACTION:
					var barSliderYellow = new Bar_Slider_Yellow();
					bar_slider = barSliderYellow;
					MaxValue = Constants.MaxActionPoints;
				break;
				case Constants.BarType_EXP:
					var barSliderOrange = new Bar_Slider_Orange();
					bar_slider = barSliderOrange;
					MaxValue = Constants.MaxExperiencePoints;
				break;
				case Constants.BarType_JP:
					var barSliderRed = new Bar_Slider_Red();
					bar_slider = barSliderRed;
				break;
			}
			
			var depth:int = getChildIndex(holder);
			addChildAt(bar_slider, (depth - 1));
		}
		
		private function EnterFrame(event:Event):void
		{
			if (CurrentValue > MaxValue)
			{
				CurrentValue = MaxValue;
			}
			if (CurrentValue < 0)
			{
				CurrentValue = 0;
			}
			
			var adjustedValue:int = ((CurrentValue / MaxValue) * 100);
			DisplayValue = Math.ceil(CurrentValue);
			
			if (adjustedValue > 100)
			{
				adjustedValue = 100;
			}
			if (adjustedValue < 0)
			{
				adjustedValue = 0;
			}
			
			if (bar_slider != null)
			{
				bar_slider.width = adjustedValue;
			}
			display.text = (DisplayValue + " / " + MaxValue);
		}
		
		private function Unload(event:Event):void
		{
			if (event.target.name == this.name)
			{
				removeEventListener(Event.ENTER_FRAME, EnterFrame);
			}
		}
	}
}