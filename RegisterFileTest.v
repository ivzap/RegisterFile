`timescale 1ns / 1ps


`define STRLEN 32
module RegisterFileTest_v;


   task passTest;
      input [63:0] actualOut, expectedOut;
      input [`STRLEN*8:0] testType;
      inout [7:0] 	  passed;
      
      if(actualOut == expectedOut) begin $display ("%s passed", testType); passed = passed + 1; end
      else $display ("%s failed: %d should be %d", testType, actualOut, expectedOut);
   endtask
   
   task allPassed;
      input [7:0] passed;
      input [7:0] numTests;
      
      if(passed == numTests) $display ("All tests passed");
      else $display("Some tests failed");
   endtask

   // Inputs
   reg [63:0] 	  BusW;
   reg [4:0] 	  RA;
   reg [4:0] 	  RB;
   reg [4:0] 	  RW;
   reg 		  RegWr;
   reg 		  Clk;
   reg [7:0] 	  passed;

   // Outputs
   wire [63:0] 	  BusA;
   wire [63:0] 	  BusB;

   
initial 
        begin
                $dumpfile("register.vcd");
                $dumpvars(0, RegisterFileTest_v);
        end

   // Instantiate the Unit Under Test (UUT)
   RegisterFile uut (
		     .BusA(BusA), 
		     .BusB(BusB), 
		     .BusW(BusW), 
		     .RA(RA), 
		     .RB(RB), 
		     .RW(RW), 
		     .RegWr(RegWr), 
		     .Clk(Clk)
		     );

   initial begin
      // Initialize Inputs
      BusW = 0;
      RA = 0;
      RB = 0;
      RW = 0;
      RegWr = 0;
      Clk = 1;
      passed = 0;
      
      #10;

      // Add stimulus here
      {RA, RB, RW, BusW, RegWr} = {5'd31, 5'd31, 5'd31, 64'h0, 1'b0};
      #10
	passTest(BusA, 64'd0, "Initial $0 Check 1", passed);
      passTest(BusB, 64'd0, "Initial $0 Check 2", passed);
      #10; Clk = 0; #10; Clk = 1;
      
      {RA, RB, RW, BusW, RegWr} = {5'd31, 5'd31, 5'd31, 64'h12345678, 1'b1};
      passTest(BusA, 64'd0, "Initial $0 Check 3", passed);
      passTest(BusB, 64'd0, "Initial $0 Check 4", passed);
      #10; Clk = 0; #10; Clk = 1;
      passTest(BusA, 64'd0, "$0 Stays 0 Check 1", passed);
      passTest(BusB, 64'd0, "$0 Stays 0 Check 2", passed);

      // This segment clears all registers
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd0, 64'h0, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd1, 64'h1, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd2, 64'h2, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd3, 64'h3, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd4, 64'h4, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd5, 64'h5, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd6, 64'h6, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd7, 64'h7, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd8, 64'h8, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd9, 64'h9, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd10, 64'd10, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd11, 64'd11, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd12, 64'd12, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd13, 64'd13, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd14, 64'd14, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd15, 64'd15, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd16, 64'd16, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd17, 64'd17, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd18, 64'd18, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd19, 64'd19, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd20, 64'd20, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd21, 64'd21, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd22, 64'd22, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd23, 64'd23, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd24, 64'd24, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd25, 64'd25, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd26, 64'd26, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd27, 64'd27, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd28, 64'd28, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd29, 64'd29, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd30, 64'd30, 1'b1};#10; Clk = 0; #10; Clk = 1;
      {RA, RB, RW, BusW, RegWr} = {5'd0, 5'd0, 5'd31, 64'd31, 1'b1};#10; Clk = 0; #10; Clk = 1;

	{RA, RB, RW, RegWr, BusW} = {5'b0, 5'b1, 5'b0, 1'b0, 64'b0};
	#4;
	passTest(BusA, 64'b0, "Initial Value Check 1", passed);
	passTest(BusB, 64'd1, "Initial Value Check 2", passed);
	#6; Clk = 0; #10; Clk = 1;
	passTest(BusA, 64'b0, "Value Stayed same 1", passed);
	passTest(BusB, 64'd1, "Value Stayed Same 1", passed);

	{RA, RB, RW, RegWr, BusW} = {5'd2, 5'd3, 5'd1, 1'b0, 64'h1000};
	#4;
	passTest(BusA, 64'd2, "Initial Value Check 1", passed);
	passTest(BusB, 64'd3, "Initial Value Check 2", passed);
	#6; Clk = 0; #10; Clk = 1;
	passTest(BusA, 64'd2, "Value Stayed same 1", passed);
	passTest(BusB, 64'd3, "Value Stayed Same 1", passed);

	{RA, RB, RW, RegWr, BusW} = {5'd4, 5'd5, 5'd0, 1'b1, 64'h1000};
	#4;
	passTest(BusA, 64'd4, "Initial Value Check 1", passed);
	passTest(BusB, 64'd5, "Initial Value Check 2", passed);
	#6; Clk = 0; #10; Clk = 1;
	passTest(BusA, 64'd4, "Value Stayed same 1", passed);
	passTest(BusB, 64'd5, "Value Stayed Same 1", passed);

	{RA, RB, RW, RegWr, BusW} = {5'd6, 5'd7, 5'hA, 1'b1, 64'h1010};
	#4;
	passTest(BusA, 64'd6, "Initial Value Check 1", passed);
	passTest(BusB, 64'd7, "Initial Value Check 2", passed);
	#6; Clk = 0; #10; Clk = 1;
	passTest(BusA, 64'd6, "Value Stayed same 1", passed);
	passTest(BusB, 64'd7, "Value Stayed Same 1", passed);

	{RA, RB, RW, RegWr, BusW} = {5'd8, 5'd9, 5'hB, 1'b1, 64'h103000};
	#4;
	passTest(BusA, 64'd8, "Initial Value Check 1", passed);
	passTest(BusB, 64'd9, "Initial Value Check 2", passed);
	#6; Clk = 0; #10; Clk = 1;
	passTest(BusA, 64'd8, "Value Stayed same 1", passed);
	passTest(BusB, 64'd9, "Value Stayed Same 1", passed);

	{RA, RB, RW, RegWr, BusW} = {5'hA, 5'hB, 5'hC, 1'b0, 64'b0};
	#4;
	passTest(BusA, 64'h1010, "Initial Value Check 1", passed);
	passTest(BusB, 64'h103000, "Initial Value Check 2", passed);
	#6; Clk = 0; #10; Clk = 1;
	passTest(BusA, 64'h1010, "Value Stayed same 1", passed);
	passTest(BusB, 64'h103000, "Value Stayed Same 1", passed);

	{RA, RB, RW, RegWr, BusW} = {5'hC, 5'hD, 5'hD, 1'b1, 64'hABCD};	
	#4;
	passTest(BusA, 64'hC, "Initial Value Check 1", passed);
	passTest(BusB, 64'hD, "Initial Value Check 2", passed);
	#6; Clk = 0; #10; Clk = 1;
	passTest(BusA, 64'hC, "Value Stayed same 1", passed);
	passTest(BusB, 64'hABCD, "Value Stayed Same 1", passed);

	{RA, RB, RW, RegWr, BusW} = {5'hE, 5'hF, 5'hE, 1'b0, 64'h9080009};
	#4;
	passTest(BusA, 64'hE, "Initial Value Check 1", passed);
	passTest(BusB, 64'hF, "Initial Value Check 2", passed);
	#6; Clk = 0; #10; Clk = 1;
	passTest(BusA, 64'hE, "Value Stayed same 1", passed);
	passTest(BusB, 64'hF, "Value Stayed Same 1", passed);


      allPassed(passed, 38);
   end
   
endmodule

