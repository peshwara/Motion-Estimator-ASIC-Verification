module file_read;   
  reg [7:0] RAM [0:255];       
integer  i;
  initial 
begin

$readmemh("hex_data.hex", RAM);
      end
  initial begin               
    $display("data:");           
    for (i=0; i < 256; i=i+1)         
      $display("%d:%h",i,RAM[i]);           
  end   
        
endmodule  
