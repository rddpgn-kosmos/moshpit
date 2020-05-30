package objects.weapon.guns;

import objects.bullet.Shell;
import objects.weapon.guns.AbstractGun;
import utils.Vector;

class Shotgun extends AbstractGun {
    override private function init() {
        fireRate = 200;
        auto = false;
        range = 10;
        positionOffset = 32;
        fireCallback = function(direction:Vector) {
            for(i in 0...8) {
                makeRangedDirection(direction);
                var position:Vector = calcOffsetPosition(direction);
                new Shell(position.x, position.y, direction);
            }
        }
    }
}