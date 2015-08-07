#include <algorithm>
#include <sstream>
#include <fstream>
#include <iostream>
#include <queue>

#include "circuit.h"

using namespace std;

using namespace CoreNs; 

/*
class Gate;
class AND_Gate;
class OR_Gate;
class NOT_Gate;
class NAND_Gate;
class NOR_Gate;
class PIPPI_Gate;
class POPPO_Gate;
class BUF_Gate;
*/
int cmp_gate_lvl(Gate* gate_a, Gate* gate_b)
{
	return(gate_a-> lvl_ < gate_b-> lvl_);
}

void Circuit:: Parse(string cir_fname)
{
	ifstream input;
	input.open(cir_fname.c_str());
	if(!input)
	{
		cout<<"Cannot open "<<cir_fname<<endl;
	}
	string line, temp;
	stringstream sstream;
	map<string,Wire*>::iterator it;
	while(getline(input,line))
	{
		//cout<<line<<endl;
		sstream.clear();
		sstream.str(line);
		sstream>>temp;
		//cout<<temp<<endl;
		if(temp == "module")
		{
			getline(sstream,name_,'(');		
		}
		else if(temp == "input")
		{
			string residue = sstream.str();
			size_t idx;
			while((idx = residue.find(',')) != string::npos)
			{
				residue.replace(idx,1,1,' ');
			}
			while((idx = residue.find(';')) != string::npos)
			{
				residue.replace(idx,1,1,' ');
			}
			//cout<<residue<<endl;
			sstream.clear();
			sstream.str(residue);
			sstream >> temp;
			while(sstream >> temp)
			{
				if(temp == "GND" || temp == "VDD" || temp == "CK")
				{
					continue;
				}
				npi_++;
				PIPPI_Gate* curr_gate = new PIPPI_Gate();
				curr_gate->type_ = PI;
				
				Wire* w = new Wire();
				w -> name_ = temp;
				w -> in_gate_ = curr_gate;
				curr_gate->out_wire_ = w;
				
				wire_map_.insert(pair<string,Wire*>(temp,w));
				//gate_list_.push_back(curr_gate);
				pi_list_.push_back(curr_gate);
			}
		}
		else if(temp == "output")
		{
			string residue = sstream.str();
			size_t idx;
			while((idx = residue.find(',')) != string::npos)
			{
				residue.replace(idx,1,1,' ');
			}
			while((idx = residue.find(';')) != string::npos)
			{
				residue.replace(idx,1,1,' ');
			}
			//cout<<residue<<endl;
			sstream.clear();
			sstream.str(residue);
			sstream >> temp;
			while(sstream >> temp)
			{
				npo_++;
				POPPO_Gate* curr_gate = new POPPO_Gate();
				curr_gate->type_ = PO;
				
				Wire* w = new Wire();
				w -> name_ = temp;
				w -> out_gate_list_.push_back(curr_gate);
				curr_gate->in_wire_list_.push_back(w);
				
				wire_map_.insert(pair<string,Wire*>(temp,w));
				//gate_list_.push_back(curr_gate);
				po_list_.push_back(curr_gate);
			}
		}
		else if(temp!="dff" && temp!="not" && temp!="and" && temp!="or"&&
				temp!="nand"&& temp!="nor" && temp!="input" && temp!="xor"&&
				temp!="xnor" && temp !="output")
		{
			continue;
		}
		else
		{
			string residue = sstream.str();
			size_t idx;		
			while((idx = residue.find(',')) != string::npos)
			{
				residue.replace(idx,1,1,' ');
			}
			while((idx = residue.find(';')) != string::npos)
			{
				residue.replace(idx,1,1,' ');
			}
			while((idx = residue.find('(')) != string::npos)
			{
				residue.replace(idx,1,1,' ');
			}
			while((idx = residue.find(')')) != string::npos)
			{
				residue.replace(idx,1,1,' ');
			}
			sstream.clear();
			sstream.str(residue);
			
			string name;
			if(temp == "dff")
			{
				nppi_ ++;
				//PPI
				sstream >> temp >> name >> temp >> temp;
				PIPPI_Gate* curr_gate = new PIPPI_Gate();
				curr_gate->type_ = PPI;
				curr_gate->name_=name;
				it = wire_map_.find(temp);
				Wire* w;
				if(it != wire_map_.end())
				{
					w = it->second;
				}
				else
				{
					w = new Wire();
					w->name_ = temp;
					wire_map_.insert(pair<string,Wire*>(temp,w));
				}
				w->in_gate_ = curr_gate;
				curr_gate->out_wire_ = w;
				ppi_list_.push_back(curr_gate);
				
				//PPO
				sstream >> temp;
				POPPO_Gate* curr_gate_2 = new POPPO_Gate();
				curr_gate_2->type_ = PPO;
				curr_gate_2->name_ = name;
				it = wire_map_.find(temp);
				if(it != wire_map_.end())
				{
					w = it->second;
				}
				else
				{
					w = new Wire();
					w->name_ = temp;
					wire_map_.insert(pair<string,Wire*>(temp,w));
				}
				//cout<<"name = "<<w->name_<<endl;
				w->out_gate_list_.push_back(curr_gate_2);
				curr_gate_2->in_wire_list_.push_back(w);
				ppo_list_.push_back(curr_gate_2);
				//cout<<curr_gate_2->in_wire_list_.size()<<endl;
			}
			else
			{
				nlogic_gate_++;
				Gate* g;
				if(temp == "and")
				{
					g = new AND_Gate();
					g->type_ = AND;
				}
				else if(temp == "or")
				{
					g = new OR_Gate();
					g->type_ = OR;
				}
				else if(temp == "nand")
				{
					g = new NAND_Gate();
					g->type_ = NAND;
				}
				else if(temp == "nor")
				{
					g = new NOR_Gate();
					g->type_ = NOR;
				}
				else if(temp == "not")
				{
					g = new NOT_Gate();
					g->type_ = NOT;
				}
				else if(temp == "xor")
				{
					g = new XOR_Gate();
					g->type_ = XOR;
				}	
				else if(temp == "xnor")
				{
					g = new XNOR_Gate();
					g->type_ = XNOR;
				}					
				//Out wire
				Wire* w;
				sstream >> temp >> name >> temp;
				it = wire_map_.find(temp);
				if(it != wire_map_.end())
				{
					w = it->second;
				}
				else
				{
					w = new Wire();
					w->name_ = temp;
					wire_map_.insert(pair<string,Wire*>(temp,w));
				}
				
				w->in_gate_ = g;
				g->out_wire_ = w;
				g->name_ = name;

				//In wires
				while(sstream>>temp)
				{
					it = wire_map_.find(temp);
					if(it != wire_map_.end())
					{
						w = it->second;
					}
					else
					{
						w = new Wire();
						w->name_ = temp;
						wire_map_.insert(pair<string,Wire*>(temp,w));
					}
					
					w->out_gate_list_.push_back(g);
					g->in_wire_list_.push_back(w);				
		
				}
				logic_list_.push_back(g);		
			}
		}
		temp.clear();
	}
	
	ntotgate_ = nppi_ + nppi_ + npi_ + npo_ + nlogic_gate_;
	gate_list_ = new Gate*[sizeof(Gate*) * ntotgate_];
	//Push all gates to gate_list_
	int index = 0;
	for(unsigned i = 0;i < pi_list_.size();++ i)
	{
		gate_list_[index] = pi_list_[i];
		index ++;
	}
	for(unsigned i = 0;i < ppi_list_.size();++ i)
	{
		gate_list_[index] = ppi_list_[i];
		index ++;
	}
	for(unsigned i = 0;i < logic_list_.size();++ i)
	{
		gate_list_[index] = logic_list_[i];
		index ++;
	}	
	for(unsigned i = 0;i < po_list_.size();++ i)
	{
		gate_list_[index] = po_list_[i];
		index ++;
	}
	for(unsigned i = 0;i < ppo_list_.size();++ i)
	{
		gate_list_[index] = ppo_list_[i];
		index ++;
	}
}

void Circuit::ConnectGates()
{
	for(int i = 0; i < ntotgate_;++ i)
	{
		Gate* g = gate_list_[i];
		if(g-> out_wire_ != NULL)
		{
			Wire* w = g-> out_wire_;
			g-> nfo_ = w-> out_gate_list_.size();
			//cout<<"nnfedsf  "<<g-> nfo_<<endl;
			g-> fos_ = new Gate* [sizeof(Gate*) * g-> nfo_];
			for(unsigned j = 0;j < w-> out_gate_list_.size();++ j)
			{
				g-> fos_[j] = w-> out_gate_list_[j];
			}
		}
		
		g-> nfi_ = g-> in_wire_list_.size();
		g-> fis_ = new Gate* [sizeof(Gate*) * g-> nfi_];
		for(unsigned j = 0;j < g -> in_wire_list_.size();++ j)
		{
			Wire* w = g-> in_wire_list_[j];
			g-> fis_[j] = w-> in_gate_;
		}
	}
}

void Circuit::Levelize()
{
	int nInput = npi_+ nppi_;
	queue<Gate*> Q;
	for(int i = 0;i < nInput;++ i)
	{
		gate_list_[i]-> lvl_ = 0;
		Q.push(gate_list_[i]);
	}
	
	while(!Q.empty())
	{
		Gate* g = Q.front();
		Q.pop();
		for(int i =0;i < g-> nfo_;++ i)
		{	
			if(g-> fos_[i]-> lvl_ == -1)
			{
				Q.push(g-> fos_[i]);
			}
			if(g-> fos_[i]-> lvl_ < g-> lvl_ + 1)
			{
				g-> fos_[i]-> lvl_ = g-> lvl_ + 1;
			}
		}
	}
	
	sort(gate_list_ + nInput, gate_list_ + nInput +nlogic_gate_, cmp_gate_lvl);
}
void Circuit::CalcTestability()
{
	for(int i = 0;i < ntotgate_;++ i)
	{
		gate_list_[i]-> CalcControllability();
	}
	
	for(int i = ntotgate_ - 1;i >= 0;-- i)
	{
		gate_list_[i]-> CalcObservability();
	}
}

void Circuit::SetInputsFromPattern(TestPattern* pat)
{
	for(int i = 0;i < npi_+nppi_;++ i)
	{
		gate_list_[i]-> gl_ = pat-> p0_[i];
		gate_list_[i]-> gh_ = pat-> p1_[i];
		gate_list_[i]-> fl_ = pat-> p0_[i];
		gate_list_[i]-> fh_ = pat-> p1_[i];
	}
}

