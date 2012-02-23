package 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.events.Event;
	
	public class MessageBox extends MovieClip 
	{		
		public function MessageBox(messageText:String, showOptions) 
		{
			addEventListener(Event.REMOVED, Unload);
			init();
			messageTxt.text = messageText;
			if (showOptions)
			{
				addOptions();
			}
		}
		
		private function Unload(event:Event):void
		{
			if (event.target.name == this.name)
			{
				removeMenuChildren(this);
			}
		}
		
		private function removeMenuChildren(clipToRemove:MovieClip):void
		{
			while (yesnoPlaceholder.numChildren > 0)
			{
				yesnoPlaceholder.removeChildAt(0);
			}
		}
		
		private function init():void
		{
			
		}
		
		private function addOptions():void
		{
			yesnoPlaceholder.addChild(new MessageBoxSubMenu());
		}
	}
}