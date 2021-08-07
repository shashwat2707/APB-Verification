`include "generator.sv"
class driver;//can't use mailbox because DUT needs data on pin level 

  transactor tr_h;//transactor handle to access transactions
  mailbox #(transactor) gen_drv;
 virtual vif vif_h;// virtual interface handle
 
  function new(input mailbox #(transactor) gen_drv, input virtual vif vif_h);
    this.gen_drv=gen_drv;//current instant
    this.vif_h=vif_h;
    tr_h=new();
    
  endfunction
  
 virtual  task drv(int count);
  repeat(count)
  begin
    gen_drv.get(tr_h);
    @(posedge vif_h.pclk) begin
      drive(tr_h); end
     
     
  end 
  endtask
    
    task drive(transactor tr);
      bit pready_f;
      vif_h.paddr=tr_h.paddr;
      if(tr_h.pwrite) 
      vif_h.pwdata=tr_h.pwdata;
        vif_h.pselx=1;
        vif_h.penable=1;
        vif_h.pwrite=tr_h.pwrite;
        pready_f=0;
        while(pready_f==0) begin
          @(posedge vif_h.pclk)
          if(vif_h.pready) begin
            pready_f=1;
            if(tr_h.pwrite==0)
              tr_h.pwdata=vif_h.prdata;
            end
          end
          @ (negedge vif_h.pclk);
          pready_f=0;
          vif_h.penable=0;
          vif_h.paddr=0;
          vif_h.pwrite=0;
        endtask
    
endclass
    
