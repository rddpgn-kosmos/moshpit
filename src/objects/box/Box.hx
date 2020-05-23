package objects.box;

import game.GameObject;
import animations.BoxAnimationController;

class Box extends GameObject{
    public function new() {
        super(new BoxAnimationController(this));
        objectType = 'box';
    }
}