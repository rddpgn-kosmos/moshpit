package utils;

import haxe.CallStack;

class Vector {

    public var x:Float;
    public var y:Float;

    public function new(x:Float = 0, y:Float = 0) {
        this.x = x;
        this.y = y;
    }

    public static function normalize(vector:Vector):Vector {
        var length = calcLength(vector.x, vector.y);
        if (length != 0) {
            vector.x /= length;
            vector.y /= length;
        }
        return vector;
    }
    
    public function getLength():Float {
        return calcLength(x, y);
    }

    public function setLength(length:Float):Void {
        x *= length;
        y *= length;
    }

    public static function calcLength(x:Float, y:Float):Float {
        return Math.sqrt(x*x + y*y);
    }

    public static function calcDifference(from:Vector, to:Vector):Vector {
        var diffVector:Vector = new Vector(0,0);
        diffVector.x = to.x - from.x;
        diffVector.y = to.y - from.y;
        return diffVector;
    }

    public static function lerp(from:Vector, to:Vector, deltaSpeed:Float = 1) {
        var diffVector:Vector = Vector.calcDifference(from, to);

        if (Vector.calcLength(diffVector.x, diffVector.y) > deltaSpeed) {
            Vector.normalize(diffVector).setLength(deltaSpeed);
        }

        from.x += diffVector.x;
        from.y += diffVector.y;
    }
}
