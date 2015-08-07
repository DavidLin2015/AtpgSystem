#ifndef _CORE_PATTERN_H_
#define _CORE_PATTERN_H_

#include "logic.h"
#include <vector>
#include <memory.h>
#include <iostream>
using namespace std;
class TestPattern
{
	public:
		TestPattern(int pat_size)
		{
			pat_size_ = pat_size;
			p0_ = new ParaValue[sizeof(ParaValue)*pat_size];
			p1_ = new ParaValue[sizeof(ParaValue)*pat_size];
			memset (p0_, 0, sizeof(ParaValue)*pat_size);
		}
		int pat_size_;
		ParaValue* p0_, *p1_;
		void SetVal(int frame_id, int idx, Value val);
		Value GetVal(int frame_id, int idx);
};

class PatternMgr
{
	public:
		vector<TestPattern*> pattern_list_;
		void GenRandomPattern(int patternSize, int patternCount);
};

#endif // _CORE_PATTERN_H_
