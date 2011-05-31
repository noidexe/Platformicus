package  
{

	import org.flixel.*;
	
	public class Soul extends FlxSprite
	{
		//Graphics
		[Embed(source = '../assets/soul2.png')] private var ImgSoul:Class;
		
		//Sounds
		[Embed(source = '../assets/picksoul.mp3')] private var SndPickSoul:Class;
		public var initialY:Number; //Used by the Level Editor
		
		public function Soul(X:Number = 0, Y:Number = 0)
		{
			super (X, Y);
			
			initialY = Y;
			//Physics setup
			if(!Registry.EDITOR_MODE) velocity.y += int(FlxG.random() * 10 + 10);
			//acceleration.y = 10;
			
			//Graphics setup
			loadGraphic(ImgSoul, true, false, 15, 15);
			addAnimation("Idle", [0, 1, 2, 3, 4, 5, 6], 15, true);
			playFromFrame("Idle", false, int(FlxG.random() * 10 % 7));
			
			//SndPickSoulObj = new FlxSound().loadEmbedded(SndPickSoul,false,true);
			
		}
		
		override public function update():void
		{
			if (!Registry.EDITOR_MODE) 
			{
				if (y < initialY) velocity.y++;
				if (y > initialY) velocity.y--;
			}
		}
		
		override public function kill():void
		{
			FlxG.play(SndPickSoul); //SndPickSoulObj.play();
			super.kill();
		}
		
		/**
		* Plays an existing animation (e.g. "run") and select a starting frame if desired.
		* If you call an animation that is already playing it will be ignored.
		* If the requested starting frame is greater than the available frames, it will revert to frame 0.
		* http://flixel.org/forums/index.php?topic=1902.0
		* 
		* @param	AnimName	The string name of the animation you want to play.
		* @param	Force		Whether to force the animation to restart.
		* @param	StartFrame	Which frame of the animation to start from if possible.
		*/
		public function playFromFrame(AnimName:String,Force:Boolean=false, StartFrame:int=0):void
		{
			if (!Force && (_curAnim != null) && (AnimName == _curAnim.name)) return;
			//if ( StartFrame <= _animations.length)  //For some reason _animations.lenght is never => StartFrame
			{
				_curFrame = StartFrame;
			}
			/*else
			{
				_curFrame = 0;
			}*/
			_curIndex = 0;
			_frameTimer = 0;
			var al:uint = _animations.length;
			for(var i:uint = 0; i < al; i++)
			{
				if(_animations[i].name == AnimName)
				{
					_curAnim = _animations[i];
					if(_curAnim.delay <= 0)
						finished = true;
					else
						finished = false;
					_curIndex = _curAnim.frames[_curFrame];
					dirty = true;
					return;
				}
			}
			FlxG.log("WARNING: No animation called \""+AnimName+"\"");
		}
		
	}

}