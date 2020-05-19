package objects.player;

class PlayerView {
    private var animSpeed:Float = 0.4;
    private var player:Player;

    public function new(player:Player) {
        this.player = player;
        //player.animation.animationSpeed = animSpeed;
    }

    public function update() {
        if (!player.isRolling) {

            if (player.x > player.input.getMousePosition().x) {
                player.scale.x = -1;
            } else {
                player.scale.x = 1;
            }

            player.rotation = 0;

            if (player.getMovementSpeed() > 0.1) {
                player.animationController.setState('run');
            } else {
                player.animationController.setState('stay');
            }
        } else {
            player.animationController.setState('roll');
            player.rotation += 0.5;
        }
    }

    public function rollAnimation() {

    }
}