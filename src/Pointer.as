package  
{

	import org.flixel.*;
	
	public class Pointer extends FlxSprite
	{
		//Graphics
		[Embed(source = '../assets/soul2.png')] private var ImgSoul:Class;
		
		public function Pointer()
		{
			super ();
						
			//Graphics setup
			loadGraphic(ImgSoul, true, false, 15, 15);
			addAnimation("Idle", [0, 1, 2, 3, 4, 5, 6], 15, true);
			play("Idle");
			
			
		}
		
		override public function update():void
		{
			x = FlxG.mouse.x
			y = FlxG.mouse.y
		}
		
		
		
	}

}