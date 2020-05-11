package game;

import js.lib.Object;
import haxe.Constraints.Function;
import js.Browser;

//Переписать на кейкоды
//Хранить кейкоды в отдельном jsone

class MouseListener {

    private var event:String;
    private var callbacks:Array<Function>;
    private var canUpdate:Bool = false; 

    public function new() {
        callbacks = new Array<Function>();

        Browser.document.body.addEventListener('click', (e) -> handleEvent(e));
    }
    
    //TODO Выяснить, какого типа параметр e. 
    private function handleEvent(e:Dynamic):Void {
        executeCallbacks();
    }

    public function addCallback(callback:Function) {
        callbacks.push(callback);
    }

    private function executeCallbacks() {
        for(callback in callbacks) {
            callback();
        }
    }
}