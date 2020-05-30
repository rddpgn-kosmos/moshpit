import js.Browser;

class Settings {
    public function new() {}
    public static function getGameViewWidth() {
        return Browser.window.innerWidth;
    }
    public static function getGameViewHeight() {
        return Browser.window.innerHeight;
    }
}