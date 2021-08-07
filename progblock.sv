`include"env.sv"
program main(vif vif_h, vif vif_h2,input logic [3:0]args );
  
  write wt;
  second sec;
  transactor tr_h;
  enviroment env_h;
  generator gr_h;
  
  initial begin
$display("ARGS is %b", args);


if(args==4'b0000)begin
  repeat(1) begin
    
$display("write");
repeat(1) begin
wt=new();
 env_h=new(vif_h,vif_h2);
env_h.build(1);
repeat(100) begin
env_h.gr_h.tr_h=wt;
repeat(1) 
env_h.run(1); 

$display("read");
sec=new();

env_h.gr_h.tr_h=sec;
repeat(1) begin
env_h.run(1); end 
end end end

 end 



end 
endprogram

 
    
