package game;

import game.Animation;

class AnimationState {
    public var name:String;
    public var speed:Float;
    public var animation:Animation;
    public var playType:String;

    public function new(name:String, speed:Float, animation:Animation, playType:String='normal') {
        this.name = name;
        this.speed = speed;
        this.animation = animation;
        this.playType = playType;
    }
}