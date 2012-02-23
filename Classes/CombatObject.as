package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class CombatObject extends MovieClip 
	{		
		public var Dead:Boolean;
		
		public function CombatObject() 
		{
			init();
			addEventListener(Event.ENTER_FRAME, EnterFrame);
			addEventListener(Event.REMOVED, Unload);
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function init():void
		{
			this.alpha = 0;
			Dead = false;
		}
		
		private function Unload(event:Event):void
		{
			if (event.target.name == this.name)
			{
				removeEventListener(Event.ENTER_FRAME, EnterFrame);
			}
		}
		
		private function addedToStage(event:Event):void
		{
			var overworld:Overworld = (this.parent.parent.parent as Overworld);
			
			if (MovieClipHelper.Contains(overworld.DontRenderClipNames, this.parent.name))
			{
				Dead = true;
				this.parent.alpha = 0;
			}
			else
			{
				Dead = false;
			}
		}
		
		private function EnterFrame(event:Event):void
		{
			//this.parent.parent.parent is overworld
			var overworld:Overworld = (this.parent.parent.parent as Overworld);
			
			if (!Dead)
			{
				if (overworld != null)
				{
					if (this.hitTestObject(overworld.Player))
					{
						overworld.DontRenderClipNames.push(this.parent.name);
						overworld.GoToBattle();
					}
				}
			}
		}
	}
}