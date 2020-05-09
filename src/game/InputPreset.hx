package game;

import haxe.Constraints.Function;
import game.InputController;
import game.Game;

class InputPreset {
    public var test:String = 'Тест контекста';
    private var presetTemplate:Map<String, String>;
    private var preset:Map<String, Bool>;

    private var inputController:InputController;

    public function new() {
        inputController = Game.getGame().getInputController();
        init();
    }
    private function init():Void {

    }
    private function onKeyDown(key:String, callback:Function):Void {
        inputController.addInputCallback('keydown', key, callback);
    }
    private function onKeyUp(key:String, callback:Function):Void {
        inputController.addInputCallback('keyup', key, callback);
    }
    private function bindPreset(presetTemplate:Map<String, String>):Map<String, Bool> {
        var preset:Map<String, Bool> = new Map<String, Bool>();
        for (key in presetTemplate.keys()) {
            preset[key] = false;
            onKeyDown(presetTemplate[key], function() {
                preset[key] = true;
                trace(test);
            });
            onKeyUp(presetTemplate[key], function() {
                preset[key] = false;
                trace(test);
            });
        }
        return preset;
    }
}