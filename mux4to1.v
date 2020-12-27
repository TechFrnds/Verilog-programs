// Code your design here
mux 4 to 1 simple design
module task2(d0,d1,d2,d3,s0,s1,y);
  input d0,d1,d2,d3,s0,s1;
  output y;
  assign y=(d0&~s1&~s0)|(d1&~s1&s0)|(d2&s1&~s0)|(d3&s1&s0);
endmodule
//simulation code or testbench
// Code your testbench here
// or browse Examples
module test2;
  reg d0,d1,d2,d3,s1,s0;
  wire y;
  task2 a(.d0(d0),.d1(d1),.d2(d2),.d3(d3),.s1(s1),.s0(s0),.y(y));
  initial
    begin
      #0ns s1=0;s0=0;d0=0;
      #1ns s1=0;s0=0;d0=1;
      #2ns s1=0;s0=1;d1=0;
      #3ns s1=0;s0=1;d1=1;
      #4ns s1=1;s0=0;d2=0;
      #5ns s1=1;s0=0;d2=1;
      #6ns s1=1;s0=1;d3=0;
      #7ns s1=1;s0=1;d3=1;
    end
  initial
    $monitor("d0=%B,d1=%B,d2=%B,d3=%B,s1=%B,s0=%B,y=%B",d0,d1,d2,d3,s1,s0,y,$time);
endmodule
     