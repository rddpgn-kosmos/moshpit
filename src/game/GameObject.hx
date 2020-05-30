package game;

import js.html.Storage;
import game.Game;
import game.InputController;
import game.Animation;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;

@:allow(game.InputController)
@:allow(game.GameObjectStorage)
class GameObject extends Sprite {
    @:allow(game.AnimationController)
    private var animation:Animation;
    private var collisionController:CollisionController;

    public var input:InputController;

    public var animationController:AnimationController;
    public var objectType:String = 'gameobject';
    public var radius:Int = 32;

    /*
        Вынести все общие штуки для всех геймобжектов сюда.
        По крайней мере:
            direction
            speed
            radius
            objectType
            animationController
            pointTowardsDirection
            overrideDirection
    
    */

    public function new(animationController:AnimationController) {
        /*
        Здесь оставить блэнковую анимацию,
        Инициализацию всех движковых штук
        Позиционирование
        В качестве аргументов использовать координаты
        */
        this.animationController = animationController;
        collisionController = Game.getGame().getCollisionController();

        super(animation.getCurrentFrame());

        anchor.set(0.5);
        position.set(0, 0);
        input = Game.getGame().getInputController();

        Game.getGame().getGameObjectStorage().saveGameObject(this);

        init();
        postInit();
    }

    public function init() { }

    private final function postInit() {
        /*
            Инициализация нормальной анимации если есть
        */
    }

    public function update(dt:Float) { }

    private final function secretUpdate(dt:Float) {
        if (animation != null) {
            texture = animation.updateAnimation();
        }
    }

    public function instanceDestroy() {
        Game.getGame().getGameObjectStorage().destroyGameObject(this);
        this.destroy();
    }
}