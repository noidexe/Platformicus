package  
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source="../assets/leveltiles.png")]
        private var ImgLevel:Class;
		[Embed(source='../assets/level.png')]
		private var DataLevel:Class;
		public var level:FlxTilemap;
		public var player:Player;
		public var textito:FlxText;
		
		override public function create():void 
		{
			bgColor = 0xff000000;
						
			level = new FlxTilemap();
			level.auto = FlxTilemap.AUTO;
			level.loadMap(FlxTilemap.pngToCSV(DataLevel,true), ImgLevel, 8,8);
			add(level);
			
			//Create player (a red box)
			player = new Player(level.width / 2 - 5);
			textito = new FlxText(195, 3, 200, "< > : move [space] : jump");
			add(player);
			add(textito);
			textito.scrollFactor = new FlxPoint(0, 0);
			FlxG.follow(player, 5);
			FlxG.followBounds(level.left, level.top, level.width, level.height);
			FlxU.setWorldBounds(level.left, level.top, level.width, level.height);
		}
		override public function update():void
		{
			super.update();
			FlxU.collide(player, level);
			
			
		}
		
	}

}