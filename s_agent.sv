class s_agent extends uvm_agent;
m_mon sl_mon;
s_drv sl_drv;
s_seq sl_seq;
  uvm_active_passive_enum sagent_cfg;
   static int count;

  `uvm_component_utils(s_agent)
`NEW_COMP
function void build_phase(uvm_phase phase);
 
	string name;
  name=$sformatf("is_active_slave[%0d]",count);
  //if(!uvm_config_db#(uvm_active_passive_enum)::get(this,"*","name",sagent_cfg))
   //   `uvm_error("master","master cont seting the data")
  uvm_resource_db#(uvm_active_passive_enum)::read_by_name("GLB",name,sagent_cfg,this);
   count++;
    
  if(sagent_cfg==UVM_ACTIVE) begin
     
  	   sl_drv=s_drv::type_id::create("sl_drv",this);
       sl_seq=s_seq::type_id::create("sl_seq",this);
 end 
  sl_mon=m_mon::type_id::create("sl_mon",this);
           
 	 				


endfunction
endclass