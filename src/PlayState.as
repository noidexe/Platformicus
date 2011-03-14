package  
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source="../assets/leveltiles.png")]
        private var ImgLevel:Class;
		[Embed(source='../assets/level2.png')]
		private var DataLevel:Class;
		[Embed(source="../assets/leveltiles2.png")]
        private var ImgLevel_bg:Class;
		[Embed(source='../assets/level2-bg.png')]
		private var DataLevel_bg:Class;
		public var level:FlxTilemap;
		public var level_bg:FlxTilemap;
		
		[Embed(source = '../assets/bg.png')]
		public var ImgBG:Class;
		
				
		//---BEGIN CRAPPY CODE----
		public var bg:FlxSprite;
		public var lastx:Number;  // store player
		public var lasty:Number;  // position in last frame
		
		public var player:Player;
		
		public var txt_controls:FlxText;
		public var txt_nohaynada:FlxText;
		
		public var score:uint = 0;
		public var txt_score:FlxText;
		
		public var time:uint =15000;  //Time to score as much as posible
		public var txt_time:FlxText;
						
		override public function create():void 
		{
			bgColor = 0xff000000;
			
			//Create level;
			//bg = new FlxSprite(0, 0, ImgBG);
			//add(bg);
			//bg.scrollFactor = new FlxPoint(0, 0);
			
			
			level_bg = new FlxTilemap();
			level_bg.auto = FlxTilemap.AUTO;
			level_bg.loadMap(FlxTilemap.pngToCSV(DataLevel, false), ImgLevel_bg, 8, 8);
			add(level_bg);
			
			level = new FlxTilemap();
			level.auto = FlxTilemap.AUTO;
			level.loadMap(FlxTilemap.pngToCSV(DataLevel, true), ImgLevel, 8, 8);
			add(level);
			
			txt_nohaynada = new FlxText(380, 60, 100, "Encontraste el area secreta!.. secretamente vacia..");
			add(txt_nohaynada); //added before player cause it's part of the background
			
			//Create player (Cthulio)
			player = new Player(648);
			add(player);
			lastx = player.x;
			lasty = player.y;
			
			txt_controls = new FlxText(195, 3, 200, "< > : move [space] : jump");
			txt_score = new FlxText(1, 1, 200, "Score: " + score);
			txt_time = new FlxText(1, 10, 200, "Time: " + time / 10);
						
			add(txt_controls);
			add(txt_score);
			add(txt_time);
			
			txt_score.scrollFactor = new FlxPoint(0, 0);
			txt_time.scrollFactor = new FlxPoint(0, 0);
			txt_controls.scrollFactor = new FlxPoint(0, 0);
			
			FlxG.follow(player, 5);
			FlxG.followBounds(level.left, level.top, level.width, level.height); //so the camera doesn't scroll outside the map
			FlxU.setWorldBounds(level.left, level.top, level.width, level.height); //so the collision works in all the map
		}
		override public function update():void
		{
			super.update();
			if (time > 0)   //if time isn't up
			{	
				score += FlxU.abs(int(player.x) - int(lastx)) + FlxU.abs(int(player.y) - int(lasty)); //score is the sum of deltaX and deltaY, the difference between current position and last frame's position
				lastx = player.x;  // set lastx and lasty to current x and y
				lasty = player.y;
				time--; //decrease time left
				txt_time.text = "Time: " + time / 100;
				txt_score.text = "Score: " + score;
			}
			else txt_score.color = 0xff0000; //if time is up just paint the score red.
			
			FlxU.collide(player, level);
			
			
		}
		
	}

}