 module Encoder(d0,d1,d2,d3,d4,d5,d6,d7,a,b,c);
	input d0,d1,d2,d3,d4,d5,d6,d7;
	output a,b,c;
	or(a,d4,d5,d6,d7);
	or(b,d2,d3,d6,d7);
	or(c,d1,d3,d5,d7);
endmodule

Testbench Code for 8:3 Encoder
module TestModule;
	reg d0;
	reg d1;
	reg d2;
	reg d3;
	reg d4;
	reg d5;
	reg d6;
	reg d7;
	wire a;
	wire b;
	wire c;
	Encoder uut (.d0(d0),.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7),.a(a),.b(b),.c(c));
	initial begin
		d0 = 0;
		d1 = 0;
		d2 = 0;
		d3 = 0;
		d4 = 0;
		d5 = 0;
		d6 = 0;
		d7 = 0;
		#100;
		d0 = 0;
		d1 = 0;
		d2 = 0;
		d3 = 1;
		d4 = 0;
		d5 = 0;
		d6 = 0;
		d7 = 0;
		#100;
	end
endmodule