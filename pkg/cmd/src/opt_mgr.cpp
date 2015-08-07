#include <opt_mgr.h> 

using namespace std; 
using namespace TCLAP; 

using namespace CmdNs; 

bool OptMgr::regArg(const string    &name, 
                    const string    &desc, 
                    const string    &type_desc, 
                    const string    &flag, 
                    bool            is_req, 
                    bool            is_multi) { 

    if(name_set_.find(name)==name_set_.end()) { 
        //Arg *arg; 
        if(flag.empty()) { 
            if(!is_multi) { 
                ValueArg<string> *arg; 
                arg = new UnlabeledValueArg<string> (name, 
                                                     desc, 
                                                     is_req, 
                                                     "", 
                                                     type_desc); 
                
                opt_->add(arg); 
                arg_map_[name] = arg; 
            }
            else { 
                MultiArg<string> *arg; 
                arg = new UnlabeledMultiArg<string> (name, 
                                                     desc, 
                                                     is_req, 
                                                     type_desc); 
                opt_->add(arg); 
                multi_map_[name] = arg; 
            }
        }
        else { 
            if(flag_set_.find(flag)==flag_set_.end()) { 
                flag_set_.insert(flag); 
            }
            else return false; 
            if(!is_multi) { 
                ValueArg<string> *arg; 
                arg = new ValueArg<string> (flag,
                                            name, 
                                            desc, 
                                            is_req, 
                                            "", 
                                            type_desc); 
                opt_->add(arg); 
                arg_map_[name] = arg; 
            } 
            else {
                MultiArg<string> *arg;  
                arg = new MultiArg<string> (flag,
                                            name, 
                                            desc, 
                                            is_req, 
                                            type_desc); 
                opt_->add(arg); 
                multi_map_[name] = arg; 
            }
        }
        name_set_.insert(name); 
        return true; 
    } 
    else return false; 
} 


bool OptMgr::regOpt(const string    &name, 
                    const string    &desc, 
                    bool            val, 
                    const string    &flag) { 

    if(name_set_.find(name)==name_set_.end()) { 
        string f = (flag=="")?name.substr(1):flag; 
        if(flag_set_.find(f)==flag_set_.end()) { 
            SwitchArg *arg = new SwitchArg(f, name, desc, val); 
            opt_->add(arg); 

            flag_set_.insert(f); 
            name_set_.insert(name); 
            opt_map_[name] = arg; 

            return true; 
        } 
        else return false; 
    } 
    else return false; 
}


void OptMgr::parse(vector<string> &args) {
    opt_->parse(args); 
} 

string OptMgr::getVal(const string &name) const { 
    ArgMap::const_iterator it = arg_map_.find(name); 
    if(it!=arg_map_.end()) { 
        return it->second->getValue(); 
    }
    else { 
        //TODO
        return ""; 
    }
}
 
const vector<string>* OptMgr::getMultiVal(const string &name) const {  
    MultiMap::const_iterator it = multi_map_.find(name); 
    if(it!=multi_map_.end()) { 
        return &(it->second->getValue()); 
    }
    else { 
        //TODO
        return NULL; 
    }

}

bool OptMgr::getOptVal(const string &name) const {
    OptMap::const_iterator it = opt_map_.find(name); 
    if(it!=opt_map_.end()) { 
        return it->second->getValue(); 
    }
    else { 
        //TODO
        return false; 
    }

} 
