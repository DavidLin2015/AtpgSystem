#include "pattern.h"
#include "logic.h"
#include <time.h>
#include <stdlib.h>
void PatternMgr::GenRandomPattern(int patternSize, int patternCount)
{
	srand(36);
	for(int i = 0;i < patternCount;++ i)
	{
		TestPattern* pat = new TestPattern(patternSize);
		pattern_list_.push_back(pat);
		for(int j = 0;j < patternSize;++ j)
		{
			/*
			for(int k = 0;k < WORD_SIZE;++ k)
			{
				if(rand()%3 == 0) pat-> SetVal(j, k, L);
				else if(rand()%3 == 1) pat-> SetVal(j, k, L);
				else pat-> SetVal(j, k, X);

			}
			*/
			if(rand()%3 == 0)
			{
				//for(int k = 0;k < WORD_SIZE;++ k)
					pat-> SetVal(j, 0, L);
			}
			else if(rand()%3 == 1)
			{
				//for(int k = 0;k < WORD_SIZE;++ k)
					pat-> SetVal(j, 0, H);				
			}
			else
			{
				//for(int k = 0;k < WORD_SIZE;++ k)
					pat-> SetVal(j, 0, X);				
			}
		}
	}
}


void TestPattern::SetVal(int frame_id, int idx, Value val)
{
	if(val == L)
	{
		SetBitVal(p0_[frame_id], 1, idx);
		SetBitVal(p1_[frame_id], 0, idx);
	}
	else if(val == H)
	{
		SetBitVal(p0_[frame_id], 0, idx);
		SetBitVal(p1_[frame_id], 1, idx);
	}
	else if(val == X)
	{
		SetBitVal(p0_[frame_id], 0, idx);
		SetBitVal(p1_[frame_id], 0, idx);
	}
}

Value TestPattern::GetVal(int frame_id, int idx)
{
	bool v0 = GetBitVal(p0_[frame_id], idx);
	bool v1 = GetBitVal(p1_[frame_id], idx);
	if(v0) return L;
	else if(v1) return H;
	else return X;
}
