package animations;

import objects.weapon.Weapon;
import game.Animation;
import game.AnimationState;

class WeaponAnimationController extends game.AnimationController {

    private var weaponInitState:AnimationState;
    private var weaponAnimation:Animation = new Animation([
        "assets/sprites/weapons/pistol.png",
    ]);

    public function new(weapon:Weapon) {
        super(weapon);
        
        weaponInitState = new AnimationState('init', 0.0, weaponAnimation);

        states.push(weaponInitState);
        
        setInitialState(weaponInitState);
    }
}