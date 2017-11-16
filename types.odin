Pcg_State :: struct(Type: type) {
	state: Type,
};
Oneseq :: Pcg_State;
Mcg :: Pcg_State;
Unique :: Pcg_State;
Setseq :: struct(Type: type) #ordered {
	using _state: Pcg_State(Type),
	inc: Type,
};
State :: struct(State_Type: type) #ordered {
	using __state: State_Type,
}
