package objects.weapon;

import game.GameObject;
import utils.Vector;
import objects.player.Player;
import animations.WeaponAnimationController;
import objects.weapon.WeaponStates;
import objects.weapon.guns.AbstractGun;

class Weapon extends GameObject {

    private var view:WeaponView;
    private var player:Player;
    private var canShoot:Bool = true;
    private var stateController:WeaponStates;

    public function new(player) {
        super(new WeaponAnimationController(this));
        this.player = player;
        view = new WeaponView(this);
        stateController = new WeaponStates(this);
        
        setState(WeaponStates.pistol);

        input.onMouseDown(manualShoot);
        input.onMousePressed(autoShoot);
    }

    public function setState(state:String):Void {
        stateController.setState(state);
        animationController.setState(state);
    }

    public override function update(dt:Float):Void {
        x = player.x;
        y = player.y;

        view.update();
    }

    private function autoShoot() {
        if (stateController.getGun().auto) {
            shoot();
        }
    }

    private function manualShoot() {
        if (!stateController.getGun().auto) {
            shoot();
        }
    }

    private function shoot() {
        var direction:Vector = calcDirectionToMouse();
        stateController.getGun().fire(direction);
        view.shoot();
    }

    private function calcDirectionToMouse():Vector {
        var mouse:Vector = input.getMousePosition();
        var position:Vector = new Vector(x, y);
        var direction:Vector = Vector.calcDifference(position, mouse);

        return Vector.normalize(direction);
    }

    public function setRandomGun() {
        stateController.setRandomGun();
    }
}