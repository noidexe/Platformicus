package
{

	import flash.ui.Mouse;
	import mochi.as3.*;
	import org.flixel.*;

	public class FailState extends FlxState
	{
		private var txtTitle:FlxText;
		
		[Embed(source = '../assets/button.mp3')] private var SndButton:Class;
		
		private var playButton:FlxButton;
		private var menuButton:FlxButton;
		
		override public function create():void
		{
			FlxG.bgColor = 0xFF440044;
			
			txtTitle = new FlxText(FlxG.width / 2-50, FlxG.height / 4 , 100, (Registry.soulsCollectedThisGame == Registry.amountOfSouls ? GameText.youWin: GameText.youreDead), false);
			txtTitle.alignment = "center";
			txtTitle.scale = new FlxPoint(2, 2);
			add(txtTitle);
			
			menuButton = new FlxButton(FlxG.width / 2 - 40, FlxG.height / 3 + 60, GameText.toMenu, onBack);
			menuButton.setSounds(SndButton);
			menuButton.color = 0xFFAA00AA;
			menuButton.label.color = 0xFFFFFFFF;
			menuButton.scale = new FlxPoint(1.5, 1.5);
			menuButton.label.textfieldWidth = 100;
			add(menuButton);
			
			playButton = new FlxButton(FlxG.width / 2 - 40, FlxG.height / 3 + 100, GameText.playAgain, onPlay);
			playButton.setSounds(SndButton);
			playButton.color = menuButton.color;
			playButton.label.color = menuButton.label.color;
			playButton.scale = new FlxPoint(1.5, 1.5);
			playButton.label.textfieldWidth = 100;
			add(playButton);
			
			FlxG.mouse.show();
			Mouse.show();
			
			var o:Object = { n: [7, 13, 9, 15, 5, 9, 6, 14, 8, 2, 10, 12, 3, 5, 0, 0], f: function (i:Number,s:String):String { if (s.length == 16) return s; return this.f(i+1,s + this.n[i].toString(16));}};
			var boardID:String = o.f(0, "");
			var playerscore:Number = Registry.soulsCollectedThisGame;
			
			MochiScores.showLeaderboard({boardID: boardID, score: playerscore, res: "800x600", width: 700, height: 500, scoreMessage: { highscore: "Beat my highscore of ${highscore} in ${game}!", latestscore: "Hice ${score} puntos en ${game}!", gameinvite: "Come play ${game}!" }});
			
		}
		
		override public function update():void
		{
			Mouse.show();
			super.update();
		}
		
		protected function onBack():void
		{
			playButton.exists = false;
			FlxG.switchState(new MenuState());
		}
		
		protected function onPlay():void
		{
			playButton.exists = false;
			FlxG.switchState(new PlayState());
		}
		
	}
}

