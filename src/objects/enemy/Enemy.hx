package objects.enemy;

import animations.EnemyAnimationController;
import game.GameObject;
import utils.Vector;


class Enemy extends GameObject {

    private var agility:Float;
    private var moveSpeed:Float;
    private var player:GameObject;
    private var direction:Vector = new Vector();
    private var diff:Vector = new Vector();
    private var pos:Vector;

    public function new(x:Float, y:Float, player:GameObject):Void {
        super(new EnemyAnimationController(this));
        this.player = player;
        this.x = x;
        this.y = y;

        pos = new Vector(x, y);
        moveSpeed = Math.random() * 4 + 4;
    }

    public override function update(dt:Float) {
        diff = Vector.calcDifference(new Vector(x, y), new Vector(player.x, player.y));
        Vector.lerp(direction, diff, 0.05);
        direction = Vector.normalize(direction);

        x += direction.x * moveSpeed;
        y += direction.y * moveSpeed;
    }
}