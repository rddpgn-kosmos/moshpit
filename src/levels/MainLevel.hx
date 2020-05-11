package levels;

import game.Game;
import game.GameLevel;
import objects.player.Player;

class MainLevel extends GameLevel {
    override function initGameObjects() {
        var storage = Game.getGame().getGameObjectStorage();
        new Player();
    }
}