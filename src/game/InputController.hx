package game;

import js.html.MouseEvent;
import js.Browser;
import haxe.Constraints.Function;
import game.InputListener;
import game.MouseListener;
import utils.Vector;

//Перевести полностью в статик? 
class InputController {

    private var listeners:Map<String, InputListener>;
    private var mouseListener:MouseListener;
    private var mousePosition:Vector;

    public function new() {
        listeners = new Map<String, InputListener>();
        mouseListener = new MouseListener();
        mousePosition = new Vector();

        Browser.document.body.addEventListener('mousemove', setMousePosition);
    }

    private function setMousePosition(event:MouseEvent) {
        mousePosition.x = event.pageX;
        mousePosition.y = event.pageY;
    }

    public function getMousePosition() {
        return new Vector(mousePosition.x, mousePosition.y);
    }

    private function addInputCallback(event:String, key:Int, callback:Function):Void {
        var mapKey:String = event + Std.string(key);

        if (listeners.exists(mapKey)) {
            listeners[mapKey].addCallback(callback);
        } else {
            var listener:InputListener = new InputListener(event, key);
            listener.addCallback(callback);
            listeners[mapKey] = listener;
        }
    }

    private function addMouseCallback(callback:Function):Void {
      mouseListener.addCallback(callback);
    }

    //Когда просто нажали кнопку
    public function onKeyDown(key:Int, callback:Function):Void {
        addInputCallback('keydown', key, callback);
    }
    
    //Когда кнопку отпустили
    public function onKeyUp(key:Int, callback:Function):Void {
        addInputCallback('keyup', key, callback);
    }

    //Когда кнопку нажали и держат
    public function onKeyPressed(key:Int, callbackDown:Function, ?callbackUp:Function):Void {
        onKeyDown(key, callbackDown);

        if (callbackUp != null) {
            onKeyUp(key, callbackUp);
        }
    }

    public function onMouseClick(callback:Function):Void {
        addMouseCallback(callback);
    }
}