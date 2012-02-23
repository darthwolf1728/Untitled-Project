package 
{
	import flash.display.MovieClip;
	
	public class Item_Potion extends Item
	{		
		public function Item_Potion() 
		{
			init();
		}
		
		private function init():void
		{
			DisplayName = "Potion";
		}
		
		public override function UseItem(baseStats:BaseStats):void
		{
			baseStats.Health += 20;
		}
	}
}