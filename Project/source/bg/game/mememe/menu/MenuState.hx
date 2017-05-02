package bg.game.mememe.menu;

import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.FlxState;

class MenuState extends FlxState {
	private var _btnPlay:FlxButton;

	override public function create():Void {
		super.create();
		FlxG.mouse.visible = true;
		if(FlxG.sound.music != null)FlxG.sound.music.pause();

		_btnPlay = new FlxButton(0, 0, "Play", clickPlay);
		_btnPlay.screenCenter();
		add(_btnPlay);
	}

	private function clickPlay():Void {
		FlxG.switchState(new SuperBorkoutState());
	}
}
