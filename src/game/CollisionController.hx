package game;

import game.GameObject;
import game.GameObjectStorage;

class CollisionController {

    private var gameObjStorage:GameObjectStorage;

    public function new(gameObjStorage:GameObjectStorage) {
        this.gameObjStorage = gameObjStorage;
    }
    public function SimpleCollision(objA:Dynamic, objB:Dynamic):Dynamic {
        if (Std.is(objA, GameObject) && Std.is(objB, GameObject)) {
            return SimpleCollisionObjectObject(objA, objB);
        } else if ((Std.is(objA, String) && Std.is(objB, GameObject)) || (Std.is(objA, GameObject) && Std.is(objB, String))) {
            return SimpleCollisionObjectString(objA, objB);
        } else  if (Std.is(objA, String) && Std.is(objB, String)) {
            return SimpleCollisionStringString(objA, objB);
        } else {
            trace('Expected values needs to be string or gameobject');
            return false;
        }
    }

    private function SimpleCollisionObjectString(objA:Dynamic, objB:Dynamic):Dynamic {
        var objects:List<GameObject> = gameObjStorage.getObjectStorage();

        var obj:GameObject;
        var objType:String;

        if (Std.is(objA, GameObject)) {
            obj = objA;
            objType = objB;
        } else {
            obj = objB;
            objType = objA;
        }

        for(objX in objects) {
            if (objX.objectType == objType) {
                if (CalcSimpleCollision(objX, obj)) {
                    return objX;
                }
            }
        }
        return false;
    }

    private function SimpleCollisionObjectObject(objA:GameObject, objB:GameObject):Bool {
        return CalcSimpleCollision(objA, objB);
    }

    private function SimpleCollisionStringString(objA:String, objB:String):Bool {
        var objects:List<GameObject> = gameObjStorage.getObjectStorage();
        
        for(objX in objects) {
            for(objY in objects) {
                if (objX.objectType == objA && objY.objectType == objB) {
                    if (CalcSimpleCollision(objX, objY)) {
                        return true;
                    }
                }
            }
        }
        return false;
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


//Возвращать массив объектов, с которыми произошла коллизия.