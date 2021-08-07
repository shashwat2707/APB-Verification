`include "transactor.sv"
class generator;
  mailbox #(transactor) gen_drv;
  mailbox #(transactor) gen_scb;
  
  transactor tr_h;//handle of transactor
  
  covergroup cg();//define only inputs in covergroup
 paddr: coverpoint tr_h.paddr{ option.auto_bin_max = 40 ; }
 pwdata: coverpoint tr_h.pwdata{ option.auto_bin_max = 40; }
 pwrite : coverpoint tr_h.pwrite;
endgroup

function new(input mailbox #(transactor) gen_drv,mailbox #(transactor) gen_scb);
  this.gen_drv=gen_drv; //assign mailbox to current instant transaction mailbox handle
  this.gen_scb=gen_scb;
tr_h=new();
cg=new();
endfunction
    
    
     
  

virtual task sampl(int count);
repeat(count) begin
  cg.sample(); end
endtask

  virtual  task gen(int count);
      
      repeat(count)
       begin
       if(tr_h.randomize())
      
      $display("randomization done");
    else
      $display("Randomization Failed");
      gen_drv.put(tr_h);// mail to driver
      gen_scb.put(tr_h);//mail to scoreboard
   
    end
    endtask
  endclass
 
   
   
  

      
      
      
      
