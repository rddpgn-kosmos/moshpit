package objects.bullet;

import utils.Vector;

class Shell extends AbstractBullet {
    public function new(x:Float, y:Float, direction:Vector) {
        var moveSpd:Float = 48 + Math.random()*16;
        var lifeTime:Int = 300;
        super(x, y, direction, lifeTime, moveSpd);
    }

    override public function update(dt:Float) {
        super.update(dt);
        
        if (!destroyed) {
            moveSpd /= 1.05;

            scale.x /= 1.05;
            scale.y /= 1.05;
            
            if (moveSpd < 4) {
                instanceDestroy();
            }
        }
    }
}