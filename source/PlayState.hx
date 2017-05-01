package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState {
	var text:FlxText;

	override public function create():Void {
		super.create();

		text = new FlxText(0, 0, FlxG.width, "Hello World", 64);
		text.setFormat(null, 64, FlxColor.RED, FlxTextAlign.CENTER);
		add(text);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}
