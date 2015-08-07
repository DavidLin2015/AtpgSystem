#ifndef _ATPG_SETUP_CMD_H_ 
#define _ATPG_SETUP_CMD_H_ 

#include "cmd/src/cmd.h"

#include "core/src/atpg_mgr.h"

namespace AtpgNs { 
class ReadNetlistCmd : public CmdNs::Cmd { 
public: 
            ReadNetlistCmd(const std::string &name, 
                           const std::string &msg, 
                           CoreNs::AtpgMgr *atpg_mgr); 
            ~ReadNetlistCmd(); 
private: 
    bool    run();  

    CoreNs::AtpgMgr *atpg_mgr_; 
}; //ReadNetlsitCmd

class ReportCircuitCmd : public CmdNs::Cmd { 
public: 
            ReportCircuitCmd(const std::string &name, 
                             const std::string &msg, 
                             CoreNs::AtpgMgr *atpg_mgr); 
            ~ReportCircuitCmd(); 
private: 
    bool    run();  

    CoreNs::AtpgMgr *atpg_mgr_; 
}; //ReportCircuitCmd

class ReportGateCmd : public CmdNs::Cmd { 
public: 
            ReportGateCmd(const std::string &name, 
                          const std::string &msg, 
                          CoreNs::AtpgMgr *atpg_mgr); 
            ~ReportGateCmd(); 
private: 
    bool    run();  

    void    reportGate() const; 

    CoreNs::AtpgMgr *atpg_mgr_; 
}; //ReportCircuitCmd

class AddFaultCmd : public CmdNs::Cmd { 
public: 
            AddFaultCmd(const std::string &name, 
                        const std::string &msg, 
                        CoreNs::AtpgMgr *atpg_mgr); 
            ~AddFaultCmd(); 
private: 
    bool    run();  

    void    addFault(); 

    CoreNs::AtpgMgr *atpg_mgr_; 
}; //AddFaultCmd

}; //AtpgNs

#endif //_ATPG_SETUP_CMD_H_
