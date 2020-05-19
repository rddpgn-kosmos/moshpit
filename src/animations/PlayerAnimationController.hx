package animations;

import objects.player.Player;
import game.Animation;
import game.AnimationState;

class PlayerAnimationController extends game.AnimationController {

    private var playerRun:AnimationState;
    private var playerRoll:AnimationState;
    private var playerStay:AnimationState;

    private static var playerRunAnimation:Animation = new Animation([
        "assets/sprites/player/player_run_0.png",
        "assets/sprites/player/player_run_1.png",
        "assets/sprites/player/player_run_2.png",
        "assets/sprites/player/player_run_3.png",
    ]);
    private static var playerRollAnimation:Animation = new Animation([
        "assets/sprites/player/player_roll.png",
    ]);


    public function new(player:Player) {
        super(player);
        
        playerRun = new AnimationState('run', 0.4, playerRunAnimation);
        playerRoll = new AnimationState('roll', 0.4, playerRollAnimation);
        playerStay = new AnimationState('stay', 0.0, playerRunAnimation);

        states.push(playerRun);
        states.push(playerRoll);
        states.push(playerStay);

        setInitialState(playerStay);
    }
}