package game;

import js.lib.Object;
import haxe.Constraints.Function;
import js.Browser;

//Переписать на кейкоды
//Хранить кейкоды в отдельном jsone

class InputListener {

    private var event:String;
    private var keyMapping:Int;
    private var callbacks:Array<Function>;
    private var canUpdate:Bool = false; 

    public function new(event:String, keyMapping:Int) {
        this.event = event;
        this.keyMapping = keyMapping;
        callbacks = new Array<Function>();

        Browser.document.body.addEventListener(event, (e) -> handleEvent(e));
    }
    
    //TODO Выяснить, какого типа параметр e. 
    private function handleEvent(e:Dynamic):Void {
        if (keyMapping != null) {
            if (compareEvent(e, keyMapping)) {
                executeCallbacks();
            }
        } else {
            executeCallbacks();
        }        
    }

    public function addCallback(callback:Function) {
        callbacks.push(callback);
    }

    private function executeCallbacks() {
        for(callback in callbacks) {
            callback();
        }
    }
    //TODO Выяснить, какого типа параметр e
    private function compareEvent(e:Dynamic, key:Int):Bool {
        return e.keyCode == key;
    }
}