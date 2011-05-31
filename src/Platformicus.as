package  
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import mochi.as3.MochiServices;
	import org.flixel.*;
	[SWF(width = "400", height = "300", backgroundColor = "#000000")]
	[Frame(factoryClass="MochiPreloader")] //Tells Flixel to use the Mochi preloader
	
	public class Platformicus extends FlxGame
	{
		
		public function Platformicus() 
		{
			var game_width:uint = 800;
			var game_height:uint = 600;
			var load_state:Class = PlayState;
			if (!Registry.EDITOR_MODE)
			{
				game_width = 400;
				game_height = 300;
				load_state = LangSelection;
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
			super(game_width, game_height, load_state, 1); //新しいＦｌｘＧａｍｅオブジェクトを
			
		}
		
		private function init(e:Event):void
        {
            MochiServices.connect( "3fdef9e3a1caad3e", this.parent );
        }
	}

}