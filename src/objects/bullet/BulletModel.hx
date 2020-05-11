package objects.bullet;

import game.Animation;

class BulletModel implements IGameObjectModel {
    public var objType:String = 'bullet';
    public var optimized:Bool = false;
    public var animation:Animation = new Animation([
        "assets/sprites/bullets/bullet_0.png",
        "assets/sprites/bullets/bullet_1.png",
    ]);

    public function new() {}
}
