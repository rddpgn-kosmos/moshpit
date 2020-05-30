package objects.bullet;

import utils.Vector;
import game.GameObject;
import utils.Alarm;
import animations.BulletAnimationController;
import objects.enemy.Enemy;

class AbstractBullet extends GameObject {

    private var lifeTime:Int;
    private var moveSpd:Float;

    public var direction:Vector;

    public function new(x:Float, y:Float, direction:Vector, lifeTime:Int, moveSpd:Float) {
        super(new BulletAnimationControler(this));
        this.x = x;
        this.y = y;
        this.direction = new Vector(direction.x, direction.y);
        rotation = Math.atan2( direction.y,  direction.x);
        
        this.lifeTime = lifeTime;
        this.moveSpd = moveSpd;

        new Alarm(lifeTime, instanceDestroy);        
    }

    public override function update(dt:Float) {
        x += direction.x * moveSpd * dt;
        y += direction.y * moveSpd * dt;

        var enemyCollision = collisionController.SimpleCollision(this, 'enemy');
        if (enemyCollision != null) {
            var enemy = cast(enemyCollision[0], Enemy);
            enemy.hit();
            instanceDestroy();
        } 
    }
}