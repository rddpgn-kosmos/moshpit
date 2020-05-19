package objects.bullet;

import utils.Vector;
import game.Animation;
import game.GameObject;
import utils.Alarm;
import animations.BulletAnimationController;

class Bullet extends GameObject {
    private var moveSpd:Float = 32 + Math.random()*16;

    public var direction:Vector = new Vector();

    public function new() {
        super(new BulletAnimationControler(this));
        new Alarm(300, instanceDestroy);
    }

    override public function update(dt:Float) {
        x += direction.x * moveSpd * dt;
        y += direction.y * moveSpd * dt;
    }
}