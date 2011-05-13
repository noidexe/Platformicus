package
{

	import org.flixel.*;

	public class MenuState extends FlxState
	{
		private var txtTitle:FlxText;
		
		private var playButton:FlxButton;
		private var devButton:FlxButton;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff440044;
			
			txtTitle = new FlxText(FlxG.width / 2-50, FlxG.height / 4 , 100, "Las Aventuras de Ctulio", false);
			txtTitle.alignment = "center";
			txtTitle.scale = new FlxPoint(2, 2);
			add(txtTitle);
			
			devButton = new FlxButton(FlxG.width-80,FlxG.height-20, "Mi web", onSite, onOver);
			devButton.color = 0xffaa00aa;
			devButton.label.color = 0xffffffff;
			add(devButton);
			
			playButton = new FlxButton(FlxG.width / 2 - 40, FlxG.height / 3 + 100, "Jugar", onPlay, onOver);
			playButton.color = devButton.color;
			playButton.label.color = devButton.label.color;
			playButton.scale = new FlxPoint(2, 2);
			add(playButton);
			
			
			FlxG.mouse.show();
			
		}
		
		override public function update():void
		{
			super.update();	
		}
		
		protected function onSite():void
		{
			
			FlxU.openURL("http://lisandrolorea.com.ar/");  //replace with your site's URL 
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

