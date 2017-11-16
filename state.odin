using import "constants.odin";
using import "types.odin";

step :: inline proc(state: ^$T/State($E)) {
	state^ = state^ * type_constant(E, mults)
			+ inc_of(state);
}
advance :: inline proc(state: ^$T/State($E), delta: E) {
	state.state = advance_lcg(state.state, delta,
			type_constant(E, mults),
			inc_of(state));
}
seed :: inline proc(state: ^State(Mcg($E)), init: E) {
	state.state = init | 1;
}
seed :: inline proc(state: ^State(Setseq($E)), init, seq: E) {
	state.state = 0;
	state.inc = (seq << 1) | 1;
	step(state);
	state.state += init;
	step(state);
}
seed :: inline proc(state: ^$T/State($E), init: E) {
	state.state = 0;
	step(state);
	state.state += init;
	step(state);
}


advance_lcg :: proc(state, delta, cur_mult, cur_plus: $T) {
	acc_mult, acc_plus: T = 1, 0;
	for delta > 0 {
		if delta & 1 != 0 {
			acc_mult *= cur_mult;
			acc_plus = acc_plus * cur_mult + cur_plus;
		}
		cur_plus = (cur_mult + 1) * cur_plus;
		cur_mult *= cur_mult;
		delta /= 2;
	}
	return acc_mult * state^ + acc_plus;
}
