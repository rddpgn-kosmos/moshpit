package game;

import haxe.Constraints.Function;
import js.Browser;

class EventExecutor {

    private var event:String;
    private var eventField:Dynamic;
    private var eventValue:Dynamic;
    private var compare:Function;

    private var callbacks:Array<Function>;
    private var canUpdate:Bool = false; 
    private var isPressing:Bool = false;


    public function new(event:String, eventValue:Dynamic) {
        this.event = event;
        this.eventValue = eventValue;

        compare = getCompareFunction(event);
        
        callbacks = new Array<Function>();

        if (event.indexOf('pressed') > -1) {
            var ev:String = event.split('pressed')[0];
            Browser.document.body.addEventListener(ev + 'down', (e) -> handlePressing(e, true));
            Browser.document.body.addEventListener(ev + 'up', (e) -> handlePressing(e, false));
        } else {
            Browser.document.body.addEventListener(event, (e) -> handleEvent(e));
        }
    }

    public function update() {
        if (isPressing) {
            executeCallbacks();
        }
    }
    
    private function handleEvent(e:Dynamic):Void {
        if (compare(e, eventValue)) {
            executeCallbacks();
        }        
    }

    private function handlePressing(e:Dynamic, val:Bool):Void {
        if (compare(e, eventValue)) {
            isPressing = val;
        }     
    }

    public function addCallback(callback:Function):Void {
        callbacks.push(callback);
    }

    private function executeCallbacks():Void {
        for(callback in callbacks) {
            callback();
        }
    }

    private function getCompareFunction(event:String):Function {
        var compare:Function;
        var keycodeCompare:Function = function(e, eventValue) {
            return e.keyCode == eventValue;
        };
        var mouseClickCompare:Function = function(e, eventValue) {
            return true;
        };

        if (event.indexOf('key') > -1) {
            compare = keycodeCompare;
        } else if (event.indexOf('mouse') > -1) {
            compare = mouseClickCompare;
        }
        return compare;
    }
}