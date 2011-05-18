package
{

	import org.flixel.*;

	public class MenuState extends FlxState
	{
		private var txtTitle:FlxText;
		
		private var playButton:FlxButton;
		private var devButton:FlxButton;
		
		[Embed(source = '../assets/Ctulio-Menu.jpg')] private var MenuBG:Class
		private var BgMenu:FlxSprite;
		[Embed(source = '../assets/cartridge.mp3')] private var SndCartridge:Class;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff000000;
			BgMenu = new FlxSprite(0, 0, MenuBG);
			BgMenu.y = -BgMenu.height -10;
			BgMenu.velocity.y = 400;
			BgMenu.acceleration.y = 500;
			add(BgMenu);
			
			/*
			txtTitle = new FlxText(FlxG.width / 2-50, FlxG.height / 4 , 100, "Las Aventuras de Ctulio", false);
			txtTitle.alignment = "center";
			txtTitle.scale = new FlxPoint(2, 2);
			add(txtTitle);
			*/
			
			
			playButton = new FlxButton(40, FlxG.height / 2 -25, "Jugar", onPlay, onOver);
			playButton.color = 0xff8e5195;
			playButton.label.color = 0xffffffff;
			playButton.scale = new FlxPoint(1.5, 1.5);
			playButton.visible = false;
			add(playButton);
			
			devButton = new FlxButton(40,FlxG.height / 2 + 25, "Mi web", onSite, onOver);
			devButton.color = playButton.color;
			devButton.label.color = playButton.label.color;
			devButton.scale = playButton.scale;
			devButton.visible = false;
			add(devButton);
			
			
			
			FlxG.mouse.show();
			
		}
		
		override public function update():void
		{
			super.update();	
			if (BgMenu.y >= -50 ) BgMenu.acceleration.y *= -2;
			if (BgMenu.y >= 0 && BgMenu.velocity.y != 0)
			{ 
				BgMenu.velocity.y = BgMenu.acceleration.y = BgMenu.y = 0;
				FlxG.flash(0xffffffff, 1);
				FlxG.play(SndCartridge);
				playButton.visible = devButton.visible = true;				
				}
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

