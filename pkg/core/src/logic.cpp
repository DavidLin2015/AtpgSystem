#include "logic.h"
/*bool GetBitVal(ParaValue pv, int pos)
{
	ParaValue mask = 1;
	mask <<= pos;
	return pv & mask;
}

void SetBitVal(ParaValue& pv, bool value ,int pos)
{
	ParaValue mask = 1;
	mask <<= pos;
	if(value)
	{
		pv |= mask;
	}
	else
	{
		pv &= ~mask;
	}
}

Value EvalNOT(Value v){
	return NOT_map[v];
}

Value EvalAND2(Value v1, Value v2){
    return AND_map[v1][v2];
}
Value EvalAND3(Value v1, Value v2, Value v3) {
    return EvalAND2( v1, EvalAND2(v2,v3) );
}
Value EvalAND4(Value v1, Value v2, Value v3, Value v4) {
    return EvalAND2( EvalAND2(v1,v2) , EvalAND2(v3,v4) );
}
Value EvalNAND2(Value v1, Value v2) {
    return NAND_map[v1][v2];
}
Value EvalNAND3(Value v1, Value v2, Value v3) {
    return EvalNOT( EvalAND3(v1,v2,v3) );
}
Value EvalNAND4(Value v1, Value v2, Value v3, Value v4) {
    return EvalNOT( EvalAND4(v1,v2,v3,v4) );
}
Value EvalOR2(Value v1, Value v2) {
    return OR_map[v1][v2];
}
Value EvalOR3(Value v1, Value v2, Value v3) {
    return EvalOR2( v1 , EvalOR2(v2,v3) );
}
Value EvalOR4(Value v1, Value v2, Value v3, Value v4) {
    return EvalOR2( EvalOR2(v1,v2) , EvalOR2(v3,v4) );
}
Value EvalNOR2(Value v1, Value v2) {
    return NOR_map[v1][v2];
}
Value EvalNOR3(Value v1, Value v2, Value v3) {
    return EvalNOT( EvalOR3(v1,v2,v3) );
}
Value EvalNOR4(Value v1, Value v2, Value v3, Value v4) {
    return EvalNOT( EvalOR4(v1,v2,v3,v4) );
}
Value EvalXOR2(Value v1, Value v2) {
    return XOR_map[v1][v2];
}
Value EvalXOR3(Value v1, Value v2, Value v3) {
    return EvalXOR2( v1 , EvalXOR2(v2,v3) );
}
Value EvalXNOR2(Value v1, Value v2) {
    return XNOR_map[v1][v2];
}
Value EvalXNOR3(Value v1, Value v2, Value v3) {
   return EvalNOT( EvalXOR3(v1,v2,v3) );
}*/

