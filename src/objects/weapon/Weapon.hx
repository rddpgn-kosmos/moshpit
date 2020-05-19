package objects.weapon;

import utils.Alarm;
import game.GameObject;
import objects.bullet.Bullet;
import utils.Vector;
import objects.player.Player;
import animations.WeaponAnimationController;

class Weapon extends GameObject {

    private var view:WeaponView;
    private var player:Player;
    private var canShoot:Bool = true;

    public function new(player) {
        super(new WeaponAnimationController(this));

        this.player = player;
        view = new WeaponView(this);

        input.onMousePressed(shoot);
    }

    public override function update(dt:Float):Void {
        x = player.x;
        y = player.y;

        view.update();

        //shoot();
    }

    private function shoot() {
        if (canShoot) {
            var bullet:Bullet = new Bullet();
            bullet.x = x;
            bullet.y = y;

            var mouse = input.getMousePosition();
            var direction = new Vector(x, y);

            var dir = Vector.calcDifference(direction, mouse);


            bullet.direction = Vector.normalize(dir);
            bullet.direction.x += (Math.random() - 0.5)/10;
            bullet.direction.y += (Math.random() - 0.5)/10;
            bullet.rotation = Math.atan2( bullet.direction.y,  bullet.direction.x);
            
            new Alarm(50, () -> canShoot = true);
            canShoot = false;
            view.shoot();
        }
    }
}