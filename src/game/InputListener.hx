package game;

import js.lib.Object;
import haxe.Constraints.Function;
import js.Browser;

class InputListener {

    private var event:String;
    private var keyMapping:String;
    private var callbacks:Array<Function>;
    private var canUpdate:Bool = false; 

    public function new(event:String, keyMapping:String) {
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
    private function compareEvent(e:Dynamic, key:String):Bool {
        return e.key == key;
    }
}