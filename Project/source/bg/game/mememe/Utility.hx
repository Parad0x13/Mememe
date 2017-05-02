package bg.game.mememe;

class ArrayUtils {
	public static inline function last<T>(a:Array<T>):T {
		return a[a.length - 1];
	}

	public static inline function random<T>(a:Array<T>):T {
		return a[Std.random(a.length)];
	}
}