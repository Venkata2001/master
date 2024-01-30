`include "uvm_pkg.sv"
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "base_com.sv"
`include "base_tx.sv"
`include "env_cfg.sv"
`include "agent_cfg.sv"
`include "m_drv.sv"
`include "m_seq.sv"
`include "m_mon.sv"
`include "m_agent.sv"
`include "s_drv.sv"
`include "s_seq.sv"
`include "s_agent.sv"
`include "base_env.sv"
`include "base_test.sv"


module top;
 initial begin
   run_test("base_test");	
 end
endmodule
