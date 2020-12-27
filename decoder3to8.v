//3 to 8 decoder design
module Decoder(a,b,c,d0,d1,d2,d3,d4,d5,d6,d7);
	input a,b,c;
	output d0,d1,d2,d3,d4,d5,d6,d7;
	assign d0=(~a&~b&~c),
	d1=(~a&~b&c),
	d2=(~a&b&~c),
	d3=(~a&b&c),
	d4=(a&~b&~c),
	d5=(a&~b&c),
	d6=(a&b&~c),
	d7=(a&b&c);
endmodule
//simulation or testbench
module TestModule;
	reg a;
	reg b;
	reg c;
	wire d0;
	wire d1;
	wire d2;
	wire d3;
	wire d4;
	wire d5;
	wire d6;
	wire d7;
	Decoder uut (.a(a),.b(b),.c(c),.d0(d0),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7));
	initial begin
		a = 0;
		b = 0;
		c = 0;
		#100;
		a = 1;
		b = 0;
		c = 1;
		#100;
	end
endmodule