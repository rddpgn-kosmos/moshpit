package objects.weapon;

import objects.weapon.guns.*;

class WeaponStates {
    public static var pistol:String = 'pistol';
    public static var pp:String = 'pp';
    public static var shotgun:String = 'shotgun';
    public static var tripleMachinegun:String = 'triple_machinegun';

    private var currentState:String;
    private var gunMap:Map<String, AbstractGun>;
    private var weapon:Weapon;

    public function new(weapon:Weapon) {
        this.weapon = weapon;

        gunMap = new Map<String, AbstractGun>();
        gunMap[pistol] = new Pistol(weapon);
        gunMap[pp] = new Pp(weapon);
        gunMap[shotgun] = new Shotgun(weapon);
    };

    public function setState(state:String):Void {
        currentState = state;
    }

    public function getState():String {
        return currentState;
    }

    public function getGun():AbstractGun {
        return gunMap[currentState];
    }

    public function setRandomGun() {
        var gunsRotation = true;
        while(gunsRotation) {
            for(gun in gunMap.keys()) {
                if (gun != currentState && gun != pistol) {
                    if (Math.random() > 0.5) {
                        gunsRotation = false;
                        weapon.setState(gun);
                    }
                }
            }
        }
    }
}