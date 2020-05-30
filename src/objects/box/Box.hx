package objects.box;

import game.GameObject;
import animations.BoxAnimationController;
import objects.player.Player;

class Box extends GameObject{

    private var player:GameObject;

    public function new(player:GameObject):Void {
        super(new BoxAnimationController(this));
        objectType = 'box';
        this.player = player;
        respawn();
    }

    public function respawn() {
        var offset = 64;
        var levelWidth = 1920 - offset * 2;
        var levelHeight = 1080 - offset * 2;

        do {
            x = Math.random() * levelWidth + offset;
            y = Math.random() * levelHeight + offset;
        } while(Math.abs(player.x - x) < 400 && Math.abs(player.y - y) < 400);
    }

    public override function update(dt:Float) {
        var playerCollision:Dynamic = collisionController.SimpleCollision(this, 'player');
        if (playerCollision != null) {
            var player:Player = cast(playerCollision[0], Player);
            player.setRandomGun();
            respawn();
        }
    }
}