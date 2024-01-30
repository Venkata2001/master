
class base_test extends uvm_test;
 
 base_env env;
 env_cfg cfg;
 agent_cfg m_cfg;
  agent_cfg s_cfg[];


 
`uvm_component_utils(base_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
  int count;
  string name;
  
 
  
  /////////////////
  env=base_env::type_id::create("env",this);
  cfg=env_cfg::type_id::create("cfg");
 
  ////////////////////
  count=cfg.no_of_slaves;
  s_cfg=new[count];

  
  uvm_config_db#(int)::set(this,"*","count",count);
  
  m_cfg=agent_cfg::type_id::create("m_cfg",this);
  
  for(int i=0;i<count;i++) begin
    s_cfg[i]=agent_cfg::type_id::create($sformatf("s_cfg[%0d]",i),this);

  end
  
  ///////////////////////////////////
   m_cfg.is_active=UVM_PASSIVE;
  
   s_cfg[0].is_active=UVM_PASSIVE;
  s_cfg[1].is_active=UVM_ACTIVE;
  s_cfg[2].is_active=UVM_PASSIVE;
  s_cfg[3].is_active=UVM_ACTIVE;
  s_cfg[4].is_active=UVM_PASSIVE;
  
  
  // s_cfg.is_active=UVM_ACTIVE;

  
  //master agent config
  uvm_config_db#(uvm_active_passive_enum)::set(this,"env.magent*","is_active_master",m_cfg.is_active);
   
  //slave agent config
  // uvm_config_db#(uvm_active_passive_enum)::set(this,"env.sagent*","is_active_slave",s_cfg.is_active);


  for(int i=0;i<count;i++)begin
    name=$sformatf("is_active_slave[%0d]",i);


   // uvm_config_db#(uvm_active_passive_enum)::set(this,"env.sagent*","name",s_cfg[0].is_active);
    uvm_resource_db#(uvm_active_passive_enum)::set("GLB",name,s_cfg[i].is_active,this);
    
  end

endfunction
  
function void end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction
  
 
endclass
