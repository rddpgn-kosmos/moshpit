package objects.enemy;

import game.GameObject;
import utils.Alarm;

class EnemyFactory {
    
    private var totalEnemies:Int = 0;
    private var player:GameObject;
    
    public function new(player:GameObject):Void {
        this.player = player;
        createSimpleEnemy();
    }

    public function createSimpleEnemy():Void {
        if (totalEnemies < 20) {
            totalEnemies++;
            new Enemy(50, 50, player);
            new Alarm(Math.round(Math.random() * 1000), createSimpleEnemy);
        }
    }
}