#ifndef _LOGIC_H_
#define _LOGIC_H_

#include <utility>
#include <cstdio>


typedef unsigned char  Value;
typedef unsigned long  ParaValue;
typedef std::pair<ParaValue, ParaValue> ParaValPair;

const Value L = 0;
const Value H =	1;
const Value X = 2;
const Value D = 3;
const Value B =	4;

const ParaValue PARA_L  = 0;
const ParaValue PARA_H = ~PARA_L;
const size_t BYTE_SIZE = 8;
const size_t WORD_SIZE = sizeof(ParaValue) * BYTE_SIZE;

const Value NOT_map[5] ={H,L,X,B,D};

const Value AND_map[5][5] = {
        {L,L,L,L,L},
        {L,H,X,D,B},
        {L,X,X,X,X},
        {L,D,X,D,L},
        {L,B,X,L,B}
    };

const Value OR_map[5][5] = {
        {L,H,X,D,B},
        {H,H,H,H,H},
        {X,H,X,X,X},
        {D,H,X,D,H},
        {B,H,X,H,B}
    };

const Value XOR_map[5][5] ={
        {L,H,X,D,B},
        {H,L,X,B,D},
        {X,X,X,X,X},
        {D,B,X,L,H},
        {B,D,X,H,L}
    };
	
const Value NAND_map[5][5] = {
        {H,H,H,H,H},
        {H,L,X,B,D},
        {H,X,X,X,X},
        {H,B,X,B,H},
        {H,D,X,H,D}
    };

const Value NOR_map[5][5] = {
        {H,L,X,B,D},
        {L,L,L,L,L},
        {X,L,X,X,X},
        {B,L,X,B,L},
        {D,L,X,L,D}
    };

const Value XNOR_map[5][5] ={
        {H,L,X,B,D},
        {L,H,X,D,B},
        {X,X,X,X,X},
        {B,D,X,H,L},
        {D,B,X,L,H}
    };


inline bool GetBitVal(ParaValue pv, int pos)
{
	ParaValue mask = 1;
	mask <<= pos;
	return pv & mask;
}

inline void SetBitVal(ParaValue& pv, bool value ,int pos)
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
inline Value EvalNOT(Value v){
	return NOT_map[v];
}

inline Value EvalAND2(Value v1, Value v2){
    return AND_map[v1][v2];
}
inline Value EvalAND3(Value v1, Value v2, Value v3) {
    return EvalAND2( v1, EvalAND2(v2,v3) );
}
inline Value EvalAND4(Value v1, Value v2, Value v3, Value v4) {
    return EvalAND2( EvalAND2(v1,v2) , EvalAND2(v3,v4) );
}
inline Value EvalNAND2(Value v1, Value v2) {
    return NAND_map[v1][v2];
}
inline Value EvalNAND3(Value v1, Value v2, Value v3) {
    return EvalNOT( EvalAND3(v1,v2,v3) );
}
inline Value EvalNAND4(Value v1, Value v2, Value v3, Value v4) {
    return EvalNOT( EvalAND4(v1,v2,v3,v4) );
}
inline Value EvalOR2(Value v1, Value v2) {
    return OR_map[v1][v2];
}
inline Value EvalOR3(Value v1, Value v2, Value v3) {
    return EvalOR2( v1 , EvalOR2(v2,v3) );
}
inline Value EvalOR4(Value v1, Value v2, Value v3, Value v4) {
    return EvalOR2( EvalOR2(v1,v2) , EvalOR2(v3,v4) );
}
inline Value EvalNOR2(Value v1, Value v2) {
    return NOR_map[v1][v2];
}
inline Value EvalNOR3(Value v1, Value v2, Value v3) {
    return EvalNOT( EvalOR3(v1,v2,v3) );
}
inline Value EvalNOR4(Value v1, Value v2, Value v3, Value v4) {
    return EvalNOT( EvalOR4(v1,v2,v3,v4) );
}
inline Value EvalXOR2(Value v1, Value v2) {
    return XOR_map[v1][v2];
}
inline Value EvalXOR3(Value v1, Value v2, Value v3) {
    return EvalXOR2( v1 , EvalXOR2(v2,v3) );
}
inline Value EvalXNOR2(Value v1, Value v2) {
    return XNOR_map[v1][v2];
}
inline Value EvalXNOR3(Value v1, Value v2, Value v3) {
   return EvalNOT( EvalXOR3(v1,v2,v3) );
}
#endif

