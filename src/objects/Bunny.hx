package objects;

import game.GameObject;
import utils.Vector;

class Bunny extends GameObject {

    private var realMovement:Vector =  new Vector();
    private var idealMovement:Vector = new Vector();
    private var direction:Vector = new Vector(1.0, 0.0);

    private var MOVE_UP:Int = 0;
    private var MOVE_LEFT:Int = 0;
    private var MOVE_DOWN:Int = 0;
    private var MOVE_RIGHT:Int = 0;

    private var moveSpeed:Float = 8;
    private var isRolling:Bool = false;

    public function new() {
        super("assets/bunny.png");
        position.set(500,500);
    }

    public override function init() {
       input.onKeyPressed('w',()->MOVE_UP = -1, ()->MOVE_UP = 0);
       input.onKeyPressed('a',()->MOVE_LEFT = -1, ()->MOVE_LEFT = 0);
       input.onKeyPressed('s',()->MOVE_DOWN = 1, ()->MOVE_DOWN = 0);
       input.onKeyPressed('d',()->MOVE_RIGHT = 1, ()->MOVE_RIGHT = 0);
    }
    
    public override function update(dt:Float) {
        idealMovement.y = MOVE_UP + MOVE_DOWN;
        idealMovement.x = MOVE_LEFT + MOVE_RIGHT;

        Vector.normalize(idealMovement);

        if (idealMovement.getLength() != 0) {
            direction.x = idealMovement.x;
            direction.y = idealMovement.y;
        }

        idealMovement.setLength(moveSpeed);
        Vector.lerp(realMovement, idealMovement, 1.25);
        
        y += realMovement.y;
        x += realMovement.x;
    }

    private function BoolToInt(a:Bool):Int {
        return a? 1 : 0;
    }
}

/*
Функция нормализации верктора
Функция поиска длины вектора
Если длина вектора не ноль, то ускорятся
Иначе замедлятся
Настоящее усорение, это вектор, который стремится к идеальному ускорению

Коллбек функция выполняется в контексте класса, которому принадлежит данная функция
Убрать темлпейт, и сделать нормальную функцию он кей даун;


*/

