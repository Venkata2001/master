class m_drv extends uvm_driver#(base_tx);
//base_tx tx;

  `uvm_component_utils(m_drv)
`NEW_COMP
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction


endclass
