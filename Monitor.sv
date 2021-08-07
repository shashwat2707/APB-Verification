`include "driver.sv"
class monitor;

  virtual vif vif_h2;// virtual interface handle
  
  mailbox #(transactor) mon_scb;//mailbox handle frm monitor to scb
  function new(input mailbox #(transactor) mon_scb,input virtual vif vif_h2);
    this.mon_scb=mon_scb;
    this.vif_h2=vif_h2;
  endfunction
  
virtual task mon(int count);
transactor tr;
 begin
tr= new();
  @(posedge vif_h2.pclk)
begin
  //transactor tr= new();
  tr.paddr=vif_h2.paddr;
 
  tr.prdata=vif_h2.prdata;
  tr.pselx=vif_h2.pselx;
 tr.penable=vif_h2.penable;
tr.pwrite=vif_h2.pwrite;
tr.pwdata=vif_h2.pwdata;
tr.pready=vif_h2.pready;
tr.pslverr=vif_h2.pslverr;
  
     $display("monitor paddr=%d  ",vif_h2.paddr,  $time);
     $display("monitor pselx=%d ",vif_h2.pselx,  $time);
     $display("monitor penable=%d ",vif_h2.penable,  $time);
     $display("monitor pwrite=%d ",vif_h2.pwrite,  $time);
     $display("monitor pwdata=%d ",vif_h2.pwdata,  $time);
      $display("monitor prdata=%d ",vif_h2.prdata,  $time);
     $display("monitor pready=%d ",vif_h2.pready,  $time);
     $display("monitor pslverr=%d ",vif_h2.pslverr,  $time);
     
     


  mon_scb.put(tr);
end
      
end 
endtask
endclass
