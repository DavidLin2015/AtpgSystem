#ifndef _CORE_CIRCUIT_H_
#define _CORE_CIRCUIT_H_

#include <map>

#include "gate.h"
#include "pattern.h"

namespace CoreNs { 

class Circuit {
public:
		Circuit(); 
        ~Circuit(){}; 

    void Parse(string cir_fname);
    void ConnectGates();
    void Levelize();
    void CalcTestability();
		
    void SetInputsFromPattern(TestPattern* pat);

    int  npi_; 
    int  nppi_; 
    int  npo_; 
    int  nlogic_gate_; 
    int  ntotgate_;

    //vector<Wire*> Wire_List;
    //vector<Gate*> Gate_List;
    Gate**                       gate_list_;

    std::vector<Gate*>           logic_list_;
    std::vector<Gate*>           pi_list_;
    std::vector<Gate*>           po_list_;
    std::vector<Gate*>           ppi_list_;
    std::vector<Gate*>           ppo_list_;
    std::map<std::string, Wire*> wire_map_; 
		
private:
	std::string name_;
}; //Circuit

inline Circuit::Circuit() {
    npi_            = 0;
    nppi_           = 0;
    npo_            = 0;
    nlogic_gate_    = 0;
    ntotgate_       = 0;			
}

}; //CoreNs

#endif //_CORE_CIRCUIT_H_
