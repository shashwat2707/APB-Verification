

module apb_slave(


input pclk,
input presetn,
input [31:0] paddr,
input [7:0] pselx,
input penable,
input pwrite,
input [31:0] pwdata,
output reg [31:0]prdata,
output reg pready,
output reg pslverr);

byte mem[*];
int paddr_t;
reg [31:0]pwdata_t;

//always @(posedge pclk) begin
always @(negedge penable) begin
         pready=0  ;                    //if(penable==0) pready=0;
                       end 

always @(posedge pclk) begin
        if(presetn==0) begin 
				pready<=0;
				pslverr<=0;
				prdata<=0;
						end 
							else begin
								if(pselx && penable) begin 
									pready<=1;
									if(pwrite ) begin 
										//paddr_t=paddr;
										paddr_t = int'(paddr);
										pwdata_t=pwdata;
										mem[paddr_t]=pwdata_t[7:0];
										mem[paddr_t+1]=pwdata_t[15:8];
										mem[paddr_t+2]=pwdata_t[23:16];
										mem[paddr_t+3]=pwdata_t[31:24];
												end 

										else begin
											if(mem.exists(paddr)) begin
												paddr_t = int'(paddr);
												prdata[7:0]=mem[paddr_t];
												prdata[15:8]=mem[paddr_t+1];
												prdata[23:16]=mem[paddr_t+2];
												prdata[31:24]=mem[paddr_t+3];

																end
													else begin
											prdata=32'h123456;
										end
								end
						end
				end
		end

endmodule

 

