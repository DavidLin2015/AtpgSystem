#include "gate.h"
#include "fault.h"
#include <climits>

using namespace CoreNs; 

/*************Evaluation************/
Value AND_Gate::GoodEval()
{
	if(nfi_ == 2) 		return EvalAND2(fis_[0]-> val_, fis_[1]-> val_);
	else if(nfi_ == 3) 	return EvalAND3(fis_[0]-> val_, fis_[1]-> val_, fis_[2]-> val_);
	else if(nfi_ == 4) 	return EvalAND4(fis_[0]-> val_, fis_[1]-> val_, fis_[2]-> val_, fis_[3]-> val_);
	return X;
}

Value OR_Gate::GoodEval()
{
	if(nfi_ == 2) 		return EvalOR2(fis_[0]-> val_, fis_[1]-> val_);
	else if(nfi_ == 3) 	return EvalOR3(fis_[0]-> val_, fis_[1]-> val_, fis_[2]-> val_);
	else if(nfi_ == 4) 	return EvalOR4(fis_[0]-> val_, fis_[1]-> val_, fis_[2]-> val_, fis_[3]-> val_);
	return X;
}

Value NAND_Gate::GoodEval()
{
	if(nfi_ == 2) 		return EvalNAND2(fis_[0]-> val_, fis_[1]-> val_);
	else if(nfi_ == 3) 	return EvalNAND3(fis_[0]-> val_, fis_[1]-> val_, fis_[2]-> val_);
	else if(nfi_ == 4) 	return EvalNAND4(fis_[0]-> val_, fis_[1]-> val_, fis_[2]-> val_, fis_[3]-> val_);
	return X;
}

Value NOR_Gate::GoodEval()
{
	if(nfi_ == 2) 		return EvalNOR2(fis_[0]-> val_, fis_[1]-> val_);
	else if(nfi_ == 3) 	return EvalNOR3(fis_[0]-> val_, fis_[1]-> val_, fis_[2]-> val_);
	else if(nfi_ == 4) 	return EvalNOR4(fis_[0]-> val_, fis_[1]-> val_, fis_[2]-> val_, fis_[3]-> val_);
	return X;
}

Value NOT_Gate::GoodEval()
{
	return EvalNOT(fis_[0]-> val_);
}

Value BUF_Gate::GoodEval()
{
	return fis_[0]-> val_;
}

Value XOR_Gate::GoodEval()
{
	if(nfi_ == 2) 		return EvalXOR2(fis_[0]-> val_, fis_[1]-> val_);
	else if(nfi_ == 3) 	return EvalXOR3(fis_[0]-> val_, fis_[1]-> val_, fis_[2]-> val_);
	return X;
}

Value XNOR_Gate::GoodEval()
{
	if(nfi_ == 2) 		return EvalXNOR2(fis_[0]-> val_, fis_[1]-> val_);
	else if(nfi_ == 3) 	return EvalXNOR3(fis_[0]-> val_, fis_[1]-> val_, fis_[2]-> val_);
	return X;
}

Value PIPPI_Gate::GoodEval()
{
	return val_;
}

Value POPPO_Gate::GoodEval()
{
	return fis_[0]-> val_;
}

/*********Faulty Evaluation********/
Value AND_Gate::FaultyEval()
{
	Value fiValue[4];
	fiValue[0] = 		   fis_[0]-> val_;
	fiValue[1] = 		   fis_[1]-> val_;
	fiValue[2] = nfi_ > 2? fis_[2]-> val_:0;
	fiValue[3] = nfi_ > 3? fis_[3]-> val_:0;
	
	fiValue[f_-> f_pid_ - 1] = f_-> faulty_value_;
	if(nfi_ == 2) 		return EvalAND2(fiValue[0], fiValue[1]);
	else if(nfi_ == 3) 	return EvalAND3(fiValue[0], fiValue[1], fiValue[2]);
	else if(nfi_ == 4) 	return EvalAND4(fiValue[0], fiValue[1], fiValue[2], fiValue[3]);
	return X;
}

Value OR_Gate::FaultyEval()
{
	Value fiValue[4];
	fiValue[0] = 		   fis_[0]-> val_;
	fiValue[1] = 		   fis_[1]-> val_;
	fiValue[2] = nfi_ > 2? fis_[2]-> val_:0;
	fiValue[3] = nfi_ > 3? fis_[3]-> val_:0;
	
	fiValue[f_-> f_pid_ - 1] = f_-> faulty_value_;
	if(nfi_ == 2) 		return EvalOR2(fiValue[0], fiValue[1]);
	else if(nfi_ == 3) 	return EvalOR3(fiValue[0], fiValue[1], fiValue[2]);
	else if(nfi_ == 4) 	return EvalOR4(fiValue[0], fiValue[1], fiValue[2], fiValue[3]);
	return X;
}

Value NAND_Gate::FaultyEval()
{
	Value fiValue[4];
	fiValue[0] = 		   fis_[0]-> val_;
	fiValue[1] = 		   fis_[1]-> val_;
	fiValue[2] = nfi_ > 2? fis_[2]-> val_:0;
	fiValue[3] = nfi_ > 3? fis_[3]-> val_:0;
	
	fiValue[f_-> f_pid_ - 1] = f_-> faulty_value_;
	if(nfi_ == 2) 		return EvalNAND2(fiValue[0], fiValue[1]);
	else if(nfi_ == 3) 	return EvalNAND3(fiValue[0], fiValue[1], fiValue[2]);
	else if(nfi_ == 4) 	return EvalNAND4(fiValue[0], fiValue[1], fiValue[2], fiValue[3]);
	return X;
}

Value NOR_Gate::FaultyEval()
{
	Value fiValue[4];
	fiValue[0] = 		   fis_[0]-> val_;
	fiValue[1] = 		   fis_[1]-> val_;
	fiValue[2] = nfi_ > 2? fis_[2]-> val_:0;
	fiValue[3] = nfi_ > 3? fis_[3]-> val_:0;
	
	fiValue[f_-> f_pid_ - 1] = f_-> faulty_value_;
	if(nfi_ == 2) 		return EvalNOR2(fiValue[0], fiValue[1]);
	else if(nfi_ == 3) 	return EvalNOR3(fiValue[0], fiValue[1], fiValue[2]);
	else if(nfi_ == 4) 	return EvalNOR4(fiValue[0], fiValue[1], fiValue[2], fiValue[3]);
	return X;
}

Value NOT_Gate::FaultyEval()
{
	return EvalNOT(f_-> faulty_value_);
}

Value BUF_Gate::FaultyEval()
{
	return f_-> faulty_value_;
}

Value XOR_Gate::FaultyEval()
{
	Value fiValue[3];
	fiValue[0] = 		   fis_[0]-> val_;
	fiValue[1] = 		   fis_[1]-> val_;
	fiValue[2] = nfi_ > 2? fis_[2]-> val_:0;
	
	fiValue[f_-> f_pid_ - 1] = f_-> faulty_value_;
	if(nfi_ == 2) 		return EvalXOR2(fiValue[0], fiValue[1]);
	else if(nfi_ == 3) 	return EvalXOR3(fiValue[0], fiValue[1], fiValue[2]);
	return X;
}

Value XNOR_Gate::FaultyEval()
{
	Value fiValue[3];
	fiValue[0] = 		   fis_[0]-> val_;
	fiValue[1] = 		   fis_[1]-> val_;
	fiValue[2] = nfi_ > 2? fis_[2]-> val_:0;
	
	fiValue[f_-> f_pid_ - 1] = f_-> faulty_value_;
	if(nfi_ == 2) 		return EvalXNOR2(fiValue[0], fiValue[1]);
	else if(nfi_ == 3) 	return EvalXNOR3(fiValue[0], fiValue[1], fiValue[2]);
	return X;
}

Value PIPPI_Gate::FaultyEval()
{
	return val_;
}

Value POPPO_Gate::FaultyEval()
{
	return f_-> faulty_value_;
}

/**********controllability**********/
void AND_Gate::CalcControllability()
{
	int min_zero_control = INT_MAX;
	one_controllability_  = 1;
	for(int i = 0;i < nfi_;++ i)
	{
		one_controllability_ += fis_[i]-> one_controllability_;
		if(fis_[i]-> zero_controllability_ < min_zero_control)
		{
			min_zero_control = fis_[i]-> zero_controllability_;
		}
	}
	zero_controllability_ = min_zero_control + 1;
}

void OR_Gate::CalcControllability()
{
	int min_one_control = INT_MAX;
	zero_controllability_  = 1;
	for(int i = 0;i < nfi_;++ i)
	{
		zero_controllability_ += fis_[i]-> zero_controllability_;
		if(fis_[i]-> one_controllability_ < min_one_control)
		{
			min_one_control = fis_[i]-> one_controllability_;
		}
	}
	one_controllability_ = min_one_control + 1;	
}

void NAND_Gate::CalcControllability()
{
	int min_zero_control = INT_MAX;
	zero_controllability_  = 1;
	for(int i = 0;i < nfi_;++ i)
	{
		zero_controllability_ += fis_[i]-> one_controllability_;
		if(fis_[i]-> zero_controllability_ < min_zero_control)
		{
			min_zero_control = fis_[i]-> zero_controllability_;
		}
	}
	one_controllability_ = min_zero_control + 1;
}

void NOR_Gate::CalcControllability()
{
	int min_one_control = INT_MAX;
	one_controllability_  = 1;
	for(int i = 0;i < nfi_;++ i)
	{
		one_controllability_ += fis_[i]-> zero_controllability_;
		if(fis_[i]-> one_controllability_ < min_one_control)
		{
			min_one_control = fis_[i]-> one_controllability_;
		}
	}
	zero_controllability_ = min_one_control + 1;
}

void NOT_Gate::CalcControllability()
{
	zero_controllability_ = fis_[0]-> zero_controllability_ + 1;
	one_controllability_ = fis_[0]-> one_controllability_ + 1;
}

void BUF_Gate::CalcControllability()
{
	zero_controllability_ = fis_[0]-> zero_controllability_ + 1;
	one_controllability_ = fis_[0]-> one_controllability_ + 1;
}

void XOR_Gate::CalcControllability()
{
	if(fis_[0]-> zero_controllability_ + fis_[1]-> zero_controllability_ <
	   fis_[0]-> one_controllability_ + fis_[1]-> one_controllability_)
	{
		zero_controllability_ = fis_[0]-> zero_controllability_ + fis_[1]-> zero_controllability_ + 1;
	}
	else
	{
		zero_controllability_ = fis_[0]-> one_controllability_ + fis_[1]-> one_controllability_ + 1;
	}
	
	if(fis_[0]-> zero_controllability_ + fis_[1]-> one_controllability_ <
	   fis_[0]-> one_controllability_ + fis_[1]-> zero_controllability_)
	{
		one_controllability_ = fis_[0]-> zero_controllability_ + fis_[1]-> one_controllability_ + 1;
	}
	else
	{
		one_controllability_ = fis_[0]-> one_controllability_ + fis_[1]-> zero_controllability_ + 1;
	}
}

void XNOR_Gate::CalcControllability()
{
	if(fis_[0]-> zero_controllability_ + fis_[1]-> zero_controllability_ <
	   fis_[0]-> one_controllability_ + fis_[1]-> one_controllability_)
	{
		one_controllability_ = fis_[0]-> zero_controllability_ + fis_[1]-> zero_controllability_ + 1;
	}
	else
	{
		one_controllability_ = fis_[0]-> one_controllability_ + fis_[1]-> one_controllability_ + 1;
	}
	
	if(fis_[0]-> zero_controllability_ + fis_[1]-> one_controllability_ <
	   fis_[0]-> one_controllability_ + fis_[1]-> zero_controllability_)
	{
		zero_controllability_ = fis_[0]-> zero_controllability_ + fis_[1]-> one_controllability_ + 1;
	}
	else
	{
		zero_controllability_ = fis_[0]-> one_controllability_ + fis_[1]-> zero_controllability_ + 1;
	}
}
void PIPPI_Gate::CalcControllability()
{
	zero_controllability_ = 1;
	one_controllability_  = 1;
}

void POPPO_Gate::CalcControllability()
{
	zero_controllability_ = fis_[0]-> zero_controllability_;
	one_controllability_ = fis_[0]-> one_controllability_;
}

/**********observability**********/
void AND_Gate::CalcObservability()
{
}

void OR_Gate::CalcObservability()
{
}

void NAND_Gate::CalcObservability()
{
}

void NOR_Gate::CalcObservability()
{
}

void NOT_Gate::CalcObservability()
{
}

void BUF_Gate::CalcObservability()
{
}

void XOR_Gate::CalcObservability()
{
}

void XNOR_Gate::CalcObservability()
{
}

void PIPPI_Gate::CalcObservability()
{
}

void POPPO_Gate::CalcObservability()
{
	
}
