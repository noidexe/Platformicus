package
{

	import flash.ui.Mouse;
	import org.flixel.*;

	public class LangSelection extends FlxState
	{
		private var pickES:FlxButton;
		private var pickEN:FlxButton;
		private var pickDE:FlxButton;
		private var pickPT:FlxButton;
				
		[Embed(source = '../assets/flag-de.png')] private var flagDe:Class;
		[Embed(source = '../assets/flag-en.png')] private var flagEn:Class;
		[Embed(source = '../assets/flag-es.png')] private var flagEs:Class;
		[Embed(source = '../assets/flag-pt.png')] private var flagPt:Class;
		
		[Embed(source = '../assets/button.mp3')] private var SndButton:Class;
		
		override public function create():void
		{
			FlxG.bgColor = 0xFFaaaaaa;
						
			pickES = new FlxButton(FlxG.width /2 -80 , FlxG.height/2 +60, null , onPickES) ;
			pickES.setSounds(SndButton);
			pickES.loadGraphic(flagEs);
			add(pickES);
			
			pickEN = new FlxButton(FlxG.width /2 -80 , FlxG.height/2 -70, null , onPickEN) ;
			pickEN.setSounds(SndButton);
			pickEN.loadGraphic(flagEn);
			add(pickEN);
			
			pickDE = new FlxButton(FlxG.width /2 +40 , FlxG.height/2 +60, null , onPickDE) ;
			pickDE.setSounds(SndButton);
			pickDE.loadGraphic(flagDe);
			add(pickDE);
			
			pickPT = new FlxButton(FlxG.width /2 +40 , FlxG.height/2 -70, null , onPickPT) ;
			pickPT.setSounds(SndButton);
			pickPT.loadGraphic(flagPt);
			add(pickPT);
			
			FlxG.mouse.show();
			Mouse.hide();
			
		}
		
		protected function onPickES():void
		{
			Registry.language = "es";
			pickES.exists = false;
			FlxG.switchState(new MenuState());
		}
		
		protected function onPickEN():void
		{
			Registry.language = "en";
			pickEN.exists = false;
			FlxG.switchState(new MenuState());
		}
		
		protected function onPickDE():void
		{
			Registry.language = "de";
			pickDE.exists = false;
			FlxG.switchState(new MenuState());
		}
		
		protected function onPickPT():void
		{
			Registry.language = "pt";
			pickPT.exists = false;
			FlxG.switchState(new MenuState());
		}
		
		
	}
}
