package objects.enemy;

import utils.Alarm;
import animations.EnemyAnimationController;
import game.GameObject;
import utils.Vector;


class Enemy extends GameObject {

    private var agility:Float;
    private var moveSpeed:Float;
    private var maxSpeed:Float;
    private var player:GameObject;
    private var direction:Vector = new Vector();
    private var diff:Vector = new Vector();
    private var pos:Vector;
    private var canGetDamage:Bool = true;
    private var hp:Float = Math.random()*2;
    private var factory:EnemyFactory;

    public function new(x:Float, y:Float, player:GameObject, factory:EnemyFactory):Void {
        super(new EnemyAnimationController(this));

        objectType = 'enemy';

        this.player = player;
        this.x = x;
        this.y = y;

        pos = new Vector(x, y);
        moveSpeed = Math.random() * 4 + 4;
        maxSpeed = moveSpeed;
        this.factory = factory;
    }

    public override function update(dt:Float):Void {
        if (!player.getIsDestroyed()) {
            diff = Vector.calcDifference(new Vector(x, y), new Vector(player.x, player.y));
            Vector.lerp(direction, diff, Math.random()/15);
            direction = Vector.normalize(direction);

            if (player.x > x) {
                scale.x = 1;
            } else {
                scale.x = -1;
            }

            if (moveSpeed < maxSpeed) {
                moveSpeed += 0.1;
            }
        } else {
            moveSpeed /= 1.03;
        }

        x += direction.x * moveSpeed;
        y += direction.y * moveSpeed;
    }

    public function hit():Void {
        if (canGetDamage) {
            animationController.setState('got_damage');
            moveSpeed /= 2;
            moveSpeed = -moveSpeed;
            direction.addAngle(Math.random() * 60 - 30);
            canGetDamage = false;
            
            new Alarm(120, function() {
                animationController.setState('run');
                canGetDamage = true;
            });

            hp -= 1;

            if (hp <= 0) {
                factory.removeSimpleEnemy(this);
            }
        }
    }
}