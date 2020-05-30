package objects.bullet;

import utils.Vector;
import game.GameObject;
import utils.Alarm;
import animations.BulletAnimationController;

class Bullet extends GameObject {
    private var moveSpd:Float = 32 + Math.random()*16;
    private var lifeTime:Int = 300;

    public var direction:Vector;

    public function new(x:Float, y:Float, direction:Vector) {
        super(new BulletAnimationControler(this));
        this.x = x;
        this.y = y;
        this.direction = new Vector(direction.x, direction.y);
        rotation = Math.atan2( direction.y,  direction.x);

        new Alarm(lifeTime, instanceDestroy);
    }

    override public function update(dt:Float) {
        x += direction.x * moveSpd * dt;
        y += direction.y * moveSpd * dt;
    }
}