package objects.weapon;

import game.Animation;
import game.GameObject;
import objects.bullet.Bullet;
import utils.Vector;
import objects.player.Player;
import objects.weapon.WeaponModel;

class Weapon extends GameObject {

    private var view:WeaponView;
    private var model:WeaponModel = new WeaponModel();
    private var player:Player;

    public function new(player) {
        super(model);
        this.player = player;
        view = new WeaponView(this);

        input.onMouseClick(shoot);
    }

    public override function update(dt:Float):Void {
        x = player.x;
        y = player.y;

        view.update();
    }

    private function shoot() {
        var bullet:Bullet = new Bullet();
        bullet.x = x;
        bullet.y = y;

        var mouse = input.getMousePosition();
        var direction = new Vector(x, y);

        var dir = Vector.calcDifference(direction, mouse);


        bullet.direction = Vector.normalize(dir);
        bullet.rotation = rotation;

        view.shoot();
    }
}