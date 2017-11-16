using import "constants.odin";
using import "types.odin";
using import "advance.odin";

oneseq_step :: inline proc(state: ^$T) {
	state^ = state^ * type_constant(T, mults) + type_constant(T, incs);
}
oneseq_advance :: inline proc(state: ^$T, delta: T) {
	state^ = advance_lcg(state^, delta, type_constant(T, mults),
			type_constant(T, incs));
}
mcg_step :: inline proc(state: ^$T) {
	state^ = state^ * type_constant(T, mults);
}
mcg_advance :: inline proc(state: ^$T, delta: T) {
	state^ = advance_lcg(state^, delta, type_constant(T, mults), 0);
}
unique_step :: inline proc(state: ^$T) {
	state^ = state^ * type_constant(T, mults) + T(rawptr(state) | 1);
}
unique_advance :: inline proc(state: $T, delta: T) {
	state^ = advance_lcg(state^, delta, type_constant(T, mults),
			T(rawptr(state) | 1));
}



oneseq_seed :: inline proc(state: ^$T, init: T) {
	state^ = 0;
	oneseq_step(state);
	state^ += init;
	oneseq_step(state);
}
mcg_seed :: inline proc(state: ^$T, init: T) {
	state^ = init | 1;
}
unique_seed :: inline proc(state: ^$T, init: T) {
	state^ = 0;
	unique_step(state);
	state^ += init;
	unique_step(state);
}

