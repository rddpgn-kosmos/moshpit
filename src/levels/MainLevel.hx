package levels;

import game.Game;
import game.GameLevel;
import objects.Bunny;

class MainLevel extends GameLevel {
    override function initGameObjects() {
        var storage = Game.getGame().getGameObjectStorage();
        storage.createGameObject(Bunny);
    }
}