package objects.box;

import game.GameObject;

//Вырезать нахуй, всю логику перенести в box

class BoxController {

    private var currentBox:Box;

    public function new() {
        currentBox = new Box();
        currentBox.x = 200;
        currentBox.y = 200;
    }
}