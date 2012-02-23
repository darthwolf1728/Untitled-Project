package 
{
	import flash.events.Event;
	import flash.display.MovieClip;
	
	public class OverworldPlayer extends MovieClip 
	{
		private static const Speed:int = 5;
		private var lastX:int;
		private var lastY:int;
		
		public function OverworldPlayer() 
		{
			init();
		}
		
		private function init():void
		{
			lastX = x;
			lastY = y;
		}
		
		public function MoveUp():void
		{
			y -= Speed;
		}
		public function MoveDown():void
		{
			y += Speed;
		}
		public function MoveLeft():void
		{
			x -= Speed;
		}
		public function MoveRight():void
		{
			x += Speed;
		}
		
		public function CaptureXY():void
		{
			lastX = x;
			lastY = y;
		}
		
		public function StopPlayer():void
		{
			x = lastX;
			y = lastY;
		}
	}
}