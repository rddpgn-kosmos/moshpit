package game;

class AnimationController {

    private var states:Array<AnimationState>;
    private var object:GameObject;
    private var state:AnimationState;

    public function new(object:GameObject) {
        this.object = object;
        this.states = new Array<AnimationState>();
    }

    private function setInitialState(state:AnimationState) {
        this.state = state;
        applyAnimation(state);
    }

    public function setState(state:String):Void {
        if (this.state.name != state) {
            for(anim in states) {
                if (anim.name == state) {
                    applyAnimation(anim);
                    this.state = anim;
                }
            }
        }
    }

    private function applyAnimation(animation:AnimationState) {
        object.animation = animation.animation;
        object.animation.animationSpeed = animation.speed;
        object.animation.playType = animation.playType;
        object.animation.setCurrentFrame(0);
    }
}