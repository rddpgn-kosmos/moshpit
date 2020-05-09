package game;

import haxe.Constraints.Function;
import game.InputListener;
import utils.Vector;

class InputController {

    private var listeners:Map<String, InputListener>;
    private var mousePosition:Vector;

    public function new() {
        listeners = new Map<String, InputListener>();
        mousePosition = new Vector();
    }

    public function addInputCallback(event:String, key:String, callback:Function):Void {
        var mapKey:String = event + key;

        if (listeners.exists(mapKey)) {
            listeners[mapKey].addCallback(callback);
        } else {
            var listener:InputListener = new InputListener(event, key);
            listener.addCallback(callback);
            listeners[mapKey] = listener;
        }
    }
    public function onKeyDown(key:String, callback:Function):Void {
        addInputCallback('keydown', key, callback);
    }
    public function onKeyUp(key:String, callback:Function):Void {
        addInputCallback('keyup', key, callback);
    }
    public function onKeyPressed(key:String, callbackDown:Function, callbackUp:Function):Void {
        onKeyDown(key, callbackDown);
        onKeyUp(key, callbackUp);
    }
}