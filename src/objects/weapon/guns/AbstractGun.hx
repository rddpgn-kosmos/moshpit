package objects.weapon.guns;

import utils.Vector;
import game.GameObject;
import haxe.Constraints.Function;
import utils.Alarm;
import objects.bullet.Bullet;

class AbstractGun {
    public var auto:Bool;

    private var fireRate:Int;
    private var range:Float;
    private var fireCallback:Function;
    private var canShoot:Bool = true;
    private var weapon:Weapon;
    private var positionOffset:Float;

    public function new(weapon:Weapon) {
        this.weapon = weapon;
        init();
    }

    private function init():Void {};

    public final function fire(direction:Vector):Void {
        if (canShoot) {
            fireCallback(direction);
            canShoot = false;
            new Alarm(fireRate, () -> canShoot = true);
        }
    }

    private function makeRangedDirection(direction:Vector):Void {
        var angle = Math.random()*range*2 - range;
        direction.addAngle(angle);
    }

    private function calcOffsetPosition(direction:Vector):Vector {
        return new Vector(weapon.x + positionOffset * direction.x, weapon.y + positionOffset*direction.y);
    }
}