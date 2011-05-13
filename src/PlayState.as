package  
{
	import org.flixel.*;
	import org.flixel.plugin.TimerManager;
	
	public class PlayState extends FlxState
	{
		[Embed(source='../assets/soul2.png')] private var ImgSoul:Class;
		[Embed(source="../assets/leveltiles-16.png")] private var ImgLevel:Class;
		[Embed(source='../assets/level2.png')] private var DataLevel:Class;
		[Embed(source="../assets/leveltiles-16-bg.png")] private var ImgLevel_bg:Class;
		private const tileSize:uint = 16;
		private var level:FlxTilemap;
		private var level_bg:FlxTilemap;
		
		//[Embed(source = '../assets/bg.png')]
		//public var ImgBG:Class;
		
				
		//---BEGIN CRAPPY CODE----
		private var bg:FlxSprite;
		private var lastx:Number;  // store player
		private var lasty:Number;  // position in last frame
		
		private var player:Player;
		
		private var souls:FlxGroup;
		
		private var txt_controls:FlxText;
		private var txt_nohaynada:FlxText;
		
		private var score:uint = 0;
		private var txt_score:FlxText;
		
		private var timemanager:TimerManager;
		private var timer:FlxTimer;
		//private var time:uint =15000;  //Time to score as much as posible
		private var txt_time:FlxText;
		
		private var version:String = "v0.5.0"
		private var txt_version:FlxText;
						
		override public function create():void 
		{
			FlxG.bgColor = 0xff000000;
			FlxG.watch(FlxG.mouse, "x", "Mouse X");
			FlxG.watch(FlxG.mouse, "y", "Mouse Y");
			FlxG.mouse.hide();
			//Create level;
			//bg = new FlxSprite(0, 0, ImgBG);
			//add(bg);
			//bg.scrollFactor = new FlxPoint(0, 0);
			timemanager = new TimerManager();
			timer = new FlxTimer();
			
			
			level_bg = new FlxTilemap();
			level_bg.loadMap(FlxTilemap.imageToCSV(DataLevel, false), ImgLevel_bg, tileSize, tileSize, FlxTilemap.AUTO);
			add(level_bg);
			
			txt_nohaynada = new FlxText(760, 120, 200, "Encontraste el area secreta!.. secretamente vacia..");
			txt_nohaynada.size = 16;
			add(txt_nohaynada); //added before player cause it's part of the background
			
			//Create player (Cthulio)
			player = new Player(1290);
			add(player);
			lastx = player.x;
			lasty = player.y;
						
			level = new FlxTilemap();
			level.loadMap(FlxTilemap.imageToCSV(DataLevel, true), ImgLevel, tileSize, tileSize, FlxTilemap.AUTO);
			add(level);
			
			//Create Souls
			souls = new FlxGroup();
			souls.add(createSoul(12, 5));
			souls.add(createSoul(85, 48));
			souls.add(createSoul(87, 48));
			souls.add(createSoul(89, 48));
			add(souls);
			
			timemanager.active = true;
			timemanager.add(timer);
			timer.start(15, 1, onTimeUp);
			txt_controls = new FlxText(550 / 2, 6 / 2, 400 / 2, "< > : move [space] : jump");
			txt_score = new FlxText(2/2, 2/2, 400/2, "Score: " + score);
			txt_time = new FlxText(2 / 2, 20 / 2, 400 / 2, "Time: " + timer.timeLeft);
			txt_version = new FlxText (640 / 2, 570 / 2, 400 / 2, "Version: " + version);
			
						
			add(txt_controls);
			add(txt_score);
			add(txt_time);
			add(txt_version);
			add(timemanager);
			
			
			
			txt_score.scrollFactor = new FlxPoint(0, 0);
			//txt_score.size = 16;
			txt_time.scrollFactor = new FlxPoint(0, 0);
			//txt_time.size = 16;
			txt_controls.scrollFactor = new FlxPoint(0, 0);
			//txt_controls.size = 16;
			txt_version.scrollFactor = new FlxPoint(0, 0);
			
			// Set camera
			FlxG.camera.follow(player, 1);
			FlxG.camera.setBounds(level.x, level.y, level.width, level.height); //so the camera doesn't scroll outside the map
			FlxG.worldBounds = new FlxRect(level.x, level.y, level.width, level.height); //so the collision works in all the map
		}
		
		private function createSoul(soulx:uint, souly:uint):FlxSprite
		{
			//return new FlxSprite(soulx * tileSize, souly * tileSize).loadGraphic(ImgSoul);
			return new Soul(soulx * tileSize, souly * tileSize);
			
		}
		override public function update():void
		{
			
			if (timer.loopsLeft == 1) //No actualices el timer si llego a 0 (por alguna razon se resetea igual aunque le puse 1 loop.
			{
				if (timer.timeLeft <= 6 ) txt_time.color = 0xff0000;
				else txt_time.color = 0xffffff;
				txt_time.text = "Time: " + int(timer.timeLeft);
			}
			
			FlxG.overlap(souls, player, getSoul);
			
			FlxG.collide(player, level);
			super.update();
			
		}
		
		private function getSoul(Soul:FlxSprite, Player:FlxSprite):void 
		{
			Soul.kill();
			timer.time += 5;
			score = souls.countDead() * 100;
			txt_score.text = "Score: " + score;
			FlxG.log("SCORE: " + (souls.countDead() * 100));
		}
		
		private function onTimeUp(Timer:FlxTimer):void
		{
			FlxG.fade(0xffffff, 0.5, onFadeFinished);
		}
		
		private function onFadeFinished():void
		{
			FlxG.switchState(new FailState());
		}
		
	}

}