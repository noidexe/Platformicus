package  
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source='../assets/ctulio.png')]
        private var ImgPlayer:Class;
		
		private var numjumps:Number = 0;
		private var jumping:Boolean = false;
		
		public function Player(X:Number = 0)
		{
			super(X);
			//createGraphic(10, 12, 0xbbaaff11);
			loadGraphic(ImgPlayer, true, true, 34, 40);
			width = 24;
			height = 32;
			offset.x = 0;
			offset.y = 2;
			addAnimation("Idle", [0]);
			addAnimation("Walk", [1, 2], 8);
			addAnimation("Jump", [3]);
			maxVelocity.x = 240;
			maxVelocity.y = 600;
			acceleration.y = 800;
			drag.x = maxVelocity.x * 2;
			flicker(2);
		}
		
		override public function update():void
		{
			acceleration.x = 0;
				if (!FlxG.keys.SPACE)
					jumping = false;
				if (onFloor)
					numjumps = 0;
				if (FlxG.keys.LEFT)
					acceleration.x = -maxVelocity.x * 4;
				if (FlxG.keys.RIGHT)
					acceleration.x = maxVelocity.x * 4;
				if (FlxG.keys.SPACE && (onFloor || numjumps < 2) && !jumping )
					{
						velocity.y = -maxVelocity.y /1.5 ;
						numjumps++;
						jumping = true;
					}
				if (onFloor)
				{
				if (velocity.x == 0) play("Idle");
				else if (velocity.x < 0 ) { facing = LEFT;  play("Walk"); }
				else if (velocity.x > 0 ) { facing = RIGHT; play("Walk"); }
				}
				else play("Jump");
				
				super.update();
				//trace(numjumps);
				trace(x);
				//trace(y);
				
		}
	
	}
}