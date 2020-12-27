//4-bit ripple carry adder
module ripple_carry_adder_4bit(A,B,Cin,Cout,sum);
  input [3:0]A,B;
  input Cin;
  output Cout;
  output [3:0]sum;
  wire x1,x2,x3;
  ripple_carry_adder rpd1(.a(A[0]),.b(B[0]),.cin(Cin),.cout(x1),.su(sum[0]));
  ripple_carry_adder rpd2(.a(A[1]),.b(B[1]),.cin(Cin),.cout(x2),.su(sum[1]));
  ripple_carry_adder rpd3(.a(A[2]),.b(B[2]),.cin(Cin),.cout(x3),.su(sum[2]));
  ripple_carry_adder rpd4(.a(A[3]),.b(B[3]),.cin(Cin),.cout(Cout),.su(sum[3]));
endmodule
module ripple_carry_adder(a,b,cin,cout,su);
  input a,b,cin;
  output su,cout;
  xor(su,a,b,cin);
  wire y1,y2,y3;
  and(y1,a,b);
  and(y2,cin,b);
  and(y3,a,cin);
  or(cout,y1,y2,y3);
endmodule
//The simulation code or test bench
module test1();
  reg [3:0]A,B;
  reg Cin;
  wire Cout;
  wire [3:0]sum;
  ripple_carry_adder_4bit a1(A,B,Cin,Cout,sum);
  initial
    begin
      $monitor("A=%b,B=%b,Cin=%b,Cout=%b,sum=%b",A,B,Cin,Cout,sum,$time);
      #0ns A=4'b1011;B=4'b1110;Cin=0;
      #10ns A=4'b0000;B=4'b0000;Cin=0;
    end
endmodule