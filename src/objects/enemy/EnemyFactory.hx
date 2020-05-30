package objects.enemy;

import game.GameObject;
import utils.Alarm;

class EnemyFactory {
    
    private var totalEnemies:Int = 0;
    private var player:GameObject;
    private var levelWidth:Int = 1920;
    private var levelHeight:Int = 1080;
    private var maxEnemies:Int = 24;
    
    public function new(player:GameObject):Void {
        this.player = player;
        createSimpleEnemy();
    }

    public function createSimpleEnemy():Void {
        if (!player.getIsDestroyed()) {
            if (totalEnemies < maxEnemies) {
                totalEnemies++;

                var x:Float = Math.random() * levelWidth;
                var y:Float = Math.random() * levelHeight;

                while(Math.abs(player.x - x) < 300 && Math.abs(player.y - y) < 300) {
                    x = Math.random() * levelWidth;
                    y = Math.random() * levelHeight;
                }

                new Enemy(x, y, player, this);
            }
            maxEnemies += Math.round(Math.random() * 6 - 3);
            new Alarm(Math.round(Math.random() * 600), createSimpleEnemy);
        }
    }

    public function removeSimpleEnemy(enemy:Enemy):Void {
        totalEnemies--;
        enemy.instanceDestroy();
    }
}