package game;

import game.GameObject;
import game.GameObjectStorage;

class CollisionController {

    private var gameObjStorage:GameObjectStorage;

    public function new(gameObjStorage:GameObjectStorage) {
        this.gameObjStorage = gameObjStorage;
    }
    public function SimpleCollision(objA:String, objB:String):Dynamic {
        var objects:List<GameObject> = gameObjStorage.getObjectStorage();

        for(objX in objects) {
            for(objY in objects) {
                if (objX.objectType == objA && objY.objectType == objB) {
                    if (CalcSimpleCollision(objX, objY)) {
                        return objX.objectType == objB? objY:objX;
                    }
                }
            }
        }
        return null;
    }

    private function CalcSimpleCollision(objX:GameObject, objY:GameObject):Bool {
        if (Math.abs(objX.x - objY.x) < 32.0) {
            if (Math.abs(objX.y - objY.y) < 32.0) {
                return true;
            }
        }
        return false;
    }

}