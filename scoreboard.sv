`include"Monitor.sv"
class scoreboard;
  mailbox #(transactor) mon_scb;
  mailbox #(transactor) gen_scb;
  transactor trans1,trans2;
  
  function new(input mailbox #(transactor) mon_scb, mailbox #(transactor) gen_scb);
    this.mon_scb=mon_scb;
    this.gen_scb=gen_scb;
   // mon_h=new();
   
  endfunction
  
  task comparision(int count);
    repeat(count) begin
      
    gen_scb.get(trans1);
    mon_scb.get(trans2);
    if (trans1.paddr==trans2.paddr)
     $display("match");
    else
      $display("transaction failed " , $time); 
      end
       endtask
endclass