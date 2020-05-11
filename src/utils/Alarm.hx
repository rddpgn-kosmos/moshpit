package utils;

import haxe.Constraints.Function;
import haxe.Timer;

class Alarm {
    private var timer:Timer;

    public function new(duration:Int, callback:Function) {
        timer = haxe.Timer.delay(function() {
            callback();
            timer.stop();
        }, duration);
    }
}