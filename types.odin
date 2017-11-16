/*State_8 :: struct {
	MULT :: 141, // assocciating data with struct/type/whatever?
	state: u8,
}*/


State_Setseq_8 :: struct #ordered {
	state, inc: u8,
};
State_Setseq_16 :: struct #ordered {
	state, inc: u16,
};
State_Setseq_32 :: struct #ordered {
	state, inc: u32,
};
State_Setseq_64 :: struct #ordered {
	state, inc: u64,
};
State_Setseq_128 :: struct #ordered {
	state, inc: u128,
};

