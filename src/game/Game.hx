package game;

import game.GameLevel;
import game.GameObjectStorage;
import game.InputController;
import levels.MainLevel;
import AppController;
import game.CollisionController;

class Game {

    private static var instance:Game;

    private var app:AppController;
    private var currenLevel:GameLevel;
    private var inputController:InputController;
    private var objStorage:GameObjectStorage;
    private var collisionController:CollisionController;

    public function new(app:AppController) {
        instance = this;
        this.app = app;
        inputController = new InputController();
        objStorage =      new GameObjectStorage();
        collisionController = new CollisionController(objStorage);
        currenLevel =     new MainLevel();
    }

    public function update(dt:Float):Void {
        objStorage.updateGameObjects(dt);
        inputController.update();
    }

    public function getApp():AppController {
        return app;
    }

    public function getInputController():InputController {
        return inputController;
    }

    public function getGameObjectStorage():GameObjectStorage {
        return objStorage;
    }

    public function getCollisionController():CollisionController {
        return collisionController;
    }

    public static function getGame():Game {
        return instance;
    }
}