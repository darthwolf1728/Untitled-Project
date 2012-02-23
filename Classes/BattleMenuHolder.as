package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class BattleMenuHolder extends MovieClip 
	{
		private var hasChild:Boolean;
		
		public function BattleMenuHolder() 
		{
			init();
			
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(Event.REMOVED, Unload);
		}
		
		private function init():void
		{
			hasChild = false;
		}
		
		public function PopupInitialMenu(menu:MovieClip):void
		{
			addChild(menu);
			scaleX = 0;
			scaleY = 0;
			hasChild = true;
		}
		
		private function Unload(event:Event):void
		{
			if (event.target.name == this.name)
			{
				removeEventListener(Event.ENTER_FRAME, EnterFrame);
			}
		}
		
		public function RemoveChildren():void
		{
			removeChild(getChildAt(0));
		}
		
		private function EnterFrame(event:Event):void
		{
			if (hasChild)
			{
				validateProportions();
				
				if (scaleX < 1)
				{
					scaleX += .2;
				}
				if (scaleY < 1)
				{
					scaleY += .2;
				}
			}
		}
		
		private function validateProportions():void
		{
			if (scaleX < 0)
			{
				scaleX = 0;
			}
			if (scaleX > 1)
			{
				scaleX = 1;
			}
			if (scaleY < 0)
			{
				scaleY = 0;
			}
			if (scaleY > 1)
			{
				scaleY = 1;
			}
		}
	}
}