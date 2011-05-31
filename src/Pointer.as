package  
{

	import org.flixel.*;
	
	public class Pointer extends FlxSprite
	{
		//Graphics
		[Embed(source = '../assets/soul2.png')] private var ImgSoul:Class;
		[Embed(source = '../assets/leveltiles-16.png')] private var ImgTile:Class;
		
		public function Pointer()
		{
			super ();
						
			//Graphics setup
			loadGraphic(ImgTile, true, false, 16, 16, false);
			addAnimation("Block", [0]);
		    //loadGraphic(ImgSoul, true, false, 15, 15);
			addAnimation("Idle", [0, 1, 2, 3, 4, 5, 6], 15, true);
			play("Block");
			color = 0xffff00;
			blend = "invert";
			
			
		}
		
		override public function update():void
		{
			if (FlxG.keys.justPressed("CONTROL"))
			{
				loadGraphic(ImgSoul, true, false, 15, 15);
				play("Idle");
			}
			if (FlxG.keys.justReleased("CONTROL"))
			{
				loadGraphic(ImgTile, true, false, 16, 16, false);
				play("Block");
			}
			x = FlxG.mouse.x
			y = FlxG.mouse.y
		}
		
		
		
	}

}