package  
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		[Embed(source='../assets/ctulio-16.png')]
        private var ImgPlayer:Class;
		
		private var numjumps:Number = 0;
		private var jumping:Boolean = false;
		
		[Embed(source = '../assets/fly.mp3')] private var SndFly:Class;
		private var SndFlyObj:FlxSound;
		
		[Embed(source = '../assets/steps.mp3')] private var SndStep1:Class;
		[Embed(source = '../assets/steps2.mp3')] private var SndStep2: Class;
		[Embed(source = '../assets/steps3.mp3')] private var SndStep3: Class;
		private var SndSteps:FlxSound;
		
		public function Player(X:Number = 0)
		{
			super(X);
			//createGraphic(10, 12, 0xbbaaff11);
			//SndFlyObj = new FlxSound();
			//SndFlyObj.loadEmbedded(SndFly, true);
			
			//SndSteps = new FlxSound();
			//SndSteps.loadEmbedded(SndStep3, true);
			
			loadGraphic(ImgPlayer, true, true, 60, 40);
			width = 20;
			height = 30;
			offset.x = 20;
			offset.y = 10;
			addAnimation("Idle", [0,1,2,1], 3, true);
			addAnimation("Walk", [3, 4,5,6,7,8,9,10,11,12,13,14], 18);
			addAnimation("Jump", [15,16,17,18,19,20], 15);
			maxVelocity.x = 240;
			maxVelocity.y = 400;
			acceleration.y = 400;
			drag.x = maxVelocity.x * 2;
			flicker(2);
			//y = 770;
			FlxG.watch(this, "x");
			FlxG.watch(this, "y");
			jumping = true;
		}
		
		override public function update():void
		{
			acceleration.x = 0;
				if (!FlxG.keys.SPACE)
					jumping = false;
				if (isTouching(FLOOR))
						numjumps = 0;
				if (FlxG.keys.LEFT)
					acceleration.x = -maxVelocity.x * 4;
				if (FlxG.keys.RIGHT)
					acceleration.x = maxVelocity.x * 4;
				if (FlxG.keys.SPACE && (isTouching(FLOOR) || numjumps < 2) && !jumping )
					{
						velocity.y = -maxVelocity.y /1.5 ;
						numjumps++;
						jumping = true;
					}
				if (isTouching(FLOOR))  //<code style="groncho"> //Si esta tocando el piso
				{
					if (velocity.x == 0) // Y no se esta moviendo
					{ 
						play("Idle");  //Repdoducir animacion idle
						if (SndSteps)  //Parar sonido de pasos
						{
							SndSteps.stop();
							SndSteps = null;
						} 
						if (SndFlyObj) //Parar sonido de vuelo
						{
							SndFlyObj.stop();
							SndFlyObj = null;
						}
					}
					else if (acceleration.x < 0 ) 
					{ 
						facing = LEFT;
						play("Walk");
						if (SndFlyObj)
						{ 
							SndFlyObj.stop();
							SndFlyObj = null;
						}
						if(!SndSteps) SndSteps = FlxG.play(SndStep3,1,true);
					}
					else if (acceleration.x > 0 )
					{ 
						facing = RIGHT; 
						play("Walk");
						if (SndFlyObj)
						{
							SndFlyObj.stop();
							SndFlyObj = null;
						} 
						if(!SndSteps) SndSteps = FlxG.play(SndStep3,1,true);
					}
				}
				else if (acceleration.x < 0 )
				{
					facing = LEFT;
					play("Jump");
					if (SndSteps)
					{
						SndSteps.stop();
						SndSteps = null;
					}
					if (!SndFlyObj)
						SndFlyObj = FlxG.play(SndFly, 1, true);
				}
				else if (acceleration.x > 0 )
				{
					facing = RIGHT;
					play("Jump");
					if (SndSteps)
					{
						SndSteps.stop();
						SndSteps = null;
					}
					if(!SndFlyObj)
						SndFlyObj = FlxG.play(SndFly, 1, true);
				}
				else {
					play("Jump");
					if (SndSteps) 
					{
						SndSteps.stop(); 
						SndSteps = null; 
					}
					if(!SndFlyObj)
						SndFlyObj = FlxG.play(SndFly,1,true);
						
					} ; //</code>
				
				
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
	
	}
}