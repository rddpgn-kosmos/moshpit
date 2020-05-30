package levels;

import game.Game;
import game.GameLevel;
import game.GameObject;
import objects.player.Player;
import objects.box.BoxController;
import objects.enemy.EnemyFactory;

class MainLevel extends GameLevel {
    override function initGameObjects() {
        var storage = Game.getGame().getGameObjectStorage();
        var player:GameObject = new Player();
        new BoxController();
        new EnemyFactory(player);
    }
}