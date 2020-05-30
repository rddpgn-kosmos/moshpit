package game;

import game.Game;
import game.GameObject;
import pixi.core.Application;
import game.CollisionController;

@:allow(game.CollisionController)
class GameObjectStorage {

    private var app:AppController;
    private var storage:List<GameObject>;

    public function new() {
        app = Game.getGame().getApp();
        storage = new List<GameObject>();
    }

    public function updateGameObjects(dt:Float) {
        for(obj in storage) {
            if (!obj.getIsDestroyed()) {
                obj.update(dt);
                obj.secretUpdate(dt);
            }
        }

        updateLayering();
    }

    private function updateLayering() {
        app.stage.children.sort(function(a, b) return Math.round(a.y - b.y));
    }

    public function saveGameObject(obj:GameObject) {
        storage.push(obj);
        app.stage.addChild(obj);
    }

    public function destroyGameObject(obj:GameObject) {
        storage.remove(obj);
    }

    private function getObjectStorage() {
        return storage;
    }
}