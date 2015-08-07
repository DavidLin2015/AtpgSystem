#include "simulator.h"

using namespace std; 

using namespace CoreNs; 

void Simulator::EventDrivenSim()
{
	while(! event_queue_.empty())
	{
		Gate* g = event_queue_.front();
		event_queue_.pop();
		Value v;
		if(g-> is_faulted_ && g-> f_-> f_pid_)
		{
			v = g-> FaultyEval();
		}
		else
		{
			v = g-> GoodEval();
		}
		if(g-> val_ != v)
		{
			g-> val_ = v;
			for(int i = 0;i < g-> nfo_;++ i)
			{
				event_queue_.push(g-> fos_[i]);
			}
		}
	}	
}
void Simulator::AddEvent(Gate* g)
{
	event_queue_.push(g);
}

