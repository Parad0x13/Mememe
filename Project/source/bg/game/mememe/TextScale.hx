package bg.game.mememe;

import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.text.FlxText;

import bg.game.mememe.menu.MenuState;

class TextScale extends FlxState {
	var text : FlxText;
	var incXScale : Float = 0.01;
	var screenText : String = "Hello World: ";
	var menu : MenuState;

	override public function create():Void {
		super.create();

		text = new flixel.text.FlxText(0, 0, 0, screenText, 6);
		text.setFormat(null, 64, FlxColor.RED, FlxTextAlign.CENTER);
		add(text);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		text.text = screenText + (new String("" + text.scale.x)).substring(0, 10);

		if(text.scale.x < 2.0 && text.scale.x > 0.1) {
			text.scale.x += incXScale;
			text.text = screenText + (new String("" + text.scale.x)).substring(0, 10);
		} else {
			incXScale *= -1;
			text.scale.x += (2*incXScale);
		}
	}
}
