package objects.bullet;

import utils.Vector;

class Bullet extends AbstractBullet {
    public function new(x:Float, y:Float, direction:Vector) {
        var moveSpd:Float = 48 + Math.random()*16;
        var lifeTime:Int = 300;
        super(x, y, direction, lifeTime, moveSpd);
    }
}