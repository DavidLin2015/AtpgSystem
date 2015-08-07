#include"fault.h"
#include "circuit.h"

using namespace std;

using namespace CoreNs; 

void FaultMgr::AddFault(Circuit *cir) {
    for(int i=0; i<cir->ntotgate_; ++i) {
        Gate* g = cir-> gate_list_[i];
        for(int j=0; j<=g-> nfi_; ++j) {
            faults_.push_back(new Fault(g, j, D));
            faults_.push_back(new Fault(g, j, B));
        }
    }
}
