package
{
        import flash.display.Stage;
        import org.flixel.*;
        public class Registry
        {
				public static const EDITOR_MODE:Boolean = false;
				public static const VERSION:String = "1.1";
                //public static var stage:Stage;
                //public static var player:Player;
                //public static var previousLevel:int;
                public static var enemiesKilledThisLevel:int;
                public static var soulsCollectedThisGame:int;
				public static var amountOfSouls:uint;
				public static var language:String = "es"; // es, en, de, pt
                public function Registry()
                {
                }
        }
}
