package levels;

import game.Game;
import game.GameLevel;
import game.GameObject;
import objects.player.Player;
import objects.enemy.EnemyFactory;
import objects.box.Box;

class MainLevel extends GameLevel {
    override function initGameObjects() {
        var storage = Game.getGame().getGameObjectStorage();
        var player:GameObject = new Player();
        new Box(player);
        new EnemyFactory(player);
    }
}