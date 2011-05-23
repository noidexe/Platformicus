package
{

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
			
			txtTitle = new FlxText(FlxG.width / 2-50, FlxG.height / 4 , 100, "SONASTE", false);
			txtTitle.alignment = "center";
			txtTitle.scale = new FlxPoint(2, 2);
			add(txtTitle);
			
			menuButton = new FlxButton(FlxG.width / 2 - 40, FlxG.height / 3 + 60, "Volver al Menu", onBack);
			menuButton.setSounds(SndButton);
			menuButton.color = 0xFFAA00AA;
			menuButton.label.color = 0xFFFFFFFF;
			menuButton.scale = new FlxPoint(1.2, 1.2);
			add(menuButton);
			
			playButton = new FlxButton(FlxG.width / 2 - 40, FlxG.height / 3 + 100, "Jugar de Nuevo", onPlay);
			playButton.setSounds(SndButton);
			playButton.color = menuButton.color;
			playButton.label.color = menuButton.label.color;
			playButton.scale = new FlxPoint(1.5, 1.5);
			playButton.label.textfieldWidth = 100;
			add(playButton);
			
			
			FlxG.mouse.show();
			
		}
		
		override public function update():void
		{
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

