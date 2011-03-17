package  
{
	import org.flixel.*; //フリックセルを　はじまる
	[SWF(width = "640", height = "480", backgroundColor = "#000000")]
	[Frame(factoryClass="Preloader")] //Tells Flixel to use the default preloader
	
	public class Platformicus extends FlxGame
	{
		
		public function Platformicus() 
		{
			super(640, 480, PlayState, 1); //新しいＦｌｘＧａｍｅオブジェクトを
			
		}
		
	}

}