package unit;

class TestVoid extends Test {
	function testVoidLiteral() {
		var v = Void;
		HelperMacros.typedAs(v, (null : Void));
		eq(Void, v);
	}

	function testVoidReturn() {
		var v = voidReturn();
		HelperMacros.typedAs(v, (null : Void));
		eq(Void, v);
	}

	function testExplicitVoidReturn() {
		var v = explicitVoidReturn();
		HelperMacros.typedAs(v, (null : Void));
		eq(Void, v);
	}

	function testVoidArg() {
		var v = voidArg(Void);
		HelperMacros.typedAs(v, (null : Void));
		eq(Void, v);
	}

	function testGeneric() {
		var v = generic(Void);
		HelperMacros.typedAs(v, (null : Void));
		eq(Void, v);
	}

	function testGenericCallback() {
		var v = genericCallback(voidReturn);
		HelperMacros.typedAs(v, (null : Void));
		eq(Void, v);
	}

	function testGenericClass() {
		var v = new Signal<Void>().trigger(Void);
		HelperMacros.typedAs(v, (null : Void));
		eq(Void, v);
	}

	function testField() {
		var c = new C();
		eq(Void, c.field);
		c.field = Void;
		eq(Void, c.field);
	}

	function testStructField() {
		var c = {field: Void}
		eq(Void, c.field);
		c.field = Void;
		eq(Void, c.field);

		var c:{field:Void} = {field: Void}
		eq(Void, c.field);
		c.field = Void;
		eq(Void, c.field);
	}
}

@:pure(false)
private function voidReturn() {}

@:pure(false)
private function explicitVoidReturn() {
	return Void;
}

@:pure(false)
private function generic<T>(v:T):T {
	return v;
}

@:pure(false)
private function genericCallback<T>(f:()->T):T {
	return f();
}

@:pure(false)
private function voidArg(arg:Void):Void {
	return arg;
}

private class Signal<T> {
	public function new() {}
	@:pure(false)
	public function trigger(payload:T):T {
		return payload;
	}
}

private class C {
	public var field:Void;
	public function new() {}
}