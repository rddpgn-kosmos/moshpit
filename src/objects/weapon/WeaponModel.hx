package objects.weapon;

import game.Animation;

class WeaponModel implements IGameObjectModel {
    public var objType:String = 'weapon';
    public var optimized:Bool = false;
    public var animation:Animation = new Animation([
        "assets/sprites/weapons/pistol.png",
    ]);

    public function new() {}
}