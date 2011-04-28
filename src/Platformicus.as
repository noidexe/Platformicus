package  
{
	import org.flixel.*; //フリックセルを　はじまる
	[SWF(width = "400", height = "300", backgroundColor = "#000000")]
	[Frame(factoryClass="Preloader")] //Tells Flixel to use the default preloader
	
	public class Platformicus extends FlxGame
	{
		
		public function Platformicus() 
		{
			super(400, 300, PlayState, 1); //新しいＦｌｘＧａｍｅオブジェクトを
			
		}
		
	}

}