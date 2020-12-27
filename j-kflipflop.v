    //j-k flipflop design
    module jk_ff ( input j, input k, input clk, output q);  
      
       reg q;  
      
       always @ (posedge clk)  
          case ({j,k})  
             2'b00 :  q <= q;  
             2'b01 :  q <= 0;  
             2'b10 :  q <= 1;  
             2'b11 :  q <= ~q;  
          endcase  
    endmodule
    //testbench
        module tb_jk;  
       reg j;  
       reg k;  
       reg clk;  
      
       always #5 clk = ~clk;  
      
       jk_ff    jk0 ( .j(j),  
                      .k(k),  
                      .clk(clk),  
                      .q(q));  
      
       initial begin  
          j <= 0;  
          k <= 0;  
      
          #5 j <= 0;  
             k <= 1;  
          #20 j <= 1;  
              k <= 0;  
          #20 j <= 1;  
              k <= 1;  
          #20 $finish;  
       end  
      
       initial  
          $monitor ("j=%0d k=%0d q=%0d", j, k, q);  
    endmodule    