#ifndef _CORE_ATPG_MGR_H_ 
#define _CORE_ATPG_MGR_H_ 

#include "atpg.h"

namespace CoreNs { 

typedef std::vector<Atpg*>  AtpgVec; 

class AtpgMgr {
public: 
                AtpgMgr(); 
                ~AtpgMgr(); 

    Circuit     *cir_; 

    FaultMgr    *f_mgr_; 
    PatternMgr  *pat_mgr_; 
private: 
    AtpgVec     atpgs_; 
}; //AtpgMgr
 
inline AtpgMgr::AtpgMgr() {
    cir_        = NULL; 

    f_mgr_      = NULL; 
    pat_mgr_    = NULL; 
}

inline AtpgMgr::~AtpgMgr() {
    //TODO
}

};  //CoreNs

#endif //_CORE_CMD_MGR_H_
