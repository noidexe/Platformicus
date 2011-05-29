package  
{
	import flash.events.Event;
	import mochi.as3.MochiServices;
	import org.flixel.*;
	[SWF(width = "400", height = "300", backgroundColor = "#000000")]
	[Frame(factoryClass="MochiPreloader")] //Tells Flixel to use the default preloader
	
	public class Platformicus extends FlxGame
	{
		
		public function Platformicus() 
		{
			super(400, 300, MenuState, 1); //新しいＦｌｘＧａｍｅオブジェクトを
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void
        {
            MochiServices.connect( "3fdef9e3a1caad3e", this.parent );
        }
	}

}