package 
{
	import flash.display.MovieClip;
	
	public class Item extends MovieClip
	{		
		public var DisplayName:String;
		
		public function Item() 
		{
			init();
		}
		
		private function init():void
		{
			DisplayName = StringHelper.Empty
		}
		
		public function UseItem(baseStats:BaseStats):void
		{
			throw("Cannot 'Use Item' on item parent class!");
		}
	}
}