package game;

import game.Game;
import game.InputController;
import pixi.core.textures.Texture;
import pixi.core.sprites.Sprite;

class GameObject extends Sprite {

    private var input:InputController;

    public function new(spriteUrl:String) {
        super(Texture.from(spriteUrl));
        anchor.set(0.5);
        position.set(0, 0);
        input = Game.getGame().getInputController();
        init();
    }

    public function init() {
        
    }

    public function update(dt:Float) {

    }
}