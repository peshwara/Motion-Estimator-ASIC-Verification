module pe(clock,R,s1,s2,s1s2mux,newDist,Accumulate,Rpipe);
input clock;
input [7:0] R,s1,s2;
input s1s2mux,newDist;
output [7:0] Accumulate,Rpipe;
reg [7:0] Accumulate,AccumulateIn,difference,Rpipe;
reg Carry;

always@(posedge clock)Rpipe<= R;
always@(posedge clock) Accumulate<=AccumulateIn;

always@(R or s1 or s2 or s1s2mux or newDist or Accumulate)
  begin 
  difference =R -(s1s2mux ?s1 :s2);
  if (difference<0) difference =0-difference;
  {Carry,AccumulateIn}=Accumulate+difference;
  if(Carry==1) Accumulate=8'hFF;
  if(newDist==1) Accumulate=difference;
  end
  endmodule
