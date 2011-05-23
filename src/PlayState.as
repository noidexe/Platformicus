package  
{
	import org.flixel.*;
	import org.flixel.plugin.TimerManager;
	
	public class PlayState extends FlxState
	{
		//Graphics		
		[Embed(source='../assets/soul2.png')] private var ImgSoul:Class;
		[Embed(source="../assets/leveltiles-16.png")] private var ImgLevel:Class;
		[Embed(source = "../assets/leveltiles-16-bg.png")] private var ImgLevel_bg:Class;
		
		//Level data
		private static const TILESIZE:uint = 16;
		[Embed(source='../assets/level3.png')] private var DataLevel:Class;
		private var level:FlxTilemap;
		private var level_bg:FlxTilemap;
		
		//Player
		private var player:Player;
		
		//Souls
		private var souls:FlxGroup;
		
		//Text
		private var txt_controls:FlxText;
		private var txt_nohaynada:FlxText;
		
		private static const VERSION:String = "v0.7.5"
		private var txt_version:FlxText;
		
		private var score:uint = 0;
		private var txt_score:FlxText;
		
		//Timer
		private var timer:FlxTimer;
		private var timeLimit:uint =15;
		private var txt_time:FlxText;
		
		
		
		override public function create():void 
		{
			FlxG.mouse.hide();
			
			//Debbuger setup
			FlxG.watch(FlxG.mouse, "x", "Mouse X");
			FlxG.watch(FlxG.mouse, "y", "Mouse Y");
			
			
			createLevel();
			createPlayer();
			createSouls();
			createTimer();	
			createGUI();
			createCamera();
		}
		
		/**
		 * Initializes camera so it follows player and collides with map edges
		 */
		private function createCamera():void 
		{
			FlxG.camera.follow(player, 1);
			FlxG.camera.setBounds(level.x, level.y, level.width, level.height); //so the camera doesn't scroll outside the map
			FlxG.worldBounds = new FlxRect(level.x, level.y, level.width, level.height); //so the collision works in all the map
		}
		
		
		/**
		 * Creates GUI elements score, time, etc
		 */
		private function createGUI():void 
		{
			txt_controls = new FlxText(550 / 2, 6 / 2, 400 / 2, "< > : move [space] : jump");
			txt_score = new FlxText(2/2, 2/2, 400/2, "Score: " + score);
			txt_time = new FlxText(2 / 2, 40 / 2, 400 / 2, "Time: " + timer.timeLeft);
			txt_version = new FlxText (640 / 2, 570 / 2, 400 / 2, "Version: " + VERSION);
			add(txt_controls);
			add(txt_score);
			add(txt_time);
			add(txt_version);
			txt_score.scrollFactor = new FlxPoint(0, 0);
			txt_score.size = 16;
			txt_time.scrollFactor = new FlxPoint(0, 0);
			txt_time.size = 16;
			txt_controls.scrollFactor = new FlxPoint(0, 0);
			txt_version.scrollFactor = new FlxPoint(0, 0);
		}
		
		
		/**
		 * Creates the level
		 */
		private function createLevel():void 
		{
			FlxG.bgColor = 0xFF000000;
			
			level_bg = new FlxTilemap();
			level_bg.loadMap(FlxTilemap.imageToCSV(DataLevel, true), ImgLevel_bg, TILESIZE, TILESIZE, FlxTilemap.AUTO);
			add(level_bg);
			
			txt_nohaynada = new FlxText(760, 120, 200, "Encontraste el area secreta!.. secretamente vacia..");
			txt_nohaynada.size = 16;
			add(txt_nohaynada); //added before player cause it's part of the background
			
			level = new FlxTilemap();
			level.loadMap(FlxTilemap.imageToCSV(DataLevel, false), ImgLevel, TILESIZE, TILESIZE, FlxTilemap.AUTO);
			add(level);
		}
		
		
		/**
		 * Creates the timer or remaining health
		 */
		private function createTimer():void 
		{
			timer = new FlxTimer().start(timeLimit, 1, onTimeUp);
		}
		
		
		/**
		 * Initialices the colectable souls
		 */
		private function createSouls():void 
		{
			souls = new FlxGroup();
			souls.add(createSoul(12, 5));
			souls.add(createSoul(85, 48));
			souls.add(createSoul(87, 48));
			souls.add(createSoul(89, 48));
			souls.add(createSoul(95, 48));
			souls.add(createSoul(89, 53));
			souls.add(createSoul(89, 55));
			souls.add(createSoul(94, 50));
			souls.add(createSoul(87, 51));
			souls.add(createSoul(86, 57));
			souls.add(createSoul(110, 153));
			souls.add(createSoul(1035 / 16, 1173 / 16));
			souls.add(createSoul(1083 / 16, 1268 / 16));
			souls.add(createSoul(1183 / 16, 1343 / 16));
			add(souls);
		}
		
		/**
		 * Creates an individual soul
		 * @param	soulx	Position in x
		 * @param	souly	Position in Y
		 * @return	Returns a new soul with x = <code>soulx * tilesize</code> and y = <code>souly *tilesize</code>
		 */
		private function createSoul(soulx:uint, souly:uint):FlxSprite
		{
			return new Soul(soulx * TILESIZE, souly * TILESIZE);
			
		}
		
		/**
		 * Initialices the player
		 */
		private function createPlayer():void 
		{
			player = new Player(98 * TILESIZE, 149 * TILESIZE);
			add(player);
		}
		
		
		override public function update():void
		{
			
			if (timer.loopsLeft == 1) //Do not update timer if it reached 0(it resets for some reason, even with loops = 1
			{
				if (timer.timeLeft <= 6 ) txt_time.color = 0xFF0000; //Tint the timer red if there are less than 6 seconds remaining
				else txt_time.color = 0xFFFFFF;
				txt_time.text = "Time: " + int(timer.timeLeft); 
			}
			
			//Check collisions
			FlxG.overlap(souls, player, getSoul);
			FlxG.collide(player, level);
			
			super.update();
			
		}
		
		/**
		 * Removes collected <code>Soul</code> from the group, updates <code>score</code> and <code>timer</code>
		 * @param	Soul	Collected soul
		 * @param	Player	The player
		 */
		private function getSoul(Soul:FlxSprite, Player:FlxSprite):void 
		{
			Soul.kill();
			timer.time += 5;
			score = souls.countDead() * 100;
			txt_score.text = "Score: " + score;
			FlxG.log("SCORE: " + (souls.countDead() * 100));
		}
		
		/**
		 * Called when timer/health reaches 0. Calls FailState
		 * @param	Timer	The timer/health
		 */
		private function onTimeUp(Timer:FlxTimer):void
		{
			FlxG.fade(0xFFFFFF, 0.5, onFadeFinished);
		}
		
		/**
		 * Switches state after fade
		 */
		private function onFadeFinished():void
		{
			FlxG.switchState(new FailState());
		}
		
	}

}