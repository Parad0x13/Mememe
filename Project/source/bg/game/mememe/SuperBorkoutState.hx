package bg.game.mememe;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class Paddle extends FlxSprite {
	override public function update(elapsed:Float):Void {
		super.update(elapsed);

		this.x = FlxG.mouse.x;
		this.y = 200;
	}
}

class SuperBorkoutState extends FlxState {
	var title:FlxText;
	var paddle:Paddle;

	override public function create():Void {
		super.create();

		FlxG.mouse.visible = false;		// [WARNING] Find a way to ensure the mouse reappears when moving to a different FlxState

		title = new FlxText(0, 0, FlxG.width, "Super Borkout", 64);
		title.setFormat(null, 64, FlxColor.RED, FlxTextAlign.CENTER);
		add(title);

		// Temporarily disabled so I don't lose my mind working on the game
		//FlxG.sound.playMusic(AssetPaths.SuperBorkWorld__ogg);
		//FlxG.sound.music.volume = 0.1;

		paddle = new Paddle(AssetPaths.SuperBorkout_Paddle__png);
		add(paddle);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}
