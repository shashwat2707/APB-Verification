`include"env.sv"
module top();
    bit pclk; 
    bit presetn;
 logic [3:0] args;
 
 initial begin
   if($test$plusargs("write")) begin

	args=4'b0000;
	$display("**********write**********");
	end
	
if($test$plusargs("secondd")) begin

	args=4'b0001;
	$display("**********read**********");
	end
	
end 
         
 vif vif_h(pclk,presetn);
 
 apb_slave apb(.pclk(pclk),.presetn(presetn),.paddr(vif_h.paddr),.pselx(vif_h.pselx),.penable(vif_h.penable),.pwrite(vif_h.pwrite),.prdata(vif_h.prdata),
 .pwdata(vif_h.pwdata),.pready(vif_h.pready),.pslverr(vif_h.pslverr));
 main ma(vif_h, vif_h,args);
     
 
    
 
 initial begin
   $monitor("top pselx=%d \n paddr=%d \n penable=%d \n pwrite=%d \n pwdata=%d \n prdata=%d \n pready=%d \n pslverr=%d \n",apb.pselx,
     apb.paddr,apb.penable,apb.pwrite,apb.pwdata,apb.prdata,apb.pready, 
     apb.pslverr, `__FILE__, `__LINE__, $time);
   pclk=0; end
  always #10 pclk=~pclk; 
  
   
 initial begin
 presetn=0;
 repeat(2)@(posedge pclk)
  
presetn=1;
     
  
     


end
endmodule
