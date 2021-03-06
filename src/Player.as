package  
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		//Graphics
		[Embed(source='../assets/ctulio-16.png')] private var ImgPlayer:Class;
		
		//Sound
		[Embed(source = '../assets/fly-hipitch.mp3')] private var SndGlide:Class;
		private var SndGlideObj:FlxSound;
		
		[Embed(source = '../assets/flyfast-hipitch.mp3')] private var SndFly:Class;
		private var SndFlyObj:FlxSound;
		
		[Embed(source = '../assets/steps-sin.mp3')] private var SndSteps: Class;
		private var SndStepsObj:FlxSound;
		
		//Physics
		private var numjumps:Number = 0;
		private var jumping:Boolean = false;
		private var haspaused:Boolean = false;
		
		
		public function Player(X:Number = 0, Y:Number = 0)
		{
			super(X, Y);
			
			//Graphic setup
			loadGraphic(ImgPlayer, true, true, 60, 40);
			width = 20;
			height = 30;
			offset.x = 20;
			offset.y = 10;
			
			//Animation setup
			addAnimation("Idle", [0,1,2,1], 3, true);
			addAnimation("Walk", [3, 4,5,6,7,8,9,10,11,12,13,14], 14);
			addAnimation("Jump", [15, 16, 17, 18, 19, 20], 24);
			addAnimation("Glide", [15, 16, 17, 18, 19, 20], 12);
			
			
			
			//Physics setup
			maxVelocity.x = 240;
			maxVelocity.y = 400;
			acceleration.y = 400;
			drag.x = maxVelocity.x * 2;
			jumping = true;
			
			//Misc setup
			flicker(2); //flickers for two seconds when the level starts
			SndGlideObj = FlxG.loadSound(SndGlide);
			SndStepsObj = FlxG.loadSound(SndSteps);
			SndFlyObj = FlxG.loadSound(SndFly);
			
			//Debbuger setup
			//FlxG.watch(this, "x");
			//FlxG.watch(this, "y");
			FlxG.watch(SndStepsObj, "active");
			FlxG.watch(SndStepsObj, "exists");
		}
		
		/**
		 * Checks for keypresses and sets character movement.
		 */
		private function updateLogic():void
		{
			acceleration.x = 0;
			if (!FlxG.keys.SPACE)
				jumping = false;
			if (isTouching(FLOOR))
					numjumps = 0;  //Resets jump count. Used for double-jumping
			if (FlxG.keys.LEFT || FlxG.keys.A)
				acceleration.x = -maxVelocity.x * 4;
			if (FlxG.keys.RIGHT || FlxG.keys.D)
				acceleration.x = maxVelocity.x * 4;
			if (FlxG.keys.SPACE && (isTouching(FLOOR) || numjumps < 2) && !jumping )  //Checks if its on the floor or if it isn't double-jumping
				{
					velocity.y = -maxVelocity.y /1.5 ;
					numjumps++;
					jumping = true;
				}
		}
		
				
		/**
		 * Plays the appropiate animation and sound.
		 */
		private function updateAnims():void
		{
			//Set Facing
			if (acceleration.x < 0) facing = LEFT;
			else if (acceleration.x > 0) facing = RIGHT;
			// if acceleration.x == 0 DO NOTHING, SO ITS DOESN'T CHANGE FACING WHEN IT STOPS MOVING
			
			//Set Animation
			if (isTouching(FLOOR)) //If is touching the floor..
			{
				if (justTouched(FLOOR)) SndStepsObj.play(); //play walk sound once if just touched the floor
				if (velocity.x == 0) // ..and not moving
				{ 
					play("Idle");  //Play idle animation and stop sounds
				}
				else // But if it IS moving
				{
					play("Walk"); //Play walk animation, stop fly sound and play walk sound
   					SndStepsObj.play(); 
				}
			}
			else // but if its NOT touching the floor
			{
				if (velocity.y <= -20 )
				{
					play("Jump"); // Play fly animation, fly sound and stop walk sound
					SndGlideObj.stop();	
					SndFlyObj.play();	
				}
				else
				{
					play("Glide"); // Play fly animation, fly sound and stop walk sound
					SndFlyObj.stop();
					SndGlideObj.play();	
				}
			}
		}
		
		override public function update():void
		{
			updateLogic();
			updateAnims();
		}
		
		/*
		override public function destroy():void
		{
			super.destroy();
		}
		*/
	
	}
}