class m_agent extends uvm_agent;
m_mon mon;
m_drv drv;
m_seq seq;
uvm_active_passive_enum magent_cfg;

 

  `uvm_component_utils(m_agent)
`NEW_COMP
function void build_phase(uvm_phase phase);
  //get master config
  if(!uvm_config_db#(uvm_active_passive_enum)::get(this,"*","is_active_master",magent_cfg))
     `uvm_error("master","master cont seting the data")

  if(magent_cfg==UVM_ACTIVE) begin
 
		drv=m_drv::type_id::create("drv",this);
		seq=m_seq::type_id::create("seq",this);
  end
  
  mon=m_mon::type_id::create("mon",this);

endfunction
endclass
