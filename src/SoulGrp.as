package  
{
	import org.flixel.*;
	
	public class SoulGrp extends FlxGroup
	{
		private var soulList:Array;
		
		public function SoulGrp(soulList:Array) 
		{
			super();
			this.soulList = soulList;
		}
		
		override public function update()
		{
			trace(this.soulList);
		}
		
		
	}

}