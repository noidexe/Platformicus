package
{

	import flash.ui.Mouse;
	import org.flixel.*;

	/**
	 * Menu Screen. Options: Play, Go to My Website
	 * 
	 * @author Noid.EXE
	 */
	public class MenuState extends FlxState
	{
		
		private var playButton:FlxButton;
		private var devButton:FlxButton;
		
		[Embed(source = '../assets/button.mp3')] private var SndButton:Class;
		
		[Embed(source = '../assets/Cthulio-Menu.jpg')] private var MenuBG:Class
		private var BgMenu:FlxSprite;
		[Embed(source = '../assets/cartridge.mp3')] private var SndCartridge:Class;
		
		override public function create():void
		{
			FlxG.bgColor = 0xFF000000;
			BgMenu = new FlxSprite(0, 0, MenuBG);
			BgMenu.y = -BgMenu.height -10;
			BgMenu.velocity.y = 400;
			BgMenu.acceleration.y = 500;
			add(BgMenu);
			
			playButton = new FlxButton(40, FlxG.height / 2 -25, GameText.play , onPlay, GameText.useEmbeddedFonts);
			playButton.setSounds(SndButton);
			playButton.color = 0xFF8E5195;
			playButton.label.color = 0xFFFFFFFF;
			playButton.scale = new FlxPoint(1.5, 1.5);
			if (!GameText.useEmbeddedFonts) playButton.labelOffset = new FlxPoint( -1, 0);
			playButton.label.textfieldWidth = 200;
			playButton.visible = false;
			add(playButton);
			
			devButton = new FlxButton(40, FlxG.height / 2 + 25, GameText.myWeb , onSite, GameText.useEmbeddedFonts);
			devButton.setSounds(SndButton);
			devButton.color = playButton.color;
			devButton.label.color = playButton.label.color;
			devButton.scale = playButton.scale;
			if (!GameText.useEmbeddedFonts) devButton.labelOffset = new FlxPoint( -1, 0);
			devButton.label.textfieldWidth = 200;
			devButton.visible = false;
			add(devButton);
			
			
			FlxG.mouse.hide();
			Mouse.hide();
			
		}
		
		override public function update():void
		{
			super.update();	
			if (BgMenu.y >= -50 ) BgMenu.acceleration.y *= -2;
			if (BgMenu.y >= 0 && BgMenu.velocity.y != 0)
			{ 
				BgMenu.velocity.y = BgMenu.acceleration.y = BgMenu.y = 0;
				FlxG.flash(0xFFFFFFFF, 1, FlxG.mouse.show );
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
		
	}
}

