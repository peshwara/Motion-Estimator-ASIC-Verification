module Comparator(clock,CompStart,PEout,PEready,vectorX,vectorY,BestDist,motionX,motionY);
input clock;
input CompStart;
input [8*16-1:0] PEout;
input [15:0] PEready;
input [3:0] vectorX,vectorY;
output [7:0] BestDist;
output [3:0] motionX,motionY;
reg [7:0] BestDist,newDist;
reg [3:0] motionX,motionY;
reg newBest;

always@(posedge clock)
  if(CompStart==0) BestDist<=8'hff;
  else if(newBest==1)
  begin
     BestDist<=newDist;
     motionX<=vectorX;
     motionY<=vectorY;
  end
  
always@(BestDist or PEout or PEready)
begin
   // newDist=PEout [PEready*8+7:PEready*8];
       case(PEready)
         
         16'b0000000000000001: newDist=PEout[7:0];
                    
         16'b0000000000000010: newDist=PEout[15:8];
                    
         16'b0000000000000100: newDist=PEout[23:16];
                              
         16'b0000000000001000: newDist=PEout[31:24];
                              
         16'b0000000000010000: newDist=PEout[39:32];
                    
         16'b0000000000100000: newDist=PEout[47:40];
                    
         16'b0000000001000000: newDist=PEout[55:48];
                    
         16'b0000000010000000: newDist=PEout[63:56];
                    
         16'b0000000100000000: newDist=PEout[71:64];
                    
         16'b0000001000000000: newDist=PEout[79:72];
                    
         16'b0000010000000000: newDist=PEout[87:80];
                    
         16'b0000100000000000: newDist=PEout[95:88];
                    
         16'b0001000000000000: newDist=PEout[103:96];
                    
         16'b0010000000000000: newDist=PEout[111:104];
                    
         16'b0100000000000000: newDist=PEout[119:112];
                    
         16'b1000000000000000: newDist=PEout[127:120];
                    
                        
         endcase                        
       if((!PEready==0) || (CompStart==0)) newBest=0; 
    else if (newDist<BestDist) newBest=1;
else newBest=0;
end
endmodule    
