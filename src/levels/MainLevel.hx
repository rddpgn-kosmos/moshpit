package levels;

import game.Game;
import game.GameLevel;
import objects.player.Player;
import objects.box.BoxController;

class MainLevel extends GameLevel {
    override function initGameObjects() {
        var storage = Game.getGame().getGameObjectStorage();
        new Player();
        new BoxController();
    }
}