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
