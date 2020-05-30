package objects.bullet;

import utils.Vector;
import game.GameObject;
import utils.Alarm;
import animations.BulletAnimationController;

class Shell extends GameObject {
    private var moveSpd:Float = 48 + Math.random()*16;
    private var lifeTime:Int = 300;

    public var direction:Vector;

    public function new(x:Float, y:Float, direction:Vector) {
        super(new BulletAnimationControler(this));
        this.x = x;
        this.y = y;
        this.direction = new Vector(direction.x, direction.y);
        rotation = Math.atan2( direction.y,  direction.x);
    }

    override public function update(dt:Float) {
        x += direction.x * moveSpd * dt;
        y += direction.y * moveSpd * dt;
        moveSpd /= 1.1;

        scale.x /= 1.05;
        scale.y /= 1.05;

        
        if (moveSpd < 4) {
            instanceDestroy();
        }
        
    }
}