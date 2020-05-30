package objects.weapon.guns;

import objects.bullet.Bullet;
import objects.weapon.guns.AbstractGun;
import utils.Vector;

class Pp extends AbstractGun {
    override private function init() {
        fireRate = 20;
        auto = true;
        range = 10;
        positionOffset = 32;
        fireCallback = function(direction:Vector) {
            makeRangedDirection(direction);
            var position:Vector = calcOffsetPosition(direction);
            new Bullet(position.x, position.y, direction);
        }
    }
}