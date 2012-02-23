package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class MyObjectMenu extends MovieClip 
	{
		private static const EventObjectSelected:String = "ObjectSelected";
		
		public var CurrentIndex:int;
		public var SelectedObject:MovieClip;
		public var Active:Boolean; 
		public var ItemCollection:Array;
		
		private var RowSize:int;
		private var IncrementX:int;
		private var IncrementY:int;
		private var ObjectSelector:Selector;
		
		public function MyObjectMenu(rowSize:int, itemCollection:Array, xSpacing:int, ySpacing:int) 
		{
			RowSize = rowSize;
			ItemCollection = itemCollection;
			
			//Assumes all items in collection are the same size
			if (ItemCollection[0] != null)
			{
				var objectWidth:int = ItemCollection[0].width;
				var objectHeight:int = ItemCollection[0].height;
			}
			
			IncrementX = (xSpacing + objectWidth);
			IncrementY = (ySpacing + objectHeight);
			
			init();
			ObjectSelector.height = objectHeight;
			ObjectSelector.width = objectWidth;
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(Event.REMOVED, Unload);
			
			deployItems();
		}
		
		private function init():void
		{
			ObjectSelector = new Selector();
			CurrentIndex = 1;
			SelectedObject = null;
			Active = true;
		}
		
		private function Unload(event:Event):void
		{
			if (event.target.name == this.name)
			{
				removeEventListener(Event.ENTER_FRAME, EnterFrame);
			}
		}
		
		public function Refresh():void
		{
			removeChildren();
			deployItems();
		}
		
		private function removeChildren():void
		{
			while (numChildren > 0)
			{
				removeChild(getChildAt(0));
			}
		}
		
		private function deployItems():void
		{
			var currentX:int = 0;
			var currentY:int = 0;
			var rowCounter:int = 0;
			
			for (var i:int = 0; i < ItemCollection.length; i++)
			{
				var item:MovieClip = ItemCollection[i];
				item.x = currentX;
				item.y = currentY;
				addChild(item);
				
				currentX += IncrementX;
				rowCounter++;
				if (rowCounter >= RowSize)
				{
					rowCounter = 0;
					currentY += IncrementY;
					currentX = 0;
				}
			}
			
			addChild(ObjectSelector);
			setChildIndex(ObjectSelector,numChildren - 1);
		}
		
		private function EnterFrame(event:Event):void
		{
			if (Active)
			{
				if (SelectedObject != null)
				{
					ObjectSelector.alpha = 1.00;
				}
				else
				{
					ObjectSelector.alpha = 0;
				}
				
				if (Game.DownIsPressed)
				{
					CurrentIndex += RowSize;
				}
				if (Game.UpIsPressed)
				{
					CurrentIndex -= RowSize;
				}
				if (Game.LeftIsPressed)
				{
					CurrentIndex--;
				}
				if (Game.RightIsPressed)
				{
					CurrentIndex++;
				}
				if (Game.ZIsPressed)
				{
					dispatchEvent(new Event(EventObjectSelected));
				}
				hitButton();
			}
			else
			{
				ObjectSelector.alpha = 0;
			}
		}
		
		private function hitButton():void
		{
			var array:Array = ItemCollection;
			
			if (array.length > 0)
			{
				if (CurrentIndex - 1 < 1)
				{
					CurrentIndex = 1;
				}
				if (CurrentIndex > array.length)
				{
					CurrentIndex = array.length;
				}
				
				var objectToHit:int = (CurrentIndex - 1);
				ObjectSelector.y = array[objectToHit].y;
				ObjectSelector.x = array[objectToHit].x;
				SelectedObject = array[objectToHit];
			}
			else
			{
				SelectedObject = null;
			}
		}
	}
}