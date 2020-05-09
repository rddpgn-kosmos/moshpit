package game;

import game.GameLevel;
import game.GameObjectStorage;
import game.InputController;
import levels.MainLevel;
import AppController;

class Game {

    private static var instance:Game;

    private var app:AppController;
    private var currenLevel:GameLevel;
    private var inputController:InputController;
    private var objStorage:GameObjectStorage;

    public function new(app:AppController) {
        instance = this;
        this.app = app;
        inputController = new InputController();
        objStorage =      new GameObjectStorage();
        currenLevel =     new MainLevel();
    }

    public function update(dt:Float):Void {
        objStorage.updateGameObjects(dt);
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

    public static function getGame():Game {
        return instance;
    }
}