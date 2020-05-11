package objects.bullet;

import utils.Vector;
import game.Animation;
import game.GameObject;

class Bullet extends GameObject {
    private var moveSpd:Float = 24;

    public var direction:Vector = new Vector();

    private var model:BulletModel = new BulletModel();

    public function new() {
        super(model);

        animation.animationSpeed = 0.5;
        animation.playType = 'once';
    }

    override public function update(dt:Float) {
        x += direction.x * moveSpd * dt;
        y += direction.y * moveSpd * dt;
    }
}