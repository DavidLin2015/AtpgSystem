#include "setup_cmd.h" 

using namespace std; 
using namespace CoreNs; 
using namespace CmdNs; 
using namespace AtpgNs; 

int main(int argc, char **argv) { 
    
    AtpgMgr mgr; 
    ReadNetlistCmd cmdRdNl("atpg", "read gate-level netlist file", &mgr); 
    ReportGateCmd  cmdRptG("report_gate", "report gate(s) infomation", &mgr); 
    AddFaultCmd    cmdAddF("add_fault", "add target fault(s)", &mgr); 

    vector<string> argsRptG; 
    vector<string> argsRdNl; 
    vector<string> argsAddF; 

    for(int i=0; i<argc; i++) 
        argsRdNl.push_back(string(argv[i])); 
    argsRptG.push_back(string("report_gate")); 
    argsAddF.push_back(string("add_fault")); 
    argsAddF.push_back(string("--all")); 

    cmdRdNl.exec(argsRdNl); 
    cmdRptG.exec(argsRptG);  
    cmdAddF.exec(argsAddF); 

    return 0; 
}
