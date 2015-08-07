#ifndef _CMD_CMD_H_ 
#define _CMD_CMD_H_

#include "opt_mgr.h"

namespace CmdNs { 

class Cmd; 

typedef std::map<std::string, std::set<std::string> >   CatMap; 
typedef std::map<std::string, Cmd *>                    CmdMap; 
typedef CatMap::iterator                                CatMapIter; 
typedef CmdMap::iterator                                CmdMapIter; 

class Cmd { 
public: 
                        Cmd(const std::string &name, 
                            const std::string &msg); 
    virtual             ~Cmd(); 

            bool        exec(std::vector<std::string> &args); 
            std::string getName() const; 

    OptMgr              *opt_mgr_; 
protected: 
    virtual bool        run() = 0; 
}; //Cmd

class CmdMgr { 
public: 
            CmdMgr(); 
            ~CmdMgr(); 
 
    enum    Result { EXIT = -1, SUCCESS, FAIL, NOT_EXIST, NOP };

    bool    regCmd(const std::string &cat, Cmd * const cmd); 
    Cmd*    getCmd(const std::string &name) const; 

    Result  exec(const std::string &cmdStr);     

private:  
    CatMap  cat_map_; 
    CmdMap  cmd_map_; 
}; //CmdMgr

inline Cmd::Cmd(const std::string &name, const std::string &msg) { 
    opt_mgr_ = new OptMgr(name, msg); 
}

inline Cmd::~Cmd() { 
    delete opt_mgr_; 
}

inline std::string Cmd::getName() const { 
    return opt_mgr_->getName(); 
}
}; //CmdNs 

#endif //_CMD_CDM_H_ 
