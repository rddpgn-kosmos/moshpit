package game;

import pixi.core.Pixi;
import pixi.core.textures.Texture;

class Animation {
    private var imgSource:Array<String>;
    private var textures:Array<Texture>;
    
    private var frames:Int;
    private var imaginaryFrame:Float = 0.0;
    private var currentFrame:Int = 0;

    public var animationSpeed:Float = 1.0;
    public var playType:String = 'normal';

    public function new(imgSource:Array<String>) {
        this.imgSource = imgSource;
        textures = new Array<Texture>();
        convertImgToTexture();

        frames = textures.length;
    }

    private function convertImgToTexture() {
        for(img in imgSource) {
            textures.push(Texture.from(img));
        }
    }

    public function getCurrentFrame() {
        return textures[currentFrame];
    }

    public function setCurrentFrame(frame:Int) {
        imaginaryFrame = frame;
        currentFrame = frame;
    }

    public function updateAnimation() {
        if (playType == 'normal') {
            if (animationSpeed !=0 ) {
                imaginaryFrame += 1 * animationSpeed;
                currentFrame = Math.floor(imaginaryFrame);

                if (currentFrame >= frames) {
                    currentFrame = 0;
                    imaginaryFrame = 0;
                }
            }
        } else if (playType == 'once') {
            if (animationSpeed !=0 ) {
                if (currentFrame < frames - 1) {
                    imaginaryFrame += 1 * animationSpeed;
                    currentFrame = Math.floor(imaginaryFrame);
                }
            }
        }
        return textures[currentFrame];
    }
}