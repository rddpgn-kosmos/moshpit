package objects.box;

import game.GameObject;
import animations.BoxAnimationController;
import objects.player.Player;

class Box extends GameObject{

    public function new() {
        super(new BoxAnimationController(this));
        objectType = 'box';
    }

    public function respawn() {
        this.x = 800*Math.random();
        this.y = 800*Math.random();
    }

    public override function update(dt:Float) {
        var playerCollision:Dynamic = collisionController.SimpleCollision(this, 'player');
        if (playerCollision != false) {
            var player:Player = cast(playerCollision, Player);
            player.setRandomGun();
            respawn();
        }
    }
}