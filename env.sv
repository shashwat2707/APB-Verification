
`include"scoreboard.sv"

class enviroment;
  
  mailbox  gen_drv;
  mailbox  gen_scb;
   mailbox  mon_scb;
   
   virtual vif vif_h;
  virtual vif vif_h2;
 
  generator gr_h;
  driver drv_h;
  monitor mon_h;
  scoreboard scb_h;
 function new(virtual vif vif_h,virtual vif vif_h2);
   this.vif_h=vif_h;
  this.vif_h2=vif_h2;
 endfunction
 
  task build(int count);
   repeat(count) begin
gen_drv=new();
gen_scb=new();
mon_scb=new();
gr_h=new(gen_drv,gen_scb);
drv_h=new(gen_drv,vif_h);
mon_h=new(mon_scb,vif_h2);
scb_h=new(gen_scb,mon_scb); 
end 
endtask

 task run(int count);
fork
gr_h.gen(1);
drv_h.drv(1);
mon_h.mon(1);
scb_h.comparision(1); 
gr_h.sampl(1);
join
endtask
endclass