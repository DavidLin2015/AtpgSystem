#ifndef _CMD_OPT_MGR_H_
#define _CMD_OPT_MGR_H_ 

#include <map> 
#include <set>

#include "tclap/CmdLine.h"

namespace CmdNs { 

typedef std::map<std::string, TCLAP::ValueArg<std::string>*>    ArgMap; 
typedef std::map<std::string, TCLAP::MultiArg<std::string>*>    MultiMap; 
typedef std::map<std::string, TCLAP::SwitchArg*>                OptMap; 

typedef std::set<std::string>                       NameSet; 

typedef ArgMap::iterator                            ArgMapIter; 
typedef MultiMap::iterator                          MultiMapIter; 
typedef OptMap::iterator                            OptMapIter; 

class OptMgr {
public: 
    //enum            Type { SWITCH = 0, VAL, UNLABEL };
 
                    OptMgr(const std::string &name, 
                           const std::string &msg); 
                    ~OptMgr(); 

    std::string     getName() const; 
    void            setName(const std::string &name); 
    std::string     getMsg() const; 

    std::string                    getVal(const std::string &name) const; 
    const std::vector<std::string> *getMultiVal(const std::string &name) const; 
    bool                           getOptVal(const std::string &name) const; 

    bool            regArg(const std::string    &name, 
                           const std::string    &desc, 
                           const std::string    &type_desc, 
                           const std::string    &flag = "", 
                           bool                 is_req = false, 
                           bool                 is_multi = false); 

    bool            regOpt(const std::string    &name, 
                           const std::string    &desc, 
                           bool                 val = false, 
                           const std::string    &flag = ""); 
    void            parse(std::vector<std::string> &args); 

private: 
    std::string     name_; 

    TCLAP::CmdLine  *opt_; 
    ArgMap          arg_map_; 
    MultiMap        multi_map_; 
    OptMap          opt_map_; 
    
    NameSet         name_set_; 
    NameSet         flag_set_;  
}; //OptMgr

inline OptMgr::OptMgr(const std::string &name, 
                      const std::string &msg) { 
    name_ = name; 
    opt_ = new TCLAP::CmdLine(msg); 
}

inline OptMgr::~OptMgr() { 
    delete opt_; 
}

inline std::string OptMgr::getName() const { 
    return name_; 
}

inline void OptMgr::setName(const std::string &name) { 
    name_ = name; 
}

inline std::string OptMgr::getMsg() const { 
    return opt_->getMessage(); 
}

}; //CmdNs

#endif //_CMD_OPT_MGR_H_
