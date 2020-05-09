package game;

import game.Game;
import game.GameObject;
import pixi.core.Application;

class GameObjectStorage {

    private var app:AppController;
    private var storage:List<GameObject>;

    public function new() {
        app = Game.getGame().getApp();
        storage = new List<GameObject>();
    }

    public function updateGameObjects(dt:Float) {
        for(obj in storage) {
            obj.update(dt);
        }
    }

    public function createGameObject(objClass:Class<GameObject>) {
        var obj:GameObject = Type.createInstance(objClass, null);
        storage.push(obj);
        app.stage.addChild(obj);
        
        return obj;
    }
}