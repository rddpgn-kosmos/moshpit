package objects.player;

import game.Game;
import objects.weapon.Weapon;
import configs.InputTemplate;
import game.GameObject;
import utils.Vector;
import utils.Alarm;
import objects.player.PlayerModel;

class Player extends GameObject {

    private var realMovement:Vector =  new Vector();
    private var idealMovement:Vector = new Vector();
    private var direction:Vector = new Vector(1.0, 0.0);

    private var MOVE_UP:Int = 0;
    private var MOVE_LEFT:Int = 0;
    private var MOVE_DOWN:Int = 0;
    private var MOVE_RIGHT:Int = 0;

    private var moveSpeed:Float = 8;
    private var rollMultiplier:Float = 2.5;
    private var view:PlayerView;

    private var weapon:Weapon;

    public var isRolling:Bool = false;
    private var model:PlayerModel = new PlayerModel();

    public function new() {
        super(model);
        view = new PlayerView(this);
        position.set(500,500);

        weapon = new Weapon(this);
    }

    public override function init() {
       input.onKeyPressed(InputTemplate.KEY_MOVE_UP,()->MOVE_UP = -1, ()->MOVE_UP = 0);
       input.onKeyPressed(InputTemplate.KEY_MOVE_LEFT,()->MOVE_LEFT = -1, ()->MOVE_LEFT = 0);
       input.onKeyPressed(InputTemplate.KEY_MOVE_DOWN,()->MOVE_DOWN = 1, ()->MOVE_DOWN = 0);
       input.onKeyPressed(InputTemplate.KEY_MOVE_RIGHT,()->MOVE_RIGHT = 1, ()->MOVE_RIGHT = 0);
       
       input.onKeyDown(InputTemplate.KEY_ROLL, roll);
    }
    
    public override function update(dt:Float) {
        if (!isRolling) {
            idealMovement.y = MOVE_UP + MOVE_DOWN;
            idealMovement.x = MOVE_LEFT + MOVE_RIGHT;

            Vector.normalize(idealMovement);

            if (idealMovement.getLength() != 0) {
                direction.x = idealMovement.x;
                direction.y = idealMovement.y;
            }

            idealMovement.setLength(moveSpeed);
            Vector.lerp(realMovement, idealMovement, 1.25);
            
            y += realMovement.y * dt;
            x += realMovement.x * dt;
        } else {
            y += direction.y * moveSpeed * rollMultiplier * dt;
            x += direction.x * moveSpeed * rollMultiplier * dt;
        }

        view.update();
    }

    private function roll() {
        if (!isRolling) {
            isRolling = true;
            new Alarm(200, ()-> isRolling = false);
        }
    }

    //Вот это от сюда убрать
    private function BoolToInt(a:Bool):Int {
        return a? 1 : 0;
    }

    public function getMovementSpeed() {
        return realMovement.getLength();
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

