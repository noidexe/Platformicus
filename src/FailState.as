package
{

	import org.flixel.*;

	public class FailState extends FlxState
	{
		private var txtTitle:FlxText;
		
		private var playButton:FlxButton;
		private var menuButton:FlxButton;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff440044;
			
			txtTitle = new FlxText(FlxG.width / 2-50, FlxG.height / 4 , 100, "SONASTE", false);
			txtTitle.alignment = "center";
			txtTitle.scale = new FlxPoint(2, 2);
			add(txtTitle);
			
			menuButton = new FlxButton(FlxG.width/2-40,FlxG.height / 3 + 60, "Volver al Menu", onBack, onOver);
			menuButton.color = 0xffaa00aa;
			menuButton.label.color = 0xffffffff;
			menuButton.scale = new FlxPoint(1.2, 1.2);
			add(menuButton);
			
			playButton = new FlxButton(FlxG.width/2-40,FlxG.height / 3 + 100, "Jugar de Nuevo", onPlay, onOver);
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
		
		protected function onOver():void
		{
			//replace with button mouseOver soundeffect
		}
		
	}
}

