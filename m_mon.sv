
class m_mon extends uvm_monitor;
//base_tx tx;
  `uvm_component_utils(m_mon)
`NEW_COMP
function void build_phase(uvm_phase phase);
  super.build_phase(phase);
endfunction

endclass
