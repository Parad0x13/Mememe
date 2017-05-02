package bg.game.mememe;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.group.FlxGroup;
import bg.game.mememe.menu.MenuState;

// [BUG] It's possible to force the ball through a wall with the paddle
// Possibly make this a feature instead. "Oh no! You lost your bork! FAIL"
class Paddle extends FlxSprite {
	public function new() {
		super();

		loadGraphic(AssetPaths.SuperBorkout_Paddle__png);

		y = FlxG.height - height - 10;
		solid = immovable = true;
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);

		x = FlxG.mouse.x - width / 2;
	}
}

class Ball extends FlxSprite {
	public function new(x = 100, y = 100) {
		super();

		loadGraphic(AssetPaths.TennisBall__png);
		this.x = x;
		this.y = y;

		angularVelocity = FlxG.random.float() * 50 - 150;
		velocity.set(300, 300);
		elasticity = 1;
	}
}

class Block extends FlxSprite {
	public function new(x = 0, y = 0, width = 100, height = 50) {
		super();

		var blockColors = ["0x76C4AE", "0xD3D2B5", "0x9FC2BA", "0xCABD80", "0xBEE9E4", "0xE1CEB1", "0x7CE0F9", "0xDDB0A0", "0xCAECCF", "0xD86C70"];

		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;

		var color = FlxColor.fromString(blockColors[Std.random(blockColors.length)]);
		makeGraphic(width, height, color);
		solid = immovable = true;
	}

	public function bottomLocation():Float {
		return y + height;
	}
}

enum Wall_location {Top;Bottom;Left;Right;}
class Wall extends FlxSprite {
	public var isFloor:Bool = false;

	public function new(location:Wall_location) {
		super();

		var thickness = 10;
		var width = thickness, height = thickness;

		if(location == Bottom)isFloor = true;

		if(location == Top)    width  = FlxG.width;
		if(location == Bottom) width  = FlxG.width;
		if(location == Left)   height = FlxG.height;
		if(location == Right)  height = FlxG.height;

		makeGraphic(width, height, FlxColor.TRANSPARENT);
		solid = immovable = true;

		if(location == Top)    y = -height;
		if(location == Bottom) y = FlxG.height;
		if(location == Left)   x = 0;
		if(location == Right)  x = FlxG.width;
	}
}

class SuperBorkoutState extends FlxState {
	var paddle:Paddle;
	var ball:Ball;		// [TODO] Make this an array so we can have many balls
	var walls:FlxTypedGroup<FlxSprite>;
	var blocks:FlxTypedGroup<FlxSprite>;

	override public function create():Void {
		super.create();
		FlxG.mouse.visible = false;
		FlxG.sound.playMusic(AssetPaths.SuperBorkWorld__ogg);
		FlxG.sound.music.volume = 0.1;

		walls = new FlxTypedGroup<FlxSprite>();

		walls.add(new Wall(Top));
		walls.add(new Wall(Bottom));
		walls.add(new Wall(Left));
		walls.add(new Wall(Right));

		for(wall in walls)add(wall);

		blocks = new FlxTypedGroup<FlxSprite>();

		var slots = 5, layers = 4;
		var blockWidth = Std.int(FlxG.width / slots);
		var blockHeight = Std.int(blockWidth * 0.3);

		var blockBottom:Float = 0;
		for(layer in 0...layers) {
			for(slot in 0...slots) {
				var block = new Block(blockWidth * slot, blockHeight * layer, blockWidth, blockHeight);
				block.bottomLocation();
				blockBottom = Math.max(blockBottom, block.bottomLocation());
				blocks.add(block);
			}
		}

		for(block in blocks)add(block);

		paddle = new Paddle();
		add(paddle);

		ball = new Ball(100, Std.int(blockBottom));
		add(ball);

		var title = new FlxText(0, 0, FlxG.width, "Super Borkout", 64);
		title.setFormat(null, 64, FlxColor.RED, FlxTextAlign.CENTER);
		// [TODO] This is a VERY UGLY way of doing things, find a better way
		// The proper answer SHOULD be to run a dedicated inline block rather than declaring a function
		// However I am unable at the moment to find how to do this with Haxe...
		// Example of block syntax in Obj-C: http://fuckingblocksyntax.com/
		function removeTitle(tween:FlxTween):Void {title.kill();}
		FlxTween.tween(title, {y: -title.height, alpha: 0}, 1, {onComplete: removeTitle, startDelay: 2, ease: FlxEase.cubeOut});
		add(title);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);

		FlxG.collide(ball, blocks, ball_block_overlap);
		FlxG.collide(ball, walls, ball_wall_overlap);
		FlxG.collide(ball, paddle);

		// [TODO] Add win mechanic here
		if(blocks.members.length == 0)
			FlxG.switchState(new MenuState());
	}

	public function ball_block_overlap(ball:Ball, block:Block):Void {
		block.kill();
		blocks.remove(block, true);
	}

	public function ball_wall_overlap(ball:Ball, wall:Wall):Void {
		if(wall.isFloor) {
			// [TODO] Add loss mechanic here
		}
	}
}
