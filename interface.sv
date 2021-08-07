


//`include "driver.sv"
interface vif(input bit pclk, input bit presetn);


bit [31:0] paddr;
bit[7:0] pselx;
bit penable;
bit pwrite;
bit [31:0] pwdata;
bit [31:0]prdata;
bit pready;
bit pslverr;


endinterface
