import h2d.Bitmap;
import h2d.Sprite;
import h2d.Text;
import h2d.Tile;
import hxd.App;
import hxd.Res;
import hxd.res.Font;
import hxd.res.Image;

import js.Lib;

class Utility {
	public static function dynamicallyScaleToWidth(input: Sprite, newWidth: Float) {
		var widthRatio = newWidth / input.getSize().width;
		input.setScale(widthRatio);
	}

	public static function generateBitmap(image: Image, ?width: Float) {
		trace(width);
	}
}

class Main extends App {
	override function init() {
		Res.initEmbed();

		var logo = Res.wizard.toTile();
		var bitmap = new Bitmap(logo, s2d);
		Utility.dynamicallyScaleToWidth(bitmap, 200);

		//var test = Utility.generateBitmap(Res.wizard, 20);
	}

	override function update(dt: Float) {
		//
	}

	static function main() {
		new Main();
	}
}