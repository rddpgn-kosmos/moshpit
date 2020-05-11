package objects.weapon;

import utils.Vector;

class WeaponView {
    
    private var weapon:Weapon;
    private var anchorDelta:Float = 0.0;
    private var NORMAL_ANCHOR_X:Float = -0.5;
    private var NORMAL_ANCHOR_Y:Float = 0.5;

    public function new(weapon:Weapon) {
        this.weapon = weapon;
        weapon.anchor.set(NORMAL_ANCHOR_X, NORMAL_ANCHOR_Y);
    }

    public function update() {
        var mouse = weapon.input.getMousePosition();
        var direction = new Vector(weapon.x, weapon.y);

        var dir = Vector.calcDifference(direction, mouse);
        dir = Vector.normalize(dir);

        weapon.rotation = Math.atan2(dir.y, dir.x);

        if (weapon.x > weapon.input.getMousePosition().x) {
            weapon.scale.y = -1;
        } else {
            weapon.scale.y = 1;
        }

        if (anchorDelta != 0) {
            anchorDelta /= 1.25;
            weapon.anchor.set(NORMAL_ANCHOR_X + anchorDelta, NORMAL_ANCHOR_Y);
        }

    }

    public function shoot() {
        anchorDelta = 0.5;
    }
}