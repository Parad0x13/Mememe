package bg.game.mememe.states;

class MenuState extends MememeState {
	private var _btnPlay:FlxButton;

	override public function create():Void {
		super.create();

		_btnPlay = new FlxButton(0, 0, "Play", clickPlay);
		_btnPlay.screenCenter();
		add(_btnPlay);
	}

	private function clickPlay():Void {
		FlxG.switchState(new SuperBorkoutState());
	}
}
