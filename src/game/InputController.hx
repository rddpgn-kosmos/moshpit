package game;

import js.html.MouseEvent;
import js.Browser;
import haxe.Constraints.Function;
import game.EventExecutor;
import utils.Vector;

//Перевести полностью в статик? 
class InputController {

    private var executors:Map<String, EventExecutor>;
    private var mousePosition:Vector;

    public function new() {
        executors = new Map<String, EventExecutor>();
        mousePosition = new Vector();

        Browser.document.body.addEventListener('mousemove', setMousePosition);
    }

    public function update() {
        for(executor in executors) {
            executor.update();
        }
    }

    private function setMousePosition(event:MouseEvent) {
        mousePosition.x = event.pageX;
        mousePosition.y = event.pageY;
    }

    public function getMousePosition() {
        return new Vector(mousePosition.x, mousePosition.y);
    }

    private function addEventCallback(event:String, eventValue:Dynamic, callback:Function):Void {
        var mapKey:String = event + Std.string(eventValue);

        if (executors.exists(mapKey)) {
            executors[mapKey].addCallback(callback);
        } else {
            var executor:EventExecutor = new EventExecutor(event, eventValue);
            executor.addCallback(callback);
            executors[mapKey] = executor;
        }
    }

    public function onKeyDown(key:Int, callback:Function):Void {
        addEventCallback('keydown', key, callback);
    }
    
    public function onKeyUp(key:Int, callback:Function):Void {
        addEventCallback('keyup', key, callback);
    }

    public function onKeyPressed(key:Int, callback:Function):Void {
        addEventCallback('keypressed', key, callback);
    }

    public function onMouseDown(callback:Function):Void {
        addEventCallback('mousedown', null, callback);
    }
    
    public function onMouseUp(callback:Function):Void {
        addEventCallback('mouseup', null, callback);
    }

    public function onMousePressed(callback:Function):Void {
        addEventCallback('mousepressed', null, callback);
    }
}


/*
package game;

import js.html.MouseEvent;
import js.Browser;
import haxe.Constraints.Function;
import game.InputListener;
import game.MouseListener;
import utils.Vector;

//Перевести полностью в статик? 
class InputController {

    private var executors:Map<String, InputListener>;
    private var mouseListener:MouseListener;
    private var mouse2:MouseListener;
    private var mousePosition:Vector;

    public function new() {
        executors = new Map<String, InputListener>();
        mouseListener = new MouseListener('click');
        mouse2 = new MouseListener('mouseup');

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

        if (executors.exists(mapKey)) {
            executors[mapKey].addCallback(callback);
        } else {
            var listener:InputListener = new InputListener(event, key);
            listener.addCallback(callback);
            executors[mapKey] = listener;
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

    public function onMousePressed(callback:Function):Void {
        mouse2.addCallback(callback);
    }
}
*/