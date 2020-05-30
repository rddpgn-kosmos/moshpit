package game;

import game.GameObject;
import game.GameObjectStorage;
import utils.Ray;

class CollisionController {

    private var gameObjStorage:GameObjectStorage;

    public function new(gameObjStorage:GameObjectStorage) {
        this.gameObjStorage = gameObjStorage;
    }
    public function SimpleCollision(objA:Dynamic, objB:Dynamic):Dynamic {
        if (Std.is(objA, GameObject) && Std.is(objB, GameObject)) {
            return simpleCollisionObjectObject(objA, objB);
        } else if ((Std.is(objA, String) && Std.is(objB, GameObject)) || (Std.is(objA, GameObject) && Std.is(objB, String))) {
            return simpleCollisionObjectString(objA, objB);
        } else  if (Std.is(objA, String) && Std.is(objB, String)) {
            return simpleCollisionStringString(objA, objB);
        } else {
            trace('Expected values needs to be string or gameobject');
            return null;
        }
    }

    public function raycastCollision(ray:Ray, obj:Dynamic):Dynamic {
        if (Std.is(obj, String)) {
            var objects:List<GameObject> = gameObjStorage.getObjectStorage();
            for(objX in objects) {
                if (objX.objectType == obj) {
                    var result = calcRaycastCollision(ray, objX);
                    if (result != null) {
                        return result;
                    }
                }
            }
        } else if (Std.is(obj, GameObject)) {
            return raycastCollision(ray, obj);
        } else {
            trace('Expected values is string or gameobject');
        }
        return null;
    }

    private function simpleCollisionObjectString(objA:Dynamic, objB:Dynamic):Dynamic {
        var objects:List<GameObject> = gameObjStorage.getObjectStorage();
        var collidedObjects:Array<GameObject> = new Array<GameObject>();

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
                if (calcSimpleCollision(objX, obj)) {
                    collidedObjects.push(objX);
                }
            }
        }

        if (collidedObjects.length > 0) {
            return collidedObjects;
        }

        return null;
    }

    private function simpleCollisionObjectObject(objA:GameObject, objB:GameObject):Dynamic {
        return calcSimpleCollision(objA, objB);
    }

    private function simpleCollisionStringString(objA:String, objB:String):Dynamic {
        var objects:List<GameObject> = gameObjStorage.getObjectStorage();
        var collidedObjects:Map<GameObject, GameObject> = new Map<GameObject, GameObject>();
        var collided:Bool = false;

        for(objX in objects) {
            for(objY in objects) {
                if (objX.objectType == objA && objY.objectType == objB) {
                    if (calcSimpleCollision(objX, objY)) {
                        collidedObjects[objX] = objY;
                        collided = true;
                    }
                }
            }
        }

        if (collided) {
            return collidedObjects;
        }

        return null;
    }

    private function calcSimpleCollision(objX:GameObject, objY:GameObject):Dynamic {
        if (Math.abs(objX.x - objY.x) < 32.0) {
            if (Math.abs(objX.y - objY.y) < 32.0) {
                return true;
            }
        }
        return null;
    }

    private function calcRaycastCollision(ray:Ray, obj:GameObject):Dynamic {
        var rayStartX:Float = ray.startPoint.x;
        var rayStartY:Float = ray.startPoint.y;
        var rayEndX:Float = ray.endPoint.x;
        var rayEndY:Float = ray.endPoint.y;
        
        var circleX:Float = obj.x;
        var circleY:Float = obj.y;
        var radius:Float = obj.radius;

        var LAB = Math.sqrt((rayStartX - rayEndX) * (rayStartX - rayEndX) +
                  (rayStartY - rayEndY) * (rayStartY - rayEndY));

        var Dx = (rayEndX-rayStartX)/LAB;
        var Dy = (rayEndY-rayStartY)/LAB;

        var t = Dx*(circleX-rayStartX) + Dy*(circleY-rayStartY);    

        var Ex = t*Dx+rayStartX;
        var Ey = t*Dy+rayStartY;

        var LEC = Math.sqrt((Ex-circleX)*(Ex-circleX) + (Ey-circleY)*(Ey-circleY));

        if( LEC <= 12 ) {
            return obj;
        } else {
            return null;
        }
    }
}


//Возвращать массив объектов, с которыми произошла коллизия.