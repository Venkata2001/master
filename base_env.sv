class base_env extends uvm_env;
 m_agent magent;
 s_agent sagent[];
 int no_of_slaves;
 `uvm_component_utils(base_env)
 function new(string name, uvm_component parent); 
	super.new(name,parent); 
    
endfunction
  
 function void build_phase(uvm_phase phase); 
   magent=m_agent::type_id::create("magent",this);
   
   //geting no_of_slave 
   if(!uvm_config_db#(int)::get(this,"","count",no_of_slaves)) begin
     `uvm_error("env","not able to get data in config_db")
   end
   
// printing no_of_slaves
   `uvm_info("NO_OF_SLAVES",$sformatf("no_of_slaves=%0d",no_of_slaves),UVM_LOW)
   
   //creating slaves
   sagent=new[no_of_slaves];
   for(int i=0;i<no_of_slaves;i++)begin
     sagent[i]=s_agent::type_id::create($sformatf("sagent[%0d]",i),this);
     //`uvm_info("ok","geting",UVM_LOW)
   end
   
   
 endfunction
endclass
