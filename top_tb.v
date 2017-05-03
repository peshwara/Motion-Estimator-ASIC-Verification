`timescale 1ns/10ps
module timeunit;
   initial $timeformat(-9,1," ns",9);
endmodule


// Here is the testbench proper:
module toplevel_testbench_op ( ) ;

    // Test bench gets wires for all device under test (DUT) outputs:

   wire[3:0] 		  motionx;
   wire[3:0] 		  motiony;
   wire[7:0]		  AddressR;
   wire[9:0]		  AddressS1;
   wire[9:0]              AddressS2;
	
   // Regs for all DUT inputs:

   reg               clock;
   reg               start;
   reg[7:0]          R;
   reg[7:0]          s1;
   reg[7:0]          s2;
   reg[7:0]	     R_mem[255:0];
   reg[7:0]	     s1_mem[960:0];	
   reg[7:0]	     s2_mem[960:0];
   integer i,j;
   

           


    	
   topmodule dut (// (dut means device under test)
                // Outputs
		.motionx	       (motionx[3:0]),
		.motiony	       (motiony[3:0]),
                // Inputs
                .start		       (start),
                .clock                 (clock),
		.R		       (R[7:0]),
		.s1		       (s1[7:0]),
		.s2                    (s2[7:0]),
		.AddressR              (AddressR[7:0]),
		.AddressS1	       (AddressS1[9:0]),
		.AddressS2	       (AddressS2[9:0]));


  // Setup clk to automatically strobe with a period of 20.
   always #10 clock = ~clock;



   initial
     begin


   $readmemh("rmem_data.hex",R_mem);
   $readmemh("smem_data.hex", s1_mem);
   $readmemh("smem_data.hex", s2_mem);    


   assign R= 	R_mem[AddressR]	;
   assign s1=   s1_mem[AddressS1];
   assign s2=   s2_mem[AddressS2];

    for (i=0; i < 2; i=i+1)         
      $display("%d:%h",i,s1_mem[i]); 
       for (i=0; i < 2; i=i+1)         
      $display("%d:%h",i,s2_mem[i]); 

        // First setup up to monitor all inputs and outputs
       /* $monitor ("time=%5d ns, clock=%b, start=%b, motionx=%b, motiony=%b ,AddressR=%b, AddressS1=%b, AddressS2=%b", $time, clock, start, motionx[3:0], motiony[3:0],AddressR[7:0], AddressS1[9:0], AddressS2[9:0] );
*/
        // First initialize all registers
        clock = 1'b0;             // what happens to clk if we don't
        start = 1'b0;                        // set this?;
	

        @(posedge clock);#1;      // this  says wait for rising edge
	start= 1'b1;                        // of clk and one more tic (to prevent
	
        

     	#83320			   // Lets watch what happens after 7 cycles
       

        // We got this far so all tests passed.
        //$display("All tests completed sucessfully\n\n");

        $finish;
     end


   // This is to create a dump file for offline viewing.
   initial
     begin
        $dumpfile ("toplevel_op.dump");
        $dumpvars (0, toplevel_testbench_op);
     end // initial begin


endmodule // pe_testbench
