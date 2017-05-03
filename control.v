module control (clock,start,S1S2mux,NewDist,CompStart,PEready,VectorX,VectorY,AddressR,AddressS1,AddressS2,completed,count);
input clock;
input start;
output [15:0] S1S2mux;
output [12:0] count;
output  [15:0] NewDist ;
output CompStart;
output completed;
output [15:0] PEready;
output [3:0] VectorX,VectorY;
output [7:0] AddressR;
output [9:0] AddressS1,AddressS2;
reg [15:0] S1S2mux;
reg [15:0] NewDist;
reg CompStart;
reg [15:0] PEready; 
reg [3:0] VectorX,VectorY;
reg [7:0] AddressR;
reg [9:0] AddressS1,AddressS2;
reg [12:0] count;
//reg [12:0] count_temp;
reg completed;
reg [11:0] temp;
integer i;
integer j;


always@(posedge clock) begin
  if(start ==0 ) 
    count <= 12'b0;
  else if (completed==0) 
   begin
      count<=count+1'b1;
   end

       
end
  
  always@(count)
   begin
	 //count_temp= count+1'b1;
         for(i=0;i<16;i=i+1)
         begin
          NewDist[i]=(count[7:0]==i);
      // $display(count);
          PEready[i]=(NewDist[i] && !(count<256));
          S1S2mux[i]=(count[3:0] >= i);
	  CompStart = (!(count<256));
         end
   
     
      
     //if(count>=273)CompStart=1;
     //   else CompStart=0;
     
      AddressR=count[7:0];
      AddressS1=(count[11:8] + count[7:4])*32 +count[3:0];
      
      temp = count[11:0]-16;
      AddressS2=(temp[11:8] + temp[7:4])*32 + temp[3:0] + 16;
 
      VectorX=count[3:0] - 8;
      VectorY=count[11:8] - 9;
      completed=(count == 4111); //4'd16 + (8'd256 +1)
      end

      
   endmodule
