package game;

import objects.IGameObjectModel;
import js.html.Storage;
import game.Game;
import game.InputController;
import game.Animation;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;

@:allow(game.InputController)
class GameObject extends Sprite {

    public var animation:Animation;
    public var input:InputController;
    public var objectType:String = 'gameobject';

    private var optimized:Bool = false;

    //Динамическое создание анимаций? 
    public function new(model:IGameObjectModel) {
        super(Texture.from('assets/sprites/blank.png'));
        
        this.animation = model.animation;
        texture = animation.getCurrentFrame();

        anchor.set(0.5);
        position.set(0, 0);
        input = Game.getGame().getInputController();

        if (!model.optimized) {
            Game.getGame().getGameObjectStorage().saveGameObject(this);
        } else {
            Game.getGame().getGameObjectStorage().optimizedSaveGameObject(this);
        }

        init();
    }

    public function init() { }

    public function update(dt:Float) { }

    public final function secretUpdate(dt:Float) {
        if (animation != null) {
            texture = animation.updateAnimation();
        }
    }

    public function applyAnimation(animation:Animation) {
        if (this.animation != animation) {
            this.animation = animation;
        }
    }
}