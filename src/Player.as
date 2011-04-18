package  
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source='../assets/ctulio-16.png')]
        private var ImgPlayer:Class;
		
		private var numjumps:Number = 0;
		private var jumping:Boolean = false;
		
		public function Player(X:Number = 0)
		{
			super(X);
			//createGraphic(10, 12, 0xbbaaff11);
			loadGraphic(ImgPlayer, true, true, 40, 40);
			width = 20;
			height = 30;
			offset.x = 10;
			offset.y = 10;
			addAnimation("Idle", [0,1,2,1], 3, true);
			addAnimation("Walk", [3, 4,5,6,7,8,9,10,11,12,13,14], 18);
			addAnimation("Jump", [3]);
			maxVelocity.x = 240;
			maxVelocity.y = 600;
			acceleration.y = 800;
			drag.x = maxVelocity.x * 2;
			flicker(2);
			//y = 770;
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
				//trace(x);
				//trace(y);
				
		}
	
	}
}