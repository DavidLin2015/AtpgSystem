#ifndef _CORE_GATE_H_
#define _CORE_GATE_H_

#include <vector>
#include <string>
#include "logic.h"
using namespace std;

namespace CoreNs {   

class Wire;
class Fault;

typedef vector<Wire*>   WireVec;  

enum Type { PI = 0,  
            PPI, PO,  PPO,
            AND, OR,  NAND, NOR,
            NOT, BUF, XOR,  XNOR
};

class Gate {
public:
	            Gate();  

    string      name_;
    Type        type_;

	int         lvl_;
		
	int         nfi_; 
    int         nfo_;
    Gate        **fis_;  
    Gate        **fos_;

    ParaValue   gl_; 
    ParaValue   gh_; 
    ParaValue   fl_;  
    ParaValue   fh_;
    Value       val_;
		
	Wire        *out_wire_;
	WireVec     in_wire_list_;

	bool        is_faulted_;
	Fault       *f_;
		
    int         zero_controllability_;
    int         one_controllability_;
    int         obsevability_;

	virtual void CalcControllability()=0;
	virtual void CalcObservability()=0;
	virtual Value GoodEval()=0;
	virtual Value FaultyEval()=0;
		
};

class AND_Gate: public Gate
{
	public:
		AND_Gate(): Gate(){}
		void CalcControllability();
		void CalcObservability();		
		Value GoodEval();
		Value FaultyEval();

};

class OR_Gate: public Gate
{
	public:
		OR_Gate(): Gate(){}
		void CalcControllability();
		void CalcObservability();
		Value GoodEval();
		Value FaultyEval();
};

class NAND_Gate: public Gate
{
	public:
		NAND_Gate(): Gate(){}
		void CalcControllability();
		void CalcObservability();
		Value GoodEval();
		Value FaultyEval();
};

class NOR_Gate: public Gate
{
	public:
		NOR_Gate(): Gate(){}
		void CalcControllability();
		void CalcObservability();
		Value GoodEval();
		Value FaultyEval();
};

class NOT_Gate: public Gate
{
	public:
		NOT_Gate(): Gate(){}
		void CalcControllability();
		void CalcObservability();
		Value GoodEval();
		Value FaultyEval();
};

class BUF_Gate: public Gate
{
	public:
		BUF_Gate(): Gate(){}
		void CalcControllability();
		void CalcObservability();
		Value GoodEval();
		Value FaultyEval();
};

class XOR_Gate: public Gate
{
	public:
		XOR_Gate(): Gate(){}
		void CalcControllability();
		void CalcObservability();
		Value GoodEval();
		Value FaultyEval();
};

class XNOR_Gate: public Gate
{
	public:
		XNOR_Gate(): Gate(){}
		void CalcControllability();
		void CalcObservability();
		Value GoodEval();
		Value FaultyEval();
};

class PIPPI_Gate: public Gate
{
	public:
		PIPPI_Gate(): Gate(){}
		void CalcControllability();
		void CalcObservability();
		Value GoodEval();
		Value FaultyEval();
};

class POPPO_Gate: public Gate
{
	public:
		POPPO_Gate(): Gate(){}
		void CalcControllability();
		void CalcObservability();
		Value GoodEval();
		Value FaultyEval();		
};

/***************Wire***************/
class Wire
{
	public:
		string name_;
		Gate* in_gate_;
		vector<Gate*> out_gate_list_;
};

inline Gate::Gate() {
    name_   = "";
    lvl_    = -1;

    gl_     = 0; 
    gh_     = 0; 
    fl_     = 0; 
    fh_     = 0;
    val_    = 0;

    nfi_    = 0;
    nfo_    = 0;
    fis_    = NULL;
    fos_    = NULL;

    out_wire_               = NULL;

    zero_controllability_   = -1;
    one_controllability_    = -1;
    obsevability_           = -1;

    is_faulted_             = false;
}

}; //CoreNs

#endif // _CORE_GATE_H_
