package  
{
	/**
	 * ...
	 * @author Noid
	 */
	public class GameText 
	{
		//Order is es, en, de, pt
		private static var _play:Array = ["Jugar", "Play", "Spielen", "Jogar"];
		private static var _playAgain:Array = ["Jugar de Nuevo", "Play Again", "Wiederspielen", "Jogar novamente"];
		private static var _toMenu:Array = ["Volver al Menú", "Back to Menu", "Zurück zum Menü", "Voltar ao Menu"];
		private static var _myWeb:Array = ["Mi Web", "My Website", "Meine Website", "O Meu Site"];
		private static var _youreDead:Array = ["SONASTE", "OWNED", "KAPUT", "MORTO"];
		
		public static function get play():String
		{
			switch (Registry.language) 
			{
				case "es":
				return _play[0];
				break;
				case "en":
				return _play[1];
				break;
				case "de":
				return _play[2];
				break;
				case "pt":
				return _play[3];
				break;
				default:
					return _play[0];
				break;
			}
			
		}
		
		public static function get playAgain():String
		{
			switch (Registry.language) 
			{
				case "es":
				return _playAgain[0];
				break;
				case "en":
				return _playAgain[1];
				break;
				case "de":
				return _playAgain[2];
				break;
				case "pt":
				return _playAgain[3];
				break;
				default:
					return _playAgain[0];
				break;
			}
			
		}
		
		public static function get toMenu():String
		{
			switch (Registry.language) 
			{
				case "es":
				return _toMenu[0];
				break;
				case "en":
				return _toMenu[1];
				break;
				case "de":
				return _toMenu[2];
				break;
				case "pt":
				return _toMenu[3];
				break;
				default:
					return _toMenu[0];
				break;
			}
			
		}
		
		public static function get myWeb():String
		{
			switch (Registry.language) 
			{
				case "es":
				return _myWeb[0];
				break;
				case "en":
				return _myWeb[1];
				break;
				case "de":
				return _myWeb[2];
				break;
				case "pt":
				return _myWeb[3];
				break;
				default:
					return _myWeb[0];
				break;
			}
			
		}
		
		public static function get youreDead():String
		{
			switch (Registry.language) 
			{
				case "es":
				return _youreDead[0];
				break;
				case "en":
				return _youreDead[1];
				break;
				case "de":
				return _youreDead[2];
				break;
				case "pt":
				return _youreDead[3];
				break;
				default:
					return _youreDead[0];
				break;
			}
			
		}
		
		public function GameText() 
		{
			
		}
		
	}

}