package objects.player;

import game.Animation;

class PlayerView {
    private var playerRunAnimation:Animation = new Animation([
        "assets/sprites/player/player_run_0.png",
        "assets/sprites/player/player_run_1.png",
        "assets/sprites/player/player_run_2.png",
        "assets/sprites/player/player_run_3.png",
    ]);
    private var playerRollAnimation:Animation = new Animation([
        "assets/sprites/player/player_roll.png",
    ]);

    private var animSpeed:Float = 0.4;
    private var player:Player;

    public function new(player:Player) {
        this.player = player;

        player.animation = playerRunAnimation;
        player.animation.animationSpeed = animSpeed;
    }

    public function update() {
        if (!player.isRolling) {

            if (player.x > player.input.getMousePosition().x) {
                player.scale.x = -1;
            } else {
                player.scale.x = 1;
            }

            player.rotation = 0;
            player.applyAnimation(playerRunAnimation);

            if (player.getMovementSpeed() > 0.1) {
                player.animation.animationSpeed = animSpeed;
            } else {
                player.animation.animationSpeed = 0;
                player.animation.setCurrentFrame(0);
            }
        } else {
            player.applyAnimation(playerRollAnimation);
            player.rotation += 0.5;
        }
    }

    public function rollAnimation() {

    }
}