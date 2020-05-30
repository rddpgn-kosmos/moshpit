package utils;

class Ray {
    public var startPoint:Point;
    public var endPoint:Point;

    public function new(startPoint:Point, endPoint:Point):Void {
        this.startPoint = startPoint;
        this.endPoint = endPoint;
    }
}