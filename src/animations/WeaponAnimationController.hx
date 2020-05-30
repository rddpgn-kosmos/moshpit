package animations;

import objects.weapon.Weapon;
import game.Animation;
import game.AnimationState;
import objects.weapon.WeaponStates;

class WeaponAnimationController extends game.AnimationController {

    private var pistolState:AnimationState;
    private var ppState:AnimationState;
    private var shotgunState:AnimationState;
    private var tripleMachinegunState:AnimationState;

    private var pistolAnimation:Animation = new Animation([
        "assets/sprites/weapons/pistol.png",
    ]);
    private var ppAnimation:Animation = new Animation([
        "assets/sprites/weapons/pp.png",
    ]);
    private var shotgunAnimation:Animation = new Animation([
        "assets/sprites/weapons/shotgun.png",
    ]);
    private var tripleMachinegunAnimation:Animation = new Animation([
        "assets/sprites/weapons/triple_machinegun.png",
    ]);

    public function new(weapon:Weapon) {
        super(weapon);
        
        pistolState = new AnimationState(WeaponStates.pistol, 0.0, pistolAnimation);
        ppState = new AnimationState(WeaponStates.pp, 0.0, ppAnimation);
        shotgunState = new AnimationState(WeaponStates.shotgun, 0.0, shotgunAnimation);
        tripleMachinegunState = new AnimationState(WeaponStates.tripleMachinegun, 0.0, tripleMachinegunAnimation);


        states.push(pistolState);
        states.push(ppState);
        states.push(shotgunState);
        states.push(tripleMachinegunState);

        setInitialState(pistolState);
    }
}