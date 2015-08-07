#ifndef _CORE_SIMULATOR_H_
#define _CORE_SIMULATOR_H_

#include <queue>

#include "fault.h"
#include "circuit.h"

namespace CoreNs { 

class Simulator {
public:
            Simulator(Circuit *cir) {
		        cir_ = cir;
            }
    void    EventDrivenSim();
    void    AddEvent(Gate* g);
private:
    Circuit             *cir_;
    std::queue<Gate*>   event_queue_;
}; //Simulator

} //CoreNs

#endif // _CORE_SIMULATOR_H_
