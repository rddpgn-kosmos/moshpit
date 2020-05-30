package animations;

import game.GameObject;
import game.Animation;
import game.AnimationState;

class EnemyAnimationController extends game.AnimationController {

    private var enemyRun:AnimationState;
    private var enemyAttack:AnimationState;
    private var enemyGotDamage:AnimationState;

    private static var enemyRunAnimation:Animation = new Animation([
        "assets/sprites/enemies/skeleton_hit.png",
    ]);
    private static var enemyAttackAnimation:Animation = new Animation([
        "assets/sprites/enemies/skeleton_hit.png",
    ]);
    private static var enemyGotDamageAnimation:Animation = new Animation([
        "assets/sprites/enemies/skeleton_hit.png",
    ]);

    public function new(enemy:GameObject) {
        super(enemy);
        
        enemyRun = new AnimationState('run', 0.4, enemyRunAnimation);
        enemyAttack = new AnimationState('attack', 0.4, enemyAttackAnimation);
        enemyGotDamage = new AnimationState('got_damage', 0.0, enemyGotDamageAnimation);

        states.push(enemyRun);
        states.push(enemyAttack);
        states.push(enemyGotDamage);

        setInitialState(enemyRun);
    }
}