class transactor;
  randc bit [31:0]paddr;
  randc bit  [31:0]pwdata;
  randc bit pwrite;
  

randc bit [7:0] pselx;
randc bit penable;

bit [31:0] prdata;
bit pready;
bit pslverr;

endclass

class write extends transactor;
  constraint c1{pwrite==1;}
endclass

class second extends transactor;
  
  constraint mai{pwrite==0;}
endclass

