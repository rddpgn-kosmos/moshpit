package animations;

import game.Animation;
import game.AnimationController;
import game.AnimationState;
import objects.box.Box;

class BoxAnimationController extends AnimationController {

    private var boxState:AnimationState;
    private var boxAnimation = new Animation([
        "assets/sprites/enviroment/box.png",
    ]);

    public function new(box:Box) {
        super(box);

        boxState = new AnimationState('init', 0, boxAnimation);

        states.push(boxState);

        setInitialState(boxState);
    }
}