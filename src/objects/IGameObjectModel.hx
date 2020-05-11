package objects;

import game.Animation;

interface IGameObjectModel {
    public var objType:String;
    public var optimized:Bool;
    public var animation:Animation;
}