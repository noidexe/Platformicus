package
{
        import flash.display.Stage;
        import org.flixel.*;
        public class Registry
        {
                public static var stage:Stage;
                public static var player:Player;
                public static var previousLevel:int;
                public static var enemiesKilledThisLevel:int;
                public static var enemiesKilledThisGame:int;
                public static var arrowsFiredThisGame:int;
                public function Registry()
                {
                }
        }
}
