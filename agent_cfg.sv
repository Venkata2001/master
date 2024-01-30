class agent_cfg extends uvm_object;
  //`uvm_component_utils(agent_cfg)
   
  uvm_active_passive_enum is_active=UVM_ACTIVE;
  
  `uvm_object_utils_begin(agent_cfg)
    `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_ALL_ON)
  `uvm_object_utils_end
  
   `NEW_OBJ

  
endclass