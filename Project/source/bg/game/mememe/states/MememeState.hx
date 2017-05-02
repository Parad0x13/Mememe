package bg.game.mememe.states;

class MememeState extends FlxState {
	override public function create():Void {
		super.create();

		manageMouse();
		manageMusic();
	}

	public function manageMouse(visible = true) {
		FlxG.mouse.visible = visible;
	}

	public function manageMusic(song:String = null, volume:Float = 1.0) {
		if(FlxG.sound.music != null)
			FlxG.sound.music.pause();

		if(song != null)
			FlxG.sound.playMusic(song, volume);
	}
}