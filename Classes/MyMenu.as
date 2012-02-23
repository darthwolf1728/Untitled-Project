package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class MyMenu extends MovieClip 
	{
		public var CurrentIndex:int;
		public var Active:Boolean; 
		
		public var SelectedButton:String;
		public var CurrentItem:MovieClip;
		
		public function MyMenu() 
		{
			init();
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(Event.REMOVED, Unload);
		}
		
		private function init():void
		{
			CurrentIndex = 1;
			SelectedButton = StringHelper.Empty;
			Active = true;
			
			hitButton(true, CurrentIndex);
		}
		
		protected function Unload(event:Event):void
		{
			if (event.target.name == this.name)
			{
				removeEventListener(Event.ENTER_FRAME, EnterFrame);
			}
		}
		
		protected function ButtonSelected():void
		{
		}
		
		protected function EnterFrame(event:Event):void
		{
			if (Active)
			{
				if (Game.DownIsPressed)
				{
					CurrentIndex++;
					hitButton(true, CurrentIndex);
				}
				if (Game.UpIsPressed)
				{
					CurrentIndex--;
					hitButton(false, CurrentIndex);
				}
				if (Game.ZIsPressed)
				{
					ButtonSelected();
				}
				alpha = 1.00;
			}
			else
			{
				alpha = .50;
			}
		}
		
		protected function hitButton(indexIncreased:Boolean, tempIndex:int):void
		{
			var tempArray:Array = MovieClipHelper.GetAllChildren(this);
			var array:Array = new Array();
			var tempMovieClip:MovieClip;
			for(var i:int = 0; i < tempArray.length; i++)
			{
				tempMovieClip = (tempArray[i] as MovieClip);
				if (tempMovieClip != null)
				{
					array.push(tempMovieClip);
				}
			}
			
			var endOfArray:Boolean = false;
			
			if (tempIndex - 1 < 1)
			{
				tempIndex = 1;
				endOfArray = true;
			}
			if (tempIndex > array.length)
			{
				tempIndex = array.length;
				endOfArray = true;
			}
			
			var buttonToHit:int = (tempIndex - 1);
			var button:MovieClip = array[buttonToHit];
				
			if (!button.Active && !endOfArray)
			{
				if (indexIncreased)
				{
					tempIndex++;
				}
				else
				{
					tempIndex--;
				}
				hitButton(indexIncreased, tempIndex);
			}
			else
			{
				if (button.Active)
				{
					CurrentIndex = tempIndex;
				}
				else
				{
					if (indexIncreased)
					{
						CurrentIndex--;
					}
					else
					{
						CurrentIndex++;
					}
				}
				
				buttonToHit = (CurrentIndex - 1);
				button = array[buttonToHit];
				
				//Hit button, de-hit other buttons
				for (var j:int = 0; j < array.length; j++)
				{
					array[j].Hit(false);
				}
				
				button.Hit(true);
				
				CurrentItem = button;
				if (button.buttonText != null)
				{
					SelectedButton = button.buttonText.text;
				}
			}
		}
	}
}