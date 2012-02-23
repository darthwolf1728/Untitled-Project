package 
{
	import flash.display.MovieClip;
	
	public class Item_NewTest extends Item
	{		
		public function Item_NewTest() 
		{
			init();
		}
		
		private function init():void
		{
			DisplayName = "Something Else";
		}
		
		public override function UseItem(baseStats:BaseStats):void
		{
			baseStats.Health += 20;
		}
	}
}