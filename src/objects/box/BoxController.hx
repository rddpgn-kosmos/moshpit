package objects.box;

import game.GameObject;

class BoxController {

    private var currentBox:Box;

    public function new() {
        currentBox = new Box();
        currentBox.x = 200;
        currentBox.y = 200;
    }
}