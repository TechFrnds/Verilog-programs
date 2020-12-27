//4bit carry look ahead adder
// Code your design here
module claa4bit(a,b,cin,cout,sum);
  input [3:0]a,b;
  output [3:0]sum;
  input cin;
  output cout;
  wire [3:0]g,p,c;
  assign g[0]=a[0]&b[0];
  	assign g[1]=a[1]&b[1];
 	assign g[2]=a[2]&b[2];
  	assign g[3]=a[3]&b[3];
  assign p[0]=a[0]^b[0];
  	assign p[1]=a[1]^b[1];
  	assign p[2]=a[2]^b[2];
  	assign p[3]=a[3]^b[3];
  assign c[0]=g[0]|(p[0]&cin);
  	assign c[1]=g[1]|(p[1]&c[0]);
  	assign c[2]=g[2]|(p[2]&c[1]);
  	assign c[3]=g[3]|(p[3]&c[2]);
  assign sum[0]=p[0]^cin;
  	assign sum[1]=p[1]^c[0];
  	assign sum[2]=p[2]^c[1];
  	assign sum[3]=p[3]^c[2];
  assign cout=c[3];
endmodule
//simulation code or testbench
// Code your testbench here
// or browse Examples
module test();
  reg [3:0]a,b;
  wire [3:0]sum;
  reg cin;
  wire cout;
  claa4bit a1(a,b,cin,cout,sum);
  initial
    begin
      $monitor("a=%b,b=%b,cin=%b,cout=%b,sum=%b",a,b,cin,cout,sum,$time);
      #0ns a=0;b=0;cin=0;
      #5ns a=4'b1101;b=4'b1110;cin=0;
    end
endmodule
  
  
  