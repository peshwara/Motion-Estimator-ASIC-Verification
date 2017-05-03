module topmodule (clock, start, R, s1, s2, motionx, motiony,AddressR, AddressS1, AddressS2);
input clock;
input start;
input[7:0] R,s1,s2;
output [3:0]motionx; //op
output [3:0]motiony; //op
output [7:0]AddressR; //tb
output [9:0]AddressS1; //tb
output [9:0]AddressS2;//tb

wire[15:0] s1s2mux;
wire[15:0] newDist;
wire[15:0] PEready;
wire       CompStart;
wire[3:0]  VectorX;
wire[3:0]  VectorY;
wire[7:0]  AddressR;
wire[9:0]  AddressS1;
wire[9:0]  AddressS2;
wire[7:0]  bestdist;
wire[8*16-1:0] peout; 
wire[7:0] Rpipe0,Rpipe1,Rpipe2,Rpipe3,Rpipe4,Rpipe5,Rpipe6,Rpipe7,Rpipe8,Rpipe9,Rpipe10,Rpipe11,Rpipe12,Rpipe13,Rpipe14 ;

control c (.clock(clock), .start(start), .S1S2mux(s1s2mux[15:0]), .NewDist(newDist[15:0]), .CompStart(CompStart), .PEready(PEready[15:0]), .VectorX(VectorX[3:0]), .VectorY(VectorY[3:0]), .AddressR(AddressR[7:0]), .AddressS1(AddressS1[9:0]), .AddressS2(AddressS2[9:0]));

Comparator comparator1 (.clock(clock), .CompStart(CompStart), .PEout(peout[8*16-1:0]) , .PEready(PEready[15:0]),.vectorX(VectorX[3:0]), .vectorY(VectorY[3:0]), .BestDist(bestdist[7:0]), .motionX(motionx[3:0]), .motionY(motiony[3:0]));

pe pe0(.clock(clock), .R(R[7:0]), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[0]), .newDist(newDist[0]), .Accumulate(peout [7 : 0]) , .Rpipe(Rpipe0));
pe pe1(.clock(clock), .R(Rpipe0), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[1]), .newDist(newDist[1]), .Accumulate(peout [15 : 8]) , .Rpipe(Rpipe1));
pe pe2(.clock(clock), .R(Rpipe1), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[2]), .newDist(newDist[2]), .Accumulate(peout [23 : 16]) , .Rpipe(Rpipe2));
pe pe3(.clock(clock), .R(Rpipe2), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[3]), .newDist(newDist[3]), .Accumulate(peout [31 : 24]) , .Rpipe(Rpipe3));
pe pe4(.clock(clock), .R(Rpipe3), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[4]), .newDist(newDist[4]), .Accumulate(peout [39 : 32]) , .Rpipe(Rpipe4));
pe pe5(.clock(clock), .R(Rpipe4), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[5]), .newDist(newDist[5]), .Accumulate(peout [47 : 40]) , .Rpipe(Rpipe5));
pe pe6(.clock(clock), .R(Rpipe5), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[6]), .newDist(newDist[6]), .Accumulate(peout [55 : 48]) , .Rpipe(Rpipe6));
pe pe7(.clock(clock), .R(Rpipe6), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[7]), .newDist(newDist[7]), .Accumulate(peout [63 : 56]) , .Rpipe(Rpipe7));
pe pe8(.clock(clock), .R(Rpipe7), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[8]), .newDist(newDist[8]), .Accumulate(peout [71 : 64]) , .Rpipe(Rpipe8));
pe pe9(.clock(clock), .R(Rpipe8), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[9]), .newDist(newDist[9]), .Accumulate(peout [79 : 72]) , .Rpipe(Rpipe9));
pe pe10(.clock(clock), .R(Rpipe9), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[10]), .newDist(newDist[10]), .Accumulate(peout [87 : 80]) , .Rpipe(Rpipe10));
pe pe11(.clock(clock), .R(Rpipe10), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[11]), .newDist(newDist[11]), .Accumulate(peout [95 : 88]) , .Rpipe(Rpipe11));
pe pe12(.clock(clock), .R(Rpipe11), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[12]), .newDist(newDist[12]), .Accumulate(peout [103 : 96]) , .Rpipe(Rpipe12));
pe pe13(.clock(clock), .R(Rpipe12), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[13]), .newDist(newDist[13]), .Accumulate(peout [111 : 104]) , .Rpipe(Rpipe13));
pe pe14(.clock(clock), .R(Rpipe13), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[14]), .newDist(newDist[14]), .Accumulate(peout [119 : 112]) , .Rpipe(Rpipe14));
pe pe15(.clock(clock), .R(Rpipe14), .s1(s1[7:0]), .s2(s2[7:0]), .s1s2mux(s1s2mux[15]), .newDist(newDist[15]), .Accumulate(peout [127 : 120]));

endmodule
