#ifndef _CORE_FAULT_H_
#define _CORE_FAULT_H_

#include <vector>

#include "logic.h"

namespace CoreNs { 

class Gate; 
class Circuit; 
class Fault; 

typedef std::vector<Fault*> FaultVec; 

class Fault { 
public:
                    Fault(Gate *g, 
                          int f_pid, 
                          Value faulty_value); 

                    ~Fault(); 

	CoreNs::Gate*   faulty_gate_;
	Value           faulty_value_;
    int             f_pid_;
    bool            is_dropped_;
}; //Fault

class FaultMgr { 
public: 
                    ~FaultMgr(); 

	void            AddFault(Circuit *cir);
private: 
    FaultVec        faults_; 
}; 

inline Fault::Fault(CoreNs::Gate* g, 
                    int f_pid, 
                    Value faulty_value) {

	faulty_gate_    = g;
	f_pid_          = f_pid;
    faulty_value_   = faulty_value;

    is_dropped_     = false;
}

inline FaultMgr::~FaultMgr() { 
    for(int i=0; i<faults_.size(); i++) 
        delete faults_[i]; 
}

};  //CoreNs

#endif //_CORE_FAULT_H_
