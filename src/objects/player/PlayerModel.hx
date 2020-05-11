package objects.player;

import game.Animation;

class PlayerModel implements IGameObjectModel {
    public var objType:String = 'player';
    public var optimized:Bool = false;
    public var animation:Animation = new Animation([
        "assets/sprites/player/player_run_0.png",
        "assets/sprites/player/player_run_1.png",
        "assets/sprites/player/player_run_2.png",
        "assets/sprites/player/player_run_3.png",
    ]);

    public function new() {}
}