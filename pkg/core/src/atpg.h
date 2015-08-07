#ifndef _CORE_ATPG_H_
#define _CORE_ATPG_H_

#include "simulator.h"

using namespace CoreNs; 

class Atpg {
public:
	Circuit             *cir_;
	Simulator           *sim_;
};

#endif // _CORE_ATPG_H_
