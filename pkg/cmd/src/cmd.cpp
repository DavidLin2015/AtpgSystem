#include "cmd.h" 

using namespace std; 
using namespace TCLAP; 

using namespace CmdNs;  

bool Cmd::exec(vector<string> &args) { 
    try { 
        opt_mgr_->parse(args); 
        return run(); 
    }
    catch (ArgException &e) { 
        //TODO
        return false;  
    }
}
