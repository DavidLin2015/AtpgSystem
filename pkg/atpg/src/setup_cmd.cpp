#include "core/src/circuit.h" 

#include "setup_cmd.h" 

using namespace std; 
using namespace TCLAP; 

using namespace CoreNs; 
using namespace CmdNs; 
using namespace AtpgNs; 


ReadNetlistCmd::ReadNetlistCmd(const string &name, 
                               const string &msg, 
                               AtpgMgr *atpg_mgr) : Cmd(name, msg) { 

    atpg_mgr_ = atpg_mgr; 
    try { 
        opt_mgr_->regArg("nl_file", 
                         "verilog gate-level netlist file", 
                         "netlsit_file", 
                         "", 
                         true); 
    }
    catch (ArgException &e) { 
        //TODO
        exit(1); 
    }
} 

ReadNetlistCmd::~ReadNetlistCmd() {}
bool ReadNetlistCmd::run() { 
    string nl_fname = opt_mgr_->getVal("nl_file"); 
    if(!atpg_mgr_->cir_) 
        delete atpg_mgr_->cir_; 

    atpg_mgr_->cir_ = new Circuit; 
    atpg_mgr_->cir_->Parse(nl_fname); 
    atpg_mgr_->cir_->ConnectGates(); 
    atpg_mgr_->cir_->Levelize(); 

    //TODO
    return true; 
}


ReportGateCmd::ReportGateCmd(const string &name, 
                             const string &msg, 
                             AtpgMgr *atpg_mgr) : Cmd(name, msg) {
    atpg_mgr_ = atpg_mgr; 
    try { 
        opt_mgr_->regArg("gate", 
                         "gate(s) to be reported", 
                         "gate(s)", 
                         "", 
                         false, 
                         true); 
    } 
    catch (ArgException &e) { 
        //TODO
        exit(1); 
    }
}

ReportGateCmd::~ReportGateCmd() {} 
bool ReportGateCmd::run() { 
    if(!atpg_mgr_->cir_) { 
        //TODO
        return false; 
    } 
    
    //TODO: specified gates 
    reportGate(); 
    return true; 
}

void ReportGateCmd::reportGate() const { 
    for(int n=0; n<atpg_mgr_->cir_->ntotgate_; n++) { 
        Gate *g = atpg_mgr_->cir_->gate_list_[n]; 
        cout << " " << g->name_; 
        cout << " id (" << n << ")"; 
        cout << " lvl(" << g->lvl_ << ")"; 
        cout << " typ(" << g->type_ << ")\n"; 
        cout << "    fi[" << g->nfi_ << "] "; 
        for(int ni=0; ni<g->nfi_; ni++) 
            cout << g->fis_[ni]->name_ << " "; 
        cout << endl; 
        cout << "    fo[" << g->nfo_ << "] "; 
        for(int no=0; no<g->nfo_; no++) 
            cout << g->fos_[no]->name_ << " "; 
        cout << endl << endl; 
    } 
}


AddFaultCmd::AddFaultCmd(const string &name, 
                         const string &msg, 
                         AtpgMgr *atpg_mgr) : Cmd(name, msg) { 
    
    atpg_mgr_ = atpg_mgr; 
    try { 
        opt_mgr_->regOpt("all", 
                         "add all faults as targeted", 
                         false, 
                         "a"); 
        //TODO
    } 
    catch (ArgException &e) { 
        //TODO
        exit(1); 
    }
}

AddFaultCmd::~AddFaultCmd() {}  
bool AddFaultCmd::run() {
    if(!atpg_mgr_->cir_) { 
        //TODO
        return false; 
    }

    if(!atpg_mgr_->f_mgr_)  
        atpg_mgr_->f_mgr_ = new FaultMgr; 

    if(opt_mgr_->getOptVal("all")) { 
        atpg_mgr_->f_mgr_->AddFault(atpg_mgr_->cir_); 
        return true; 
    }
    
    //TODO

    return false; 
}  
