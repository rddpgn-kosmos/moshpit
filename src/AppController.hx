import pixi.plugins.app.Application;
import Settings;
import game.Game;

class AppController extends Application {
    public function new() {
        super();
        applySettings();
        super.start();
    
        var game:Game = new Game(this);
        onUpdate = game.update;
    }

    function applySettings() {
        position =        Application.POSITION_FIXED;
        width =           Settings.getGameViewWidth();
        height =          Settings.getGameViewHeight();
        backgroundColor = Settings.getBackgroundColor();
        transparent = false;
        antialias = false;
        
    }
}