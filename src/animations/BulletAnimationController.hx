package animations;

import game.AnimationState;
import objects.bullet.Bullet;
import game.AnimationController;
import game.Animation;

class BulletAnimationControler extends AnimationController {

    private var bulletAnimationState:AnimationState;
    private var bulletAnimation:Animation = new Animation([
        "assets/sprites/bullets/bullet_0.png",
        "assets/sprites/bullets/bullet_1.png",
    ]);

    public function new(bullet:Bullet) {
        super(bullet);
        
        bulletAnimationState = new AnimationState('init', 1, bulletAnimation, 'once');

        states.push(bulletAnimationState);

        setInitialState(bulletAnimationState);
    }
}