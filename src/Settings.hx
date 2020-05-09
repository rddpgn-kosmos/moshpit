import js.Browser;

class Settings {
    static var COLOR_BLACK:Int = 0x000000;
    public function new() {}
    public static function getGameViewWidth() {
        return Browser.window.innerWidth;
    }
    public static function getGameViewHeight() {
        return Browser.window.innerHeight;
    }
    public static function getBackgroundColor() {
        return COLOR_BLACK;
    }
}