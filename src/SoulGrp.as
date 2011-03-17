package  
{
	import org.flixel.*;
	
	public class SoulGrp extends FlxGroup
	{
		private var coinlist:Array;
		
		public function SoulGrp(thelist:Array) 
		{
			super();
			coinlist = thelist;
		}
		
		override public function update()
		{
			trace(coinlist);
		}
		
		
	}

}