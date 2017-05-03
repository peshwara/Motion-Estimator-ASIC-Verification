// Code your testbench here
// or browse Examples
module test();
 //initial begin
//$dumpfile ("dump.vcd");//
//$dumpvars(1);
//end
reg clock=1;
reg start;
wire [15:0] S1S2mux;
wire [15:0] NewDist;
wire CompStart;
wire [15:0]  PEready; 
wire [3:0] VectorX,VectorY;
wire [7:0] AddressR;
wire [9:0] AddressS1,AddressS2;
wire [12:0] count;
wire completed;
  integer i;
initial 
  begin
   // clock=1;
     start =0;
    #15 start =1;
    
    //#50000 $finish; 
  end
  
  always 
    begin
    #5 clock = ~clock;
 
    end
  
  control c (clock,start,S1S2mux,NewDist,CompStart,PEready,VectorX,VectorY,AddressR,AddressS1,AddressS2,completed,count);
  
endmodule
  
