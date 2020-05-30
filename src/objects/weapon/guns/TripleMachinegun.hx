package objects.weapon.guns;

import objects.bullet.Bullet;
import objects.weapon.guns.AbstractGun;
import utils.Vector;

class TripleMachinegun extends AbstractGun {
    override private function init() {
        fireRate = 80;
        auto = true;
        range = 2;
        positionOffset = 64;
        fireCallback = function(direction:Vector) {
            var position:Vector = calcOffsetPosition(direction);
            makeRangedDirection(direction);
            new Bullet(position.x, position.y, direction);

            direction.addAngle(15);
            new Bullet(position.x, position.y, direction);

            direction.addAngle(-30);
            new Bullet(position.x, position.y, direction);
        }
    }
}