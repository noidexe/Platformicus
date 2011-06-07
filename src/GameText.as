package  
{
	/**
	 * ...
	 * @author Noid
	 */
	public class GameText 
	{
		//Order is es, en, de, pt, zh, ja
		private static var _play:Array = ["Jugar", "Play", "Spielen", "Jogar", "\u73A9", "\u30B9\u30BF\uFF0D\u30C8"];
		private static var _playAgain:Array = ["Jugar de Nuevo", "Play Again", "Wiederspielen", "Jogar novamente", "\u518D\u73A9", "\u3082\u3046\u4E00\u5EA6"];
		private static var _toMenu:Array = ["Volver al Menú", "Back to Menu", "Zurück zum Menü", "Voltar ao Menu", "\u8FD4\u56DE\u83DC\u55AE", "\u30E1\u30CB\u30E5\u30FC\u3078\u623B\u308B"];
		private static var _myWeb:Array = ["Mi Web", "My Website", "Meine Website", "O Meu Site", "\u6211\u7684\u7DB2\u7AD9", "\u30DB\u30FC\u30E0\u30DA\u30FC\u30B8"];
		private static var _youreDead:Array = ["SONASTE", "OWNED", "KAPUT", "DANÇOU", "\u6B7B", "\u6B8B\u5FF5\u3060\u306A..."];
		private static var _youWin:Array = ["PERFECTO", "PERFECT", "PERFEKT", "PERFEITO", "\u6EFF\u5206", "\u6E80\u70B9"];
		
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
				case "zh":
				return _play[4];
				break;
				case "ja":
				return _play[5];
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
				case "zh":
				return _playAgain[4];
				break;
				case "ja":
				return _playAgain[5];
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
				case "zh":
				return _toMenu[4];
				break;
				case "ja":
				return _toMenu[5];
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
				case "zh":
				return _myWeb[4];
				break;
				case "ja":
				return _myWeb[5];
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
				case "zh":
				return _youreDead[4];
				break;
				case "ja":
				return _youreDead[5];
				break;
				default:
					return _youreDead[0];
				break;
			}
			
		}
		
		public static function get youWin():String
		{
			switch (Registry.language) 
			{
				case "es":
				return _youWin[0];
				break;
				case "en":
				return _youWin[1];
				break;
				case "de":
				return _youWin[2];
				break;
				case "pt":
				return _youWin[3];
				break;
				case "zh":
				return _youWin[4];
				break;
				case "ja":
				return _youWin[5];
				break;
				default:
					return _youWin[0];
				break;
			}
			
		}
		
		public static function get useEmbeddedFonts():Boolean
		{
			switch (Registry.language)
			{
				case "zh":
				return false;
				break;
				case "ja":
				return false;
				break;
				default:
					return true;
				break;
			}
			
		}
		
		public function GameText() 
		{
			
		}
		
	}

}