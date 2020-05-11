package game;

import game.Game;
import game.GameObject;
import pixi.core.Application;

class GameObjectStorage {

    private var app:AppController;
    private var storage:List<GameObject>;
    private var pools:Array<Array<GameObject>>;

    public function new() {
        app = Game.getGame().getApp();
        storage = new List<GameObject>();
    }

    public function updateGameObjects(dt:Float) {
        for(obj in storage) {
            obj.update(dt);
            obj.secretUpdate(dt);
        }
    }

    public function saveGameObject(obj:GameObject) {
        storage.push(obj);
        app.stage.addChild(obj);
    }

    public function optimizedSaveGameObject(obj:GameObject) {
        trace(obj.objectType);
    }
}