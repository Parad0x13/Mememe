import h2d.Text;
import hxd.Res;
import hxd.res.Font;

import js.Lib;

import hxd.App;
class Main extends App {
	var text : Text;

	override function init() {
		Res.initEmbed();
		var font = Res.ComicSans.build(256);
		text = new Text(font, s2d);
		text.text = "Hello World";
		text.textColor = 0xFF0000;
	}

	override function update(dt: Float) {
		var scaleAmount = 0.01;
		if (text.scaleX < 3.0) {
			text.setScale(text.scaleX + scaleAmount);
		}
		else {
			text.setScale(1.0);
		}
	}

	static function main() {
		new Main();
	}
}