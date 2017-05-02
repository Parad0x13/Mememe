package bg.game.mememe;

import flixel.FlxGame;
import openfl.display.Sprite;
import bg.game.mememe.menu.MenuState;

class Main extends Sprite {
	public function new() {
		super();
		addChild(new FlxGame(0, 0, MenuState));
	}
}
