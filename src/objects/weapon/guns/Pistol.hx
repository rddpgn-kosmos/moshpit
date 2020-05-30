package objects.weapon.guns;

import objects.bullet.Bullet;
import objects.weapon.guns.AbstractGun;
import utils.Vector;

class Pistol extends AbstractGun {
    override private function init() {
        fireRate = 100;
        auto = false;
        range = 5;
        positionOffset = 32;
        fireCallback = function(direction:Vector) {
            makeRangedDirection(direction);
            var position:Vector = calcOffsetPosition(direction);
            new Bullet(position.x, position.y, direction);
        }
    }
}