package game;

import js.html.Storage;
import game.Game;
import game.InputController;
import game.Animation;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;

@:allow(game.InputController)
class GameObject extends Sprite {

    @:allow(game.AnimationController)
    private var animation:Animation;

    public var animationController:AnimationController;
    public var input:InputController;
    public var objectType:String = 'gameobject';

    //Динамическое создание анимаций? 
    public function new(animationController:AnimationController) {
        this.animationController = animationController;
        super(animation.getCurrentFrame());

        anchor.set(0.5);
        position.set(0, 0);
        input = Game.getGame().getInputController();

        Game.getGame().getGameObjectStorage().saveGameObject(this);

        init();
    }

    public function init() { }

    public function update(dt:Float) { }

    public final function secretUpdate(dt:Float) {
        if (animation != null) {
            texture = animation.updateAnimation();
        }
    }

    public function instanceDestroy() {
        Game.getGame().getGameObjectStorage().destroyGameObject(this);
        this.destroy();
    }
}