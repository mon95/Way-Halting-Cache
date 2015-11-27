
module D_ff (input clk, input reset, input regWrite, input decOut1b, input d, output reg q);
	always @ ( negedge clk )
	begin
	if ( reset == 1'b1 )
		q = 0;
	else
		if ( regWrite == 1'b1 && decOut1b == 1'b1 ) begin q=d; end
	end
endmodule

module D_ff_d (input clk, input reset, input regWrite, input decOut1b, input tbwrite, input Hit, input d, input init, output reg q);
	always @ ( negedge clk )
	begin
	if ( reset == 1'b1 )
		q = 0;
	else
		if ( Hit == 1'b0 ) 
		  begin
			 if ( regWrite == 1'b1 && tbwrite == 1'b1 ) begin q = init; end
			end
		else 
		  begin
			 if ( regWrite == 1'b1 && decOut1b == 1'b1 ) begin q=d; end
			end
	end
endmodule

module mux2to1_1bit(input in1, input in2, input sel, output reg muxOut );
  always @ ( in1 or in2 or sel )
  begin
    case ( sel )
      1'b0: muxOut = in1;
      1'b1: muxOut = in2;
    endcase
  end
endmodule

module mux2to1_8bits(input enable, input [7:0] in1, input [7:0] in2, input sel, output reg [7:0] muxOut );
  always @ ( in1 or in2 or sel )
  begin
    if ( enable )
      begin 
        case ( sel )
          1'b0: muxOut = in1;
          1'b1: muxOut = in2;
        endcase
      end
  end
endmodule

module mux2to1_23bits(input [22:0] in1, input [22:0] in2, input sel, output reg [22:0] muxOut );
  always @ ( in1 or in2 or sel )
  begin
    case ( sel )
      1'b0: muxOut = in1;
      1'b1: muxOut = in2;
    endcase
  end
endmodule

module mux2to1_256bits(input enable, input [255:0] in1, input [255:0] in2, input sel, output reg [255:0] muxOut );
  always @ ( in1 or in2 or sel )
  begin
    if(enable)
      begin
      case ( sel )
      1'b0: muxOut = in1;
      1'b1: muxOut = in2;
      endcase
      end
  end
endmodule

module mux32to1_1byte(input [255:0] in, input [4:0] sel, output reg [7:0] out );
  always @ ( in or sel )
  begin
    case ( sel )
      5'b00000 : out = in[7:0];
      5'b00001 : out = in[15:8];
      5'b00010 : out = in[23:16];
      5'b00011 : out = in[31:24];
      5'b00100 : out = in[39:32];
      5'b00101 : out = in[47:40];
      5'b00110 : out = in[55:48];
      5'b00111 : out = in[63:56];
      5'b01000 : out = in[71:64];
      5'b01001 : out = in[79:72];
      5'b01010 : out = in[87:80];
      5'b01011 : out = in[95:88];
      5'b01100 : out = in[103:96];
      5'b01101 : out = in[111:104];
      5'b01110 : out = in[119:112];
      5'b01111 : out = in[127:120];
      5'b10000 : out = in[135:128];
      5'b10001 : out = in[143:136];
      5'b10010 : out = in[151:144];
      5'b10011 : out = in[159:152];
      5'b10100 : out = in[167:160];
      5'b10101 : out = in[175:168];
      5'b10110 : out = in[183:176];
      5'b10111 : out = in[191:184];
      5'b11000 : out = in[199:192];
      5'b11001 : out = in[207:200];
      5'b11010 : out = in[215:208];
      5'b11011 : out = in[223:216];
      5'b11100 : out = in[231:224];
      5'b11101 : out = in[239:232];
      5'b11110 : out = in[247:240];
      5'b11111 : out = in[255:248];
    endcase   
  end
endmodule

module decoder4x16 (input [3:0] decIn, output reg [15:0] decOut);
	always @ ( decIn )
	 begin
	   case ( decIn )
			4'b0000: decOut=16'b0000000000000001; 
			4'b0001: decOut=16'b0000000000000010;
			4'b0010: decOut=16'b0000000000000100;
			4'b0011: decOut=16'b0000000000001000;
			4'b0100: decOut=16'b0000000000010000;
			4'b0101: decOut=16'b0000000000100000;
			4'b0110: decOut=16'b0000000001000000;
			4'b0111: decOut=16'b0000000010000000;
			4'b1000: decOut=16'b0000000100000000; 
			4'b1001: decOut=16'b0000001000000000;
			4'b1010: decOut=16'b0000010000000000;
			4'b1011: decOut=16'b0000100000000000;
			4'b1100: decOut=16'b0001000000000000;
			4'b1101: decOut=16'b0010000000000000;
			4'b1110: decOut=16'b0100000000000000;
			4'b1111: decOut=16'b1000000000000000;
	   endcase
	 end
endmodule

module decoder5x32 (input [4:0] decIn, output reg [31:0] decOut);
  always @ ( decIn )
	 begin
	   case ( decIn )
			5'b00000: decOut=32'b00000000000000000000000000000001; 
			5'b00001: decOut=32'b00000000000000000000000000000010;
			5'b00010: decOut=32'b00000000000000000000000000000100;
			5'b00011: decOut=32'b00000000000000000000000000001000;
			5'b00100: decOut=32'b00000000000000000000000000010000;
			5'b00101: decOut=32'b00000000000000000000000000100000;
			5'b00110: decOut=32'b00000000000000000000000001000000;
			5'b00111: decOut=32'b00000000000000000000000010000000;
			5'b01000: decOut=32'b00000000000000000000000100000000; 
			5'b01001: decOut=32'b00000000000000000000001000000000;
			5'b01010: decOut=32'b00000000000000000000010000000000;
			5'b01011: decOut=32'b00000000000000000000100000000000;
			5'b01100: decOut=32'b00000000000000000001000000000000;
			5'b01101: decOut=32'b00000000000000000010000000000000;
			5'b01110: decOut=32'b00000000000000000100000000000000;
			5'b01111: decOut=32'b00000000000000001000000000000000;
			5'b10000: decOut=32'b00000000000000010000000000000000; 
			5'b10001: decOut=32'b00000000000000100000000000000000;
			5'b10010: decOut=32'b00000000000001000000000000000000;
			5'b10011: decOut=32'b00000000000010000000000000000000;
			5'b10100: decOut=32'b00000000000100000000000000000000;
			5'b10101: decOut=32'b00000000001000000000000000000000;
			5'b10110: decOut=32'b00000000010000000000000000000000;
			5'b10111: decOut=32'b00000000100000000000000000000000;
			5'b11000: decOut=32'b00000001000000000000000000000000; 
			5'b11001: decOut=32'b00000010000000000000000000000000;
			5'b11010: decOut=32'b00000100000000000000000000000000;
			5'b11011: decOut=32'b00001000000000000000000000000000;
			5'b11100: decOut=32'b00010000000000000000000000000000;
			5'b11101: decOut=32'b00100000000000000000000000000000;
			5'b11110: decOut=32'b01000000000000000000000000000000;
			5'b11111: decOut=32'b10000000000000000000000000000000;
	   endcase
	 end
endmodule

module Comparator_Halt_Tag (input en, input [3:0] in1, input [3:0] in2, output reg outC );
  always @ ( en or in1 or in2 )
  begin
    if ( en == 1'b0 ) 
      outC = 1'b0;
    else
      begin
        if ( in1 == in2 )
          outC = 1'b1;
        else
          outC = 1'b0;
      end
  end
endmodule

module Comparator_Main_Tag (input en, input [18:0] in1, input [18:0] in2, output reg outC );
  always @ ( en or in1 or in2 )
  begin
    if ( en == 1'b0 ) 
      outC = 1'b0;
    else
      begin
        if ( in1 == in2 )
          outC = 1'b1;
        else
          outC = 1'b0;
      end
  end
endmodule

module encoder (input s0, input s1, output reg encOut, output reg Hit );
  always @ ( s0 or s1 )
  begin
    if ( s0 == 1'b1 && s1 == 1'b0 )
      begin
        encOut = 1'b0;
        Hit = 1'b1;
      end
    else if ( s0 == 1'b0 && s1 == 1'b1 )
      begin
        encOut = 1'b1;
        Hit = 1'b1;
      end
    else
      begin
        Hit = 1'b0;
      end
  end
endmodule

module mux16to1_1bit (input outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, outR8, outR9, outR10, outR11, outR12, outR13, outR14, outR15, input [3:0] Sel, output reg outBus );
	always @ ( outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or Sel )
	 begin
	 case ( Sel ) 
		4'b0000: outBus=outR0;
		4'b0001: outBus=outR1;
		4'b0010: outBus=outR2;
		4'b0011: outBus=outR3;
		4'b0100: outBus=outR4;
		4'b0101: outBus=outR5;
		4'b0110: outBus=outR6;
		4'b0111: outBus=outR7;
		4'b1000: outBus=outR8;
		4'b1001: outBus=outR9;
		4'b1010: outBus=outR10;
		4'b1011: outBus=outR11;
		4'b1100: outBus=outR12;
		4'b1101: outBus=outR13;
		4'b1110: outBus=outR14;
		4'b1111: outBus=outR15;
	 endcase
	 end
endmodule

module mux16to1_19bit (input [18:0] outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, outR8, outR9, outR10, outR11, outR12, outR13, outR14, outR15, input [3:0] Sel, output reg [18:0] outBus );
	always@( outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or Sel )
   begin
   case ( Sel )
		4'b0000: outBus=outR0;
		4'b0001: outBus=outR1;
		4'b0010: outBus=outR2;
		4'b0011: outBus=outR3;
		4'b0100: outBus=outR4;
		4'b0101: outBus=outR5;
		4'b0110: outBus=outR6;
		4'b0111: outBus=outR7;
		4'b1000: outBus=outR8;
		4'b1001: outBus=outR9;
		4'b1010: outBus=outR10;
		4'b1011: outBus=outR11;
		4'b1100: outBus=outR12;
		4'b1101: outBus=outR13;
		4'b1110: outBus=outR14;
		4'b1111: outBus=outR15;
	 endcase
	 end
endmodule

module mux16to1_4bits (input [3:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15, input [3:0] Sel, output reg [3:0] outBus );
	always@( outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or Sel)
	 begin
	 case ( Sel )
		4'b0000: outBus=outR0;
		4'b0001: outBus=outR1;
		4'b0010: outBus=outR2;
		4'b0011: outBus=outR3;
		4'b0100: outBus=outR4;
		4'b0101: outBus=outR5;
		4'b0110: outBus=outR6;
		4'b0111: outBus=outR7;
		4'b1000: outBus=outR8;
		4'b1001: outBus=outR9;
		4'b1010: outBus=outR10;
		4'b1011: outBus=outR11;
		4'b1100: outBus=outR12;
		4'b1101: outBus=outR13;
		4'b1110: outBus=outR14;
		4'b1111: outBus=outR15;
	 endcase
	 end
endmodule

module mux16to1_8bits (input [7:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15, input [3:0] Sel, output reg [7:0] outBus );
	always@( outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or Sel)
	 begin
	 case ( Sel )
		4'b0000: outBus=outR0;
		4'b0001: outBus=outR1;
		4'b0010: outBus=outR2;
		4'b0011: outBus=outR3;
		4'b0100: outBus=outR4;
		4'b0101: outBus=outR5;
		4'b0110: outBus=outR6;
		4'b0111: outBus=outR7;
		4'b1000: outBus=outR8;
		4'b1001: outBus=outR9;
		4'b1010: outBus=outR10;
		4'b1011: outBus=outR11;
		4'b1100: outBus=outR12;
		4'b1101: outBus=outR13;
		4'b1110: outBus=outR14;
		4'b1111: outBus=outR15;
	 endcase
	 end
endmodule

module mux32to1_8bits (input [7:0] outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, outR8, outR9, outR10, outR11, outR12, outR13, outR14, outR15, outR16, outR17, outR18, outR19, outR20, outR21, outR22, outR23, outR24, outR25, outR26, outR27, outR28, outR29, outR30, outR31, input [4:0] sel, output reg [7:0] outBus);
  always @ ( outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or outR16 or outR17 or outR18 or outR19 or outR20 or outR21 or outR22 or outR23 or outR24 or outR25 or outR26 or outR27 or outR28 or outR29 or outR30 or outR31 or sel )
    begin
	   case ( sel )
			5'b00000: outBus=outR0; 
			5'b00001: outBus=outR1;
			5'b00010: outBus=outR2;
			5'b00011: outBus=outR3;
			5'b00100: outBus=outR4;
			5'b00101: outBus=outR5;
			5'b00110: outBus=outR6;
			5'b00111: outBus=outR7;
			5'b01000: outBus=outR8; 
			5'b01001: outBus=outR9;
			5'b01010: outBus=outR10;
			5'b01011: outBus=outR11;
			5'b01100: outBus=outR12;
			5'b01101: outBus=outR13;
			5'b01110: outBus=outR14;
			5'b01111: outBus=outR15;
			5'b10000: outBus=outR16; 
			5'b10001: outBus=outR17;
			5'b10010: outBus=outR18;
			5'b10011: outBus=outR19;
			5'b10100: outBus=outR20;
			5'b10101: outBus=outR21;
			5'b10110: outBus=outR22;
			5'b10111: outBus=outR23;
			5'b11000: outBus=outR24; 
			5'b11001: outBus=outR25;
			5'b11010: outBus=outR26;
			5'b11011: outBus=outR27;
			5'b11100: outBus=outR28;
			5'b11101: outBus=outR29;
			5'b11110: outBus=outR30;
			5'b11111: outBus=outR31;
	   endcase
    end
endmodule

module mux16to1_32byte (input [255:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15, input [3:0] Sel, output reg [255:0] outBus );
	always @ ( outR0 or outR1 or outR2 or outR3 or outR4 or outR5 or outR6 or outR7 or outR8 or outR9 or outR10 or outR11 or outR12 or outR13 or outR14 or outR15 or Sel)
	 begin
	   case ( Sel )
				4'b0000: outBus=outR0;
				4'b0001: outBus=outR1;
				4'b0010: outBus=outR2;
				4'b0011: outBus=outR3;
				4'b0100: outBus=outR4;
				4'b0101: outBus=outR5;
				4'b0110: outBus=outR6;
				4'b0111: outBus=outR7;
				4'b1000: outBus=outR8;
				4'b1001: outBus=outR9;
				4'b1010: outBus=outR10;
				4'b1011: outBus=outR11;
				4'b1100: outBus=outR12;
				4'b1101: outBus=outR13;
				4'b1110: outBus=outR14;
				4'b1111: outBus=outR15;
	   endcase
	 end
endmodule

module register1bit (input clk, input reset, input regWrite, input decOut1b, input writeData, output outR);
  D_ff d0 ( clk, reset, regWrite, decOut1b, writeData, outR );
endmodule

module register4bit (input clk, input reset, input regWrite, input decOut1b, input [3:0] writeData, output [3:0] outR);
  D_ff d0 ( clk, reset, regWrite, decOut1b, writeData[0], outR[0] );
  D_ff d1 ( clk, reset, regWrite, decOut1b, writeData[1], outR[1] );
  D_ff d2 ( clk, reset, regWrite, decOut1b, writeData[2], outR[2] );
  D_ff d3 ( clk, reset, regWrite, decOut1b, writeData[3], outR[3] );
endmodule

module register19bit (input clk, input reset, input regWrite, input decOut1b, input [18:0] writeData, output [18:0] outR);
  D_ff d0  ( clk, reset, regWrite, decOut1b, writeData[0],  outR[0] );
  D_ff d1  ( clk, reset, regWrite, decOut1b, writeData[1],  outR[1] );
  D_ff d2  ( clk, reset, regWrite, decOut1b, writeData[2],  outR[2] );
  D_ff d3  ( clk, reset, regWrite, decOut1b, writeData[3],  outR[3] );
  D_ff d4  ( clk, reset, regWrite, decOut1b, writeData[4],  outR[4] );
  D_ff d5  ( clk, reset, regWrite, decOut1b, writeData[5],  outR[5] );
  D_ff d6  ( clk, reset, regWrite, decOut1b, writeData[6],  outR[6] );
  D_ff d7  ( clk, reset, regWrite, decOut1b, writeData[7],  outR[7] );
  D_ff d8  ( clk, reset, regWrite, decOut1b, writeData[8],  outR[8] );
  D_ff d9  ( clk, reset, regWrite, decOut1b, writeData[9],  outR[9] );
  D_ff d10 ( clk, reset, regWrite, decOut1b, writeData[10], outR[10] );
  D_ff d11 ( clk, reset, regWrite, decOut1b, writeData[11], outR[11] );
  D_ff d12 ( clk, reset, regWrite, decOut1b, writeData[12], outR[12] );
  D_ff d13 ( clk, reset, regWrite, decOut1b, writeData[13], outR[13] );
  D_ff d14 ( clk, reset, regWrite, decOut1b, writeData[14], outR[14] );
  D_ff d15 ( clk, reset, regWrite, decOut1b, writeData[15], outR[15] );
  D_ff d16 ( clk, reset, regWrite, decOut1b, writeData[16], outR[16] );
  D_ff d17 ( clk, reset, regWrite, decOut1b, writeData[17], outR[17] );
  D_ff d18 ( clk, reset, regWrite, decOut1b, writeData[18], outR[18] );
endmodule
 
module Halt_Tag_Array (input clk, input reset, input haltTagWrite, input [3:0] select, input [15:0] index, input [3:0] haltTagIn,
	output [3:0] haltTagOut0, haltTagOut1, haltTagOut2, haltTagOut3, haltTagOut4, haltTagOut5, haltTagOut6, haltTagOut7, haltTagOut8, haltTagOut9, haltTagOut10, haltTagOut11, haltTagOut12, haltTagOut13, haltTagOut14, haltTagOut15, haltdb);
	
	register4bit rht0  ( clk, reset, haltTagWrite, index[0],  haltTagIn, haltTagOut0 );
	register4bit rht1  ( clk, reset, haltTagWrite, index[1],  haltTagIn, haltTagOut1 );
	register4bit rht2  ( clk, reset, haltTagWrite, index[2],  haltTagIn, haltTagOut2 );
	register4bit rht3  ( clk, reset, haltTagWrite, index[3],  haltTagIn, haltTagOut3 );
	register4bit rht4  ( clk, reset, haltTagWrite, index[4],  haltTagIn, haltTagOut4 );
	register4bit rht5  ( clk, reset, haltTagWrite, index[5],  haltTagIn, haltTagOut5 );
	register4bit rht6  ( clk, reset, haltTagWrite, index[6],  haltTagIn, haltTagOut6 );
	register4bit rht7  ( clk, reset, haltTagWrite, index[7],  haltTagIn, haltTagOut7 );
	register4bit rht8  ( clk, reset, haltTagWrite, index[8],  haltTagIn, haltTagOut8 );
	register4bit rht9  ( clk, reset, haltTagWrite, index[9],  haltTagIn, haltTagOut9 );
	register4bit rht10 ( clk, reset, haltTagWrite, index[10], haltTagIn, haltTagOut10 );
	register4bit rht11 ( clk, reset, haltTagWrite, index[11], haltTagIn, haltTagOut11 );
	register4bit rht12 ( clk, reset, haltTagWrite, index[12], haltTagIn, haltTagOut12 );
	register4bit rht13 ( clk, reset, haltTagWrite, index[13], haltTagIn, haltTagOut13 );
	register4bit rht14 ( clk, reset, haltTagWrite, index[14], haltTagIn, haltTagOut14 );
	register4bit rht15 ( clk, reset, haltTagWrite, index[15], haltTagIn, haltTagOut15 );
	mux16to1_4bits haltmux ( haltTagOut0, haltTagOut1, haltTagOut2, haltTagOut3, haltTagOut4, haltTagOut5, haltTagOut6, haltTagOut7, haltTagOut8, haltTagOut9, haltTagOut10, haltTagOut11, haltTagOut12, haltTagOut13, haltTagOut14, haltTagOut15, select, haltdb );
	
endmodule

module Byte (input clk, input reset, input regWrite, input decOut1b, input tbwrite, input hit, input [7:0] writeData, input [7:0] missData, output [7:0] outR);
  
  D_ff_d d0 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[0], missData[0], outR[0] );
  D_ff_d d1 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[1], missData[1], outR[1] );
  D_ff_d d2 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[2], missData[2], outR[2] );
  D_ff_d d3 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[3], missData[3], outR[3] );
  D_ff_d d4 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[4], missData[4], outR[4] );
  D_ff_d d5 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[5], missData[5], outR[5] );
  D_ff_d d6 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[6], missData[6], outR[6] );
  D_ff_d d7 ( clk, reset, regWrite, decOut1b, tbwrite, hit, writeData[7], missData[7], outR[7] );

endmodule

module Data_32Byte (input clk, input reset, input dataWrite, input [4:0] selOffset, input [31:0] offset, input tbwrite, input hit, input [7:0] writeData, input [255:0] missData, output [255:0] outD, output [7:0] outByte);
	
	Byte b0  ( clk, reset, dataWrite, offset[0],  tbwrite, hit, writeData, missData[7:0],     outD[7:0]);
	Byte b1  ( clk, reset, dataWrite, offset[1],  tbwrite, hit, writeData, missData[15:8],    outD[15:8]);
	Byte b2  ( clk, reset, dataWrite, offset[2],  tbwrite, hit, writeData, missData[23:16],   outD[23:16]);
	Byte b3  ( clk, reset, dataWrite, offset[3],  tbwrite, hit, writeData, missData[31:24],   outD[31:24]);
	Byte b4  ( clk, reset, dataWrite, offset[4],  tbwrite, hit, writeData, missData[39:32],   outD[39:32]);
	Byte b5  ( clk, reset, dataWrite, offset[5],  tbwrite, hit, writeData, missData[47:40],   outD[47:40]);
	Byte b6  ( clk, reset, dataWrite, offset[6],  tbwrite, hit, writeData, missData[55:48],   outD[55:48]);
	Byte b7  ( clk, reset, dataWrite, offset[7],  tbwrite, hit, writeData, missData[63:56],   outD[63:56]);
	Byte b8  ( clk, reset, dataWrite, offset[8],  tbwrite, hit, writeData, missData[71:64],   outD[71:64]);
	Byte b9  ( clk, reset, dataWrite, offset[9],  tbwrite, hit, writeData, missData[79:72],   outD[79:72]);
	Byte b10 ( clk, reset, dataWrite, offset[10], tbwrite, hit, writeData, missData[87:80],   outD[87:80]);
	Byte b11 ( clk, reset, dataWrite, offset[11], tbwrite, hit, writeData, missData[95:88],   outD[95:88]);
	Byte b12 ( clk, reset, dataWrite, offset[12], tbwrite, hit, writeData, missData[103:96],  outD[103:96]);
	Byte b13 ( clk, reset, dataWrite, offset[13], tbwrite, hit, writeData, missData[111:104], outD[111:104]);
	Byte b14 ( clk, reset, dataWrite, offset[14], tbwrite, hit, writeData, missData[119:112], outD[119:112]);
	Byte b15 ( clk, reset, dataWrite, offset[15], tbwrite, hit, writeData, missData[127:120], outD[127:120]);
	Byte b16 ( clk, reset, dataWrite, offset[16], tbwrite, hit, writeData, missData[135:128], outD[135:128]);
	Byte b17 ( clk, reset, dataWrite, offset[17], tbwrite, hit, writeData, missData[143:136], outD[143:136]);
	Byte b18 ( clk, reset, dataWrite, offset[18], tbwrite, hit, writeData, missData[151:144], outD[151:144]);
	Byte b19 ( clk, reset, dataWrite, offset[19], tbwrite, hit, writeData, missData[159:152], outD[159:152]);
	Byte b20 ( clk, reset, dataWrite, offset[20], tbwrite, hit, writeData, missData[167:160], outD[167:160]);
	Byte b21 ( clk, reset, dataWrite, offset[21], tbwrite, hit, writeData, missData[175:168], outD[175:168]);
	Byte b22 ( clk, reset, dataWrite, offset[22], tbwrite, hit, writeData, missData[183:176], outD[183:176]);
	Byte b23 ( clk, reset, dataWrite, offset[23], tbwrite, hit, writeData, missData[191:184], outD[191:184]);
	Byte b24 ( clk, reset, dataWrite, offset[24], tbwrite, hit, writeData, missData[199:192], outD[199:192]);
	Byte b25 ( clk, reset, dataWrite, offset[25], tbwrite, hit, writeData, missData[207:200], outD[207:200]);
	Byte b26 ( clk, reset, dataWrite, offset[26], tbwrite, hit, writeData, missData[215:208], outD[215:208]);
	Byte b27 ( clk, reset, dataWrite, offset[27], tbwrite, hit, writeData, missData[223:216], outD[223:216]);
	Byte b28 ( clk, reset, dataWrite, offset[28], tbwrite, hit, writeData, missData[231:224], outD[231:224]);
	Byte b29 ( clk, reset, dataWrite, offset[29], tbwrite, hit, writeData, missData[239:232], outD[239:232]);
	Byte b30 ( clk, reset, dataWrite, offset[30], tbwrite, hit, writeData, missData[247:240], outD[247:240]);
	Byte b31 ( clk, reset, dataWrite, offset[31], tbwrite, hit, writeData, missData[255:248], outD[255:248]);
	mux32to1_8bits data32mux ( outD[7:0], outD[15:8], outD[23:16], outD[31:24], outD[39:32], outD[47:40], outD[55:48], outD[63:56], outD[71:64], outD[79:72], outD[87:80], outD[95:88], outD[103:96], outD[111:104], outD[119:112], outD[127:120], outD[135:128], outD[143:136], outD[151:144], outD[159:152], outD[167:160], outD[175:168], outD[183:176], outD[191:184], outD[199:192], outD[207:200], outD[215:208], outD[223:216], outD[231:224], outD[239:232], outD[247:240], outD[255:248], selOffset, outByte ); 

endmodule

module set (input clk, input reset, input mainTagWrite, input enWrite, input validWrite, input dirtyWrite, input dirtyIn, input hit, input [3:0] select, input [15:0] index, input [4:0] addOffset, input [31:0] offset, input [18:0] AddressTag, input [7:0] writeData, input [255:0] missData,
  output [18:0] mainTagOut0, mainTagOut1, mainTagOut2, mainTagOut3, mainTagOut4, mainTagOut5, mainTagOut6, mainTagOut7, mainTagOut8, mainTagOut9, mainTagOut10, mainTagOut11, mainTagOut12, mainTagOut13, mainTagOut14, mainTagOut15, maintagdb,
  output [255:0] outD0, outD1, outD2, outD3, outD4, outD5, outD6, outD7, outD8, outD9, outD10, outD11, outD12, outD13, outD14, outD15, outdb,
  output [7:0] outB0, outB1, outB2, outB3, outB4, outB5, outB6, outB7, outB8, outB9, outB10, outB11, outB12, outB13, outB14, outB15, outbdb,
  output validOut0, validOut1, validOut2, validOut3, validOut4, validOut5, validOut6, validOut7, validOut8, validOut9, validOut10, validOut11, validOut12, validOut13, validOut14, validOut15, validdb, 
  output dirtyOut0, dirtyOut1, dirtyOut2, dirtyOut3, dirtyOut4, dirtyOut5, dirtyOut6, dirtyOut7, dirtyOut8, dirtyOut9, dirtyOut10, dirtyOut11, dirtyOut12, dirtyOut13, dirtyOut14, dirtyOut15, dirtydb);
  
	register19bit rmt0  ( clk, reset, mainTagWrite, index[0],  AddressTag, mainTagOut0 );
	register19bit rmt1  ( clk, reset, mainTagWrite, index[1],  AddressTag, mainTagOut1 );
	register19bit rmt2  ( clk, reset, mainTagWrite, index[2],  AddressTag, mainTagOut2 );
	register19bit rmt3  ( clk, reset, mainTagWrite, index[3],  AddressTag, mainTagOut3 );
	register19bit rmt4  ( clk, reset, mainTagWrite, index[4],  AddressTag, mainTagOut4 );
	register19bit rmt5  ( clk, reset, mainTagWrite, index[5],  AddressTag, mainTagOut5 );
	register19bit rmt6  ( clk, reset, mainTagWrite, index[6],  AddressTag, mainTagOut6 );
	register19bit rmt7  ( clk, reset, mainTagWrite, index[7],  AddressTag, mainTagOut7 );
	register19bit rmt8  ( clk, reset, mainTagWrite, index[8],  AddressTag, mainTagOut8 );
	register19bit rmt9  ( clk, reset, mainTagWrite, index[9],  AddressTag, mainTagOut9 );
	register19bit rmt10 ( clk, reset, mainTagWrite, index[10], AddressTag, mainTagOut10 );
	register19bit rmt11 ( clk, reset, mainTagWrite, index[11], AddressTag, mainTagOut11 );
	register19bit rmt12 ( clk, reset, mainTagWrite, index[12], AddressTag, mainTagOut12 );
	register19bit rmt13 ( clk, reset, mainTagWrite, index[13], AddressTag, mainTagOut13 );
	register19bit rmt14 ( clk, reset, mainTagWrite, index[14], AddressTag, mainTagOut14 );
	register19bit rmt15 ( clk, reset, mainTagWrite, index[15], AddressTag, mainTagOut15 );
	mux16to1_19bit maintagmux ( mainTagOut0, mainTagOut1, mainTagOut2, mainTagOut3, mainTagOut4, mainTagOut5, mainTagOut6, mainTagOut7, mainTagOut8, mainTagOut9, mainTagOut10, mainTagOut11, mainTagOut12, mainTagOut13, mainTagOut14, mainTagOut15, select, maintagdb);
	
	Data_32Byte db0  (clk, reset, enWrite, addOffset, offset, index[0],  hit, writeData, missData, outD0,  outB0);
	Data_32Byte db1  (clk, reset, enWrite, addOffset, offset, index[1],  hit, writeData, missData, outD1,  outB1);
	Data_32Byte db2  (clk, reset, enWrite, addOffset, offset, index[2],  hit, writeData, missData, outD2,  outB2);
	Data_32Byte db3  (clk, reset, enWrite, addOffset, offset, index[3],  hit, writeData, missData, outD3,  outB3);
	Data_32Byte db4  (clk, reset, enWrite, addOffset, offset, index[4],  hit, writeData, missData, outD4,  outB4);
	Data_32Byte db5  (clk, reset, enWrite, addOffset, offset, index[5],  hit, writeData, missData, outD5,  outB5);
	Data_32Byte db6  (clk, reset, enWrite, addOffset, offset, index[6],  hit, writeData, missData, outD6,  outB6);
	Data_32Byte db7  (clk, reset, enWrite, addOffset, offset, index[7],  hit, writeData, missData, outD7,  outB7);
	Data_32Byte db8  (clk, reset, enWrite, addOffset, offset, index[8],  hit, writeData, missData, outD8,  outB8);
	Data_32Byte db9  (clk, reset, enWrite, addOffset, offset, index[9],  hit, writeData, missData, outD9,  outB9);
	Data_32Byte db10 (clk, reset, enWrite, addOffset, offset, index[10], hit, writeData, missData, outD10, outB10);
	Data_32Byte db11 (clk, reset, enWrite, addOffset, offset, index[11], hit, writeData, missData, outD11, outB11);
	Data_32Byte db12 (clk, reset, enWrite, addOffset, offset, index[12], hit, writeData, missData, outD12, outB12);
	Data_32Byte db13 (clk, reset, enWrite, addOffset, offset, index[13], hit, writeData, missData, outD13, outB13);
	Data_32Byte db14 (clk, reset, enWrite, addOffset, offset, index[14], hit, writeData, missData, outD14, outB14);
	Data_32Byte db15 (clk, reset, enWrite, addOffset, offset, index[15], hit, writeData, missData, outD15, outB15);
	mux16to1_32byte data32bytemux ( outD0, outD1, outD2, outD3, outD4, outD5, outD6, outD7, outD8, outD9, outD10, outD11, outD12, outD13, outD14, outD15, select, outdb );
	mux16to1_8bits data1bytemux ( outB0, outB1, outB2, outB3, outB4, outB5, outB6, outB7, outB8, outB9, outB10, outB11, outB12, outB13, outB14, outB15, select, outbdb );
	
	register1bit valid0  (clk, reset, validWrite, index[0],  1'b1, validOut0);
	register1bit valid1  (clk, reset, validWrite, index[1],  1'b1, validOut1);
	register1bit valid2  (clk, reset, validWrite, index[2],  1'b1, validOut2);
	register1bit valid3  (clk, reset, validWrite, index[3],  1'b1, validOut3);
	register1bit valid4  (clk, reset, validWrite, index[4],  1'b1, validOut4);
	register1bit valid5  (clk, reset, validWrite, index[5],  1'b1, validOut5);
	register1bit valid6  (clk, reset, validWrite, index[6],  1'b1, validOut6);
	register1bit valid7  (clk, reset, validWrite, index[7],  1'b1, validOut7);
	register1bit valid8  (clk, reset, validWrite, index[8],  1'b1, validOut8);
	register1bit valid9  (clk, reset, validWrite, index[9],  1'b1, validOut9);
	register1bit valid10 (clk, reset, validWrite, index[10], 1'b1, validOut10);
	register1bit valid11 (clk, reset, validWrite, index[11], 1'b1, validOut11);
	register1bit valid12 (clk, reset, validWrite, index[12], 1'b1, validOut12);
	register1bit valid13 (clk, reset, validWrite, index[13], 1'b1, validOut13);
	register1bit valid14 (clk, reset, validWrite, index[14], 1'b1, validOut14);
	register1bit valid15 (clk, reset, validWrite, index[15], 1'b1, validOut15);
	mux16to1_1bit validmux( validOut0, validOut1, validOut2, validOut3, validOut4, validOut5, validOut6, validOut7, validOut8, validOut9, validOut10, validOut11, validOut12, validOut13, validOut14, validOut15, select, validdb);
  
	register1bit dirty0  (clk, reset, dirtyWrite, index[0],  dirtyIn, dirtyOut0);
	register1bit dirty1  (clk, reset, dirtyWrite, index[1],  dirtyIn, dirtyOut1);
	register1bit dirty2  (clk, reset, dirtyWrite, index[2],  dirtyIn, dirtyOut2);
	register1bit dirty3  (clk, reset, dirtyWrite, index[3],  dirtyIn, dirtyOut3);
	register1bit dirty4  (clk, reset, dirtyWrite, index[4],  dirtyIn, dirtyOut4);
	register1bit dirty5  (clk, reset, dirtyWrite, index[5],  dirtyIn, dirtyOut5);
	register1bit dirty6  (clk, reset, dirtyWrite, index[6],  dirtyIn, dirtyOut6);
	register1bit dirty7  (clk, reset, dirtyWrite, index[7],  dirtyIn, dirtyOut7);
	register1bit dirty8  (clk, reset, dirtyWrite, index[8],  dirtyIn, dirtyOut8);
	register1bit dirty9  (clk, reset, dirtyWrite, index[9],  dirtyIn, dirtyOut9);
	register1bit dirty10 (clk, reset, dirtyWrite, index[10], dirtyIn, dirtyOut10);
	register1bit dirty11 (clk, reset, dirtyWrite, index[11], dirtyIn, dirtyOut11);
	register1bit dirty12 (clk, reset, dirtyWrite, index[12], dirtyIn, dirtyOut12);
	register1bit dirty13 (clk, reset, dirtyWrite, index[13], dirtyIn, dirtyOut13);
	register1bit dirty14 (clk, reset, dirtyWrite, index[14], dirtyIn, dirtyOut14);
	register1bit dirty15 (clk, reset, dirtyWrite, index[15], dirtyIn, dirtyOut15);
	mux16to1_1bit dirtymux ( dirtyOut0, dirtyOut1, dirtyOut2, dirtyOut3, dirtyOut4, dirtyOut5, dirtyOut6, dirtyOut7, dirtyOut8, dirtyOut9, dirtyOut10, dirtyOut11, dirtyOut12, dirtyOut13, dirtyOut14, dirtyOut15, select, dirtydb );

endmodule

module counter ( input clk, input reset, input counterWrite, input [3:0] select, input [15:0] index, input counterIn, output outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, outR8, outR9, outR10, outR11, outR12, outR13, outR14, outR15, outrdb);
	
	register1bit r0  (clk, reset, counterWrite, index[0],  counterIn, outR0);
	register1bit r1  (clk, reset, counterWrite, index[1],  counterIn, outR1);
	register1bit r2  (clk, reset, counterWrite, index[2],  counterIn, outR2);
	register1bit r3  (clk, reset, counterWrite, index[3],  counterIn, outR3);
	register1bit r4  (clk, reset, counterWrite, index[4],  counterIn, outR4);
	register1bit r5  (clk, reset, counterWrite, index[5],  counterIn, outR5);
	register1bit r6  (clk, reset, counterWrite, index[6],  counterIn, outR6);
	register1bit r7  (clk, reset, counterWrite, index[7],  counterIn, outR7);
	register1bit r8  (clk, reset, counterWrite, index[8],  counterIn, outR8);
	register1bit r9  (clk, reset, counterWrite, index[9],  counterIn, outR9);
	register1bit r10 (clk, reset, counterWrite, index[10], counterIn, outR10);
	register1bit r11 (clk, reset, counterWrite, index[11], counterIn, outR11);
	register1bit r12 (clk, reset, counterWrite, index[12], counterIn, outR12);
	register1bit r13 (clk, reset, counterWrite, index[13], counterIn, outR13);
	register1bit r14 (clk, reset, counterWrite, index[14], counterIn, outR14);
	register1bit r15 (clk, reset, counterWrite, index[15], counterIn, outR15);
	mux16to1_1bit countermux ( outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, outR8, outR9, outR10, outR11, outR12, outR13, outR14, outR15, select, outrdb );

endmodule

module cacheControl(input memRead, input memWrite, input waySelect, input Hit, 
  output reg tagWrite1, output reg tagWrite2, output reg counterWrite1, output reg counterIn1, output reg validWrite1, output reg validWrite2, output reg dirtyWrite1, output reg dirtyWrite2, output reg dirtyIn1, output reg dirtyIn2, output reg write1, output reg write2);
	
	always@(memRead or memWrite or waySelect or Hit)
	case(Hit)
		1'b1: 
			begin
				if(memRead == 1) 
					begin
						//Read - hit : counter doesn't change and de assert write signals
						counterWrite1 = 0; 
						counterIn1 = 0; 	// It's X (don't care)
//						counterWrite2 = 0; 
//						counterIn2 = 0; 	// It's X (don't care)
						write1 = 0;
						write2 = 0;
						dirtyWrite1 = 0;
						dirtyIn1 = 0; 		//It's X (don't care)
						validWrite1 = 0;
						dirtyWrite2 = 0;
						dirtyIn2 = 0; 		//It's X (don't care)
						validWrite2 = 0;
						tagWrite1 = 0;
						tagWrite2 = 0;
					end 
					
				else if (memWrite == 1) // Write Hit : Assert correct write signal
					begin 					
						if(waySelect == 0) // =>Way 1 , write hit
						  begin
							write1 = 1;
							dirtyIn1 = 1;
							dirtyWrite1 = 1;
							
							write2 = 0;
							dirtyIn2 = 0;
							dirtyWrite2 = 0;
							
							//X
							counterIn1 = 0;
							counterWrite1 = 0;
						//	counterIn2 = 0;
						//	counterWrite2 = 0;
							
							validWrite1 = 0;
							validWrite2 = 0;
							
							tagWrite1 = 0;
							tagWrite2 = 0;
					   	end
						
						else	//way 2 write hit
						  begin
							write2 = 1;
							dirtyIn2 = 1;
							dirtyWrite2 = 1;
							
							write1 = 0;
							dirtyIn1 = 0;
							dirtyWrite1 = 0;
							
							//X
						//	counterIn2 = 0;
						//	counterWrite2 = 0;
							counterIn1 = 0;
							counterWrite1 = 0;
							
							validWrite2 = 0;
							validWrite1 = 0;
							
							tagWrite1 = 0;
							tagWrite2 = 0;
						  end
					end  //end of else if
					
					else //neither is asserted ; hit
					    begin
							write2 = 0;
							dirtyIn2 = 0;
							dirtyWrite2 = 0;
							
							write1 = 0;
							dirtyIn1 = 0;
							dirtyWrite1 = 0;
							
							//X
							//counterIn2 = 0;
							//counterWrite2 = 0;
							counterIn1 = 0;
							counterWrite1 = 0;
							
							validWrite2 = 0;
							validWrite1 = 0;
							
							tagWrite1 = 0;
							tagWrite2 = 0;
					   end
			end // end of hit = 1 case	
			

		1'b0:		//Cache Miss
			begin
				if(memRead == 1) 
					begin
						//Read - miss : counter changes 
						if (waySelect == 0)  // way 1 ; read miss ; must replace block
							begin	
							counterWrite1 = 1; 
							counterIn1 = ~waySelect; 
							dirtyWrite1 = 1;
							validWrite1 = 1;
							write1 = 1;
							dirtyIn1 = 0;
							tagWrite1 = 1;
							//X
							//counterWrite2 = 0; 
							//counterIn2 = 0; 	
							write2 = 0;
							dirtyWrite2 = 0;
							dirtyIn2 = 0; 		
							validWrite2 = 0;
							tagWrite2 = 0;
							end
						else	
							begin 		//way 2 ; read miss; must replace block
							counterWrite1 = 1; 
							counterIn1 = ~waySelect; 
							//X
							dirtyWrite1 = 0;
							validWrite1 = 0;
							write1 = 0;
							dirtyIn1 = 0;
							tagWrite1 = 0;
				
				  
							//counterWrite2 = 1; 
							//counterIn2 = ~waySelect;	
							write2 = 1;
							dirtyWrite2 = 1;
							dirtyIn2 = 0; 		
							validWrite2 = 1;
							tagWrite2 = 1;
							end
					end 
					
				else if (memWrite == 1) // Write miss; 
					begin 					
						if(waySelect == 0) // =>Way 1 ; write miss; must replace
						begin	
							counterWrite1 = 1; 
							counterIn1 = ~waySelect; 
							dirtyWrite1 = 1;
							validWrite1 = 1;
							write1 = 1;
							dirtyIn1 = 0;
							tagWrite1 = 1;
							//X
							//counterWrite2 = 0; 
							//counterIn2 = 0; 	
							write2 = 0;
							dirtyWrite2 = 0;
							dirtyIn2 = 0; 		
							validWrite2 = 0;
							tagWrite2 = 0;
						end
						
						else	//way 2  ; write miss; must replace
						begin 		//way 2 ; read miss; must replace block
							counterWrite1 = 1; 
							counterIn1 = ~waySelect; 
							 
							dirtyWrite1 = 0;
							validWrite1 = 0;
							write1 = 0;
							dirtyIn1 = 0;
							tagWrite1 = 0;
				
							//counterWrite2 = 1; 
						//	counterIn2 = ~waySelect;
							write2 = 1;
							dirtyWrite2 = 1;
							dirtyIn2 = 0; 		
							validWrite2 = 1;
							tagWrite2 = 1;
							end
					end
					
					else //neither is asserted		; nothing happens
					begin
							counterWrite1 = 0; 
							counterIn1 = 0; 
							dirtyWrite1 = 0;
							validWrite1 = 0;
							write1 = 0;
							dirtyIn1 = 0;
							tagWrite1 = 0;
						//	counterWrite2 = 0; 
						//	counterIn2 = 0; 	
							write2 = 0;
							dirtyWrite2 = 0;
							dirtyIn2 = 0; 		
							validWrite2 = 0;
							tagWrite2 = 0;							
					end			
			end // end of hit = 0 case
	endcase
endmodule


module Cache ( input clk, input reset, input [7:0] byteIntoTheCache, input [255:0] blockIntoTheCache, input [22:0] tagIn, input [3:0] indexIn, input [4:0] offsetIn, input memWrite, input memRead, 
	output hit, output valid, output dirty, output waysel, output [22:0] tag_out, output [255:0] dataGettingReplaced, output [7:0] byteDataOutFromCache, output writeBackSignalToMainMemory );
  
  wire [15:0] decindexout;
  decoder4x16 decindex( indexIn, decindexout );
  
  wire [31:0] decoffsetout;
  decoder5x32 decoffset( offsetIn, decoffsetout );
  wire tagway1;
  wire [3:0] ht1out0, ht1out1, ht1out2, ht1out3, ht1out4, ht1out5, ht1out6, ht1out7, ht1out8, ht1out9, ht1out10, ht1out11, ht1out12, ht1out13, ht1out14, ht1out15, ht1outdb;
  Halt_Tag_Array hta1 ( clk, reset, tagway1, indexIn, decindexout, tagIn[3:0], 
    ht1out0, ht1out1, ht1out2, ht1out3, ht1out4, ht1out5, ht1out6, ht1out7, ht1out8, ht1out9, ht1out10, ht1out11, ht1out12, ht1out13, ht1out14, ht1out15, ht1outdb);
  
  wire tagway2;
  wire [3:0] ht2out0, ht2out1, ht2out2, ht2out3, ht2out4, ht2out5, ht2out6, ht2out7, ht2out8, ht2out9, ht2out10, ht2out11, ht2out12, ht2out13, ht2out14, ht2out15, ht2outdb;
  Halt_Tag_Array hta2 ( clk, reset, tagway2, indexIn, decindexout, tagIn[3:0],
    ht2out0, ht2out1, ht2out2, ht2out3, ht2out4, ht2out5, ht2out6, ht2out7, ht2out8, ht2out9, ht2out10, ht2out11, ht2out12, ht2out13, ht2out14, ht2out15, ht2outdb);
  
  wire out1comp0, out1comp1, out1comp2, out1comp3, out1comp4, out1comp5, out1comp6, out1comp7, out1comp8, out1comp9, out1comp10, out1comp11, out1comp12, out1comp13, out1comp14, out1comp15;
  Comparator_Halt_Tag ch1t0  ( 1'b1, tagIn[3:0], ht1out0,  out1comp0 );
	Comparator_Halt_Tag ch1t1  ( 1'b1, tagIn[3:0], ht1out1,  out1comp1 );
	Comparator_Halt_Tag ch1t2  ( 1'b1, tagIn[3:0], ht1out2,  out1comp2 );
	Comparator_Halt_Tag ch1t3  ( 1'b1, tagIn[3:0], ht1out3,  out1comp3 );
	Comparator_Halt_Tag ch1t4  ( 1'b1, tagIn[3:0], ht1out4,  out1comp4 );
	Comparator_Halt_Tag ch1t5  ( 1'b1, tagIn[3:0], ht1out5,  out1comp5 );
	Comparator_Halt_Tag ch1t6  ( 1'b1, tagIn[3:0], ht1out6,  out1comp6 );
	Comparator_Halt_Tag ch1t7  ( 1'b1, tagIn[3:0], ht1out7,  out1comp7 );
	Comparator_Halt_Tag ch1t8  ( 1'b1, tagIn[3:0], ht1out8,  out1comp8 );
	Comparator_Halt_Tag ch1t9  ( 1'b1, tagIn[3:0], ht1out9,  out1comp9 );
	Comparator_Halt_Tag ch1t10 ( 1'b1, tagIn[3:0], ht1out10, out1comp10 );
	Comparator_Halt_Tag ch1t11 ( 1'b1, tagIn[3:0], ht1out11, out1comp11 );
	Comparator_Halt_Tag ch1t12 ( 1'b1, tagIn[3:0], ht1out12, out1comp12 );
	Comparator_Halt_Tag ch1t13 ( 1'b1, tagIn[3:0], ht1out13, out1comp13 );
	Comparator_Halt_Tag ch1t14 ( 1'b1, tagIn[3:0], ht1out14, out1comp14 );
	Comparator_Halt_Tag ch1t15 ( 1'b1, tagIn[3:0], ht1out15, out1comp15 );
	
	wire out2comp0, out2comp1, out2comp2, out2comp3, out2comp4, out2comp5, out2comp6, out2comp7, out2comp8, out2comp9, out2comp10, out2comp11, out2comp12, out2comp13, out2comp14, out2comp15;
	Comparator_Halt_Tag ch2t0  ( 1'b1, tagIn[3:0], ht2out0,  out2comp0 );
	Comparator_Halt_Tag ch2t1  ( 1'b1, tagIn[3:0], ht2out1,  out2comp1 );
	Comparator_Halt_Tag ch2t2  ( 1'b1, tagIn[3:0], ht2out2,  out2comp2 );
	Comparator_Halt_Tag ch2t3  ( 1'b1, tagIn[3:0], ht2out3,  out2comp3 );
	Comparator_Halt_Tag ch2t4  ( 1'b1, tagIn[3:0], ht2out4,  out2comp4 );
	Comparator_Halt_Tag ch2t5  ( 1'b1, tagIn[3:0], ht2out5,  out2comp5 );
	Comparator_Halt_Tag ch2t6  ( 1'b1, tagIn[3:0], ht2out6,  out2comp6 );
	Comparator_Halt_Tag ch2t7  ( 1'b1, tagIn[3:0], ht2out7,  out2comp7 );
	Comparator_Halt_Tag ch2t8  ( 1'b1, tagIn[3:0], ht2out8,  out2comp8 );
	Comparator_Halt_Tag ch2t9  ( 1'b1, tagIn[3:0], ht2out9,  out2comp9 );
	Comparator_Halt_Tag ch2t10 ( 1'b1, tagIn[3:0], ht2out10, out2comp10 );
	Comparator_Halt_Tag ch2t11 ( 1'b1, tagIn[3:0], ht2out11, out2comp11 );
	Comparator_Halt_Tag ch2t12 ( 1'b1, tagIn[3:0], ht2out12, out2comp12 );
	Comparator_Halt_Tag ch2t13 ( 1'b1, tagIn[3:0], ht2out13, out2comp13 );
	Comparator_Halt_Tag ch2t14 ( 1'b1, tagIn[3:0], ht2out14, out2comp14 );
	Comparator_Halt_Tag ch2t15 ( 1'b1, tagIn[3:0], ht2out15, out2comp15 );
  
  wire counterwrite, counterin; 
  wire outc0, outc1, outc2, outc3, outc4, outc5, outc6, outc7, outc8, outc9, outc10, outc11, outc12, outc13, outc14, outc15, outcb;
  counter c ( clk, reset, counterwrite, indexIn, decindexout, counterin, outc0, outc1, outc2, outc3, outc4, outc5, outc6, outc7, outc8, outc9, outc10, outc11, outc12, outc13, outc14, outc15, outcb); 
  
  wire dataway1, validway1, dirtyway1, dirtyin1;
  wire [18:0] mt1out0, mt1out1, mt1out2, mt1out3, mt1out4, mt1out5, mt1out6, mt1out7, mt1out8, mt1out9, mt1out10, mt1out11, mt1out12, mt1out13, mt1out14, mt1out15, mt1outdb;
  wire [255:0] out1d0, out1d1, out1d2, out1d3, out1d4, out1d5, out1d6, out1d7, out1d8, out1d9, out1d10, out1d11, out1d12, out1d13, out1d14, out1d15, out1db;
  wire [7:0] out1b0, out1b1, out1b2, out1b3, out1b4, out1b5, out1b6, out1b7, out1b8, out1b9, out1b10, out1b11, out1b12, out1b13, out1b14, out1b15, out1bdb;
  wire v1out0, v1out1, v1out2, v1out3, v1out4, v1out5, v1out6, v1out7, v1out8, v1out9, v1out10, v1out11, v1out12, v1out13, v1out14, v1out15, v1outdb;
  wire d1out0, d1out1, d1out2, d1out3, d1out4, d1out5, d1out6, d1out7, d1out8, d1out9, d1out10, d1out11, d1out12, d1out13, d1out14, d1out15, d1outdb;
  set set1( clk, reset, tagway1, dataway1, validway1, dirtyway1, dirtyin1, hit, indexIn, decindexout, offsetIn, decoffsetout, tagIn[22:4], byteIntoTheCache, blockIntoTheCache,
    mt1out0, mt1out1, mt1out2, mt1out3, mt1out4, mt1out5, mt1out6, mt1out7, mt1out8, mt1out9, mt1out10, mt1out11, mt1out12, mt1out13, mt1out14, mt1out15, mt1outdb,
    out1d0, out1d1, out1d2, out1d3, out1d4, out1d5, out1d6, out1d7, out1d8, out1d9, out1d10, out1d11, out1d12, out1d13, out1d14, out1d15, out1db,
    out1b0, out1b1, out1b2, out1b3, out1b4, out1b5, out1b6, out1b7, out1b8, out1b9, out1b10, out1b11, out1b12, out1b13, out1b14, out1b15, out1bdb,
    v1out0, v1out1, v1out2, v1out3, v1out4, v1out5, v1out6, v1out7, v1out8, v1out9, v1out10, v1out11, v1out12, v1out13, v1out14, v1out15, v1outdb,
    d1out0, d1out1, d1out2, d1out3, d1out4, d1out5, d1out6, d1out7, d1out8, d1out9, d1out10, d1out11, d1out12, d1out13, d1out14, d1out15, d1outdb);
  
  wire dataway2, validway2, dirtyway2, dirtyin2;
  wire [18:0] mt2out0, mt2out1, mt2out2, mt2out3, mt2out4, mt2out5, mt2out6, mt2out7, mt2out8, mt2out9, mt2out10, mt2out11, mt2out12, mt2out13, mt2out14, mt2out15, mt2outdb;
  wire [255:0] out2d0, out2d1, out2d2, out2d3, out2d4, out2d5, out2d6, out2d7, out2d8, out2d9, out2d10, out2d11, out2d12, out2d13, out2d14, out2d15, out2db;
  wire [7:0] out2b0, out2b1, out2b2, out2b3, out2b4, out2b5, out2b6, out2b7, out2b8, out2b9, out2b10, out2b11, out2b12, out2b13, out2b14, out2b15, out2bdb;
  wire v2out0, v2out1, v2out2, v2out3, v2out4, v2out5, v2out6, v2out7, v2out8, v2out9, v2out10, v2out11, v2out12, v2out13, v2out14, v2out15, v2outdb;
  wire d2out0, d2out1, d2out2, d2out3, d2out4, d2out5, d2out6, d2out7, d2out8, d2out9, d2out10, d2out11, d2out12, d2out13, d2out14, d2out15, d2outdb;
  set set2( clk, reset, tagway2, dataway2, validway2, dirtyway2, dirtyin2, hit, indexIn, decindexout, offsetIn, decoffsetout, tagIn[22:4], byteIntoTheCache, blockIntoTheCache,
    mt2out0, mt2out1, mt2out2, mt2out3, mt2out4, mt2out5, mt2out6, mt2out7, mt2out8, mt2out9, mt2out10, mt2out11, mt2out12, mt2out13, mt2out14, mt2out15, mt2outdb,  
    out2d0, out2d1, out2d2, out2d3, out2d4, out2d5, out2d6, out2d7, out2d8, out2d9, out2d10, out2d11, out2d12, out2d13, out2d14, out2d15, out2db,
    out2b0, out2b1, out2b2, out2b3, out2b4, out2b5, out2b6, out2b7, out2b8, out2b9, out2b10, out2b11, out2b12, out2b13, out2b14, out2b15, out2bdb,
    v2out0, v2out1, v2out2, v2out3, v2out4, v2out5, v2out6, v2out7, v2out8, v2out9, v2out10, v2out11, v2out12, v2out13, v2out14, v2out15, v2outdb,
    d2out0, d2out1, d2out2, d2out3, d2out4, d2out5, d2out6, d2out7, d2out8, d2out9, d2out10, d2out11, d2out12, d2out13, d2out14, d2out15, d2outdb);
  
  Comparator_Main_Tag cm1t0  ( decindexout[0]  & out1comp0,  tagIn[22:4], mt1out0,  outm1comp0 );
	Comparator_Main_Tag cm1t1  ( decindexout[1]  & out1comp1,  tagIn[22:4], mt1out1,  outm1comp1 );
	Comparator_Main_Tag cm1t2  ( decindexout[2]  & out1comp2,  tagIn[22:4], mt1out2,  outm1comp2 );
	Comparator_Main_Tag cm1t3  ( decindexout[3]  & out1comp3,  tagIn[22:4], mt1out3,  outm1comp3 );
	Comparator_Main_Tag cm1t4  ( decindexout[4]  & out1comp4,  tagIn[22:4], mt1out4,  outm1comp4 );
	Comparator_Main_Tag cm1t5  ( decindexout[5]  & out1comp5,  tagIn[22:4], mt1out5,  outm1comp5 );
	Comparator_Main_Tag cm1t6  ( decindexout[6]  & out1comp6,  tagIn[22:4], mt1out6,  outm1comp6 );
	Comparator_Main_Tag cm1t7  ( decindexout[7]  & out1comp7,  tagIn[22:4], mt1out7,  outm1comp7 );
	Comparator_Main_Tag cm1t8  ( decindexout[8]  & out1comp8,  tagIn[22:4], mt1out8,  outm1comp8 );
	Comparator_Main_Tag cm1t9  ( decindexout[9]  & out1comp9,  tagIn[22:4], mt1out9,  outm1comp9 );
	Comparator_Main_Tag cm1t10 ( decindexout[10] & out1comp10, tagIn[22:4], mt1out10, outm1comp10 );
	Comparator_Main_Tag cm1t11 ( decindexout[11] & out1comp11, tagIn[22:4], mt1out11, outm1comp11 );
	Comparator_Main_Tag cm1t12 ( decindexout[12] & out1comp12, tagIn[22:4], mt1out12, outm1comp12 );
	Comparator_Main_Tag cm1t13 ( decindexout[13] & out1comp13, tagIn[22:4], mt1out13, outm1comp13 );
	Comparator_Main_Tag cm1t14 ( decindexout[14] & out1comp14, tagIn[22:4], mt1out14, outm1comp14 );
	Comparator_Main_Tag cm1t15 ( decindexout[15] & out1comp15, tagIn[22:4], mt1out15, outm1comp15 );
  
  Comparator_Main_Tag cm2t0  ( decindexout[0]  & out2comp0,  tagIn[22:4], mt2out0,  outm2comp0 );
	Comparator_Main_Tag cm2t1  ( decindexout[1]  & out2comp1,  tagIn[22:4], mt2out1,  outm2comp1 );
	Comparator_Main_Tag cm2t2  ( decindexout[2]  & out2comp2,  tagIn[22:4], mt2out2,  outm2comp2 );
	Comparator_Main_Tag cm2t3  ( decindexout[3]  & out2comp3,  tagIn[22:4], mt2out3,  outm2comp3 );
	Comparator_Main_Tag cm2t4  ( decindexout[4]  & out2comp4,  tagIn[22:4], mt2out4,  outm2comp4 );
	Comparator_Main_Tag cm2t5  ( decindexout[5]  & out2comp5,  tagIn[22:4], mt2out5,  outm2comp5 );
	Comparator_Main_Tag cm2t6  ( decindexout[6]  & out2comp6,  tagIn[22:4], mt2out6,  outm2comp6 );
	Comparator_Main_Tag cm2t7  ( decindexout[7]  & out2comp7,  tagIn[22:4], mt2out7,  outm2comp7 );
	Comparator_Main_Tag cm2t8  ( decindexout[8]  & out2comp8,  tagIn[22:4], mt2out8,  outm2comp8 );
	Comparator_Main_Tag cm2t9  ( decindexout[9]  & out2comp9,  tagIn[22:4], mt2out9,  outm2comp9 );
	Comparator_Main_Tag cm2t10 ( decindexout[10] & out2comp10, tagIn[22:4], mt2out10, outm2comp10 );
	Comparator_Main_Tag cm2t11 ( decindexout[11] & out2comp11, tagIn[22:4], mt2out11, outm2comp11 );
	Comparator_Main_Tag cm2t12 ( decindexout[12] & out2comp12, tagIn[22:4], mt2out12, outm2comp12 );
	Comparator_Main_Tag cm2t13 ( decindexout[13] & out2comp13, tagIn[22:4], mt2out13, outm2comp13 );
	Comparator_Main_Tag cm2t14 ( decindexout[14] & out2comp14, tagIn[22:4], mt2out14, outm2comp14 );
	Comparator_Main_Tag cm2t15 ( decindexout[15] & out2comp15, tagIn[22:4], mt2out15, outm2comp15 );
	
	wire encout;
	encoder enc ( outm1comp0 | outm1comp1 | outm1comp2 | outm1comp3 | outm1comp4 | outm1comp5 | outm1comp6 | outm1comp7 | outm1comp8 | outm1comp9 | outm1comp10 | outm1comp11 | outm1comp12 | outm1comp13 | outm1comp14 | outm1comp15, 
	 outm2comp0 | outm2comp1 | outm2comp2 | outm2comp3 | outm2comp4 | outm2comp5 | outm2comp6 | outm2comp7 | outm2comp8 | outm2comp9 | outm2comp10 | outm2comp11 | outm2comp12 | outm2comp13 | outm2comp14 | outm2comp15, 
	 encout, hit);
	
	mux2to1_1bit themux ( outcb, encout, hit, waysel );
	
	cacheControl cctrl( memRead, memWrite, waysel, hit, 
	 tagway1, tagway2, counterwrite, counterin, validway1, validway2, dirtyway1, dirtyway2, dirtyin1, dirtyin2, dataway1, dataway2);

  mux2to1_1bit validfinmux ( v1outdb, v2outdb, waysel, valid );
  mux2to1_1bit dirtyfinmux ( d1outdb, d2outdb, waysel, dirty );
  mux2to1_8bits bytefinmux ( memRead, out1bdb, out2bdb, waysel, byteDataOutFromCache);
  mux2to1_23bits tagfinmux ( { mt1outdb, ht1outdb}, {mt2outdb, ht2outdb}, waysel, tag_out);
  mux2to1_256bits byte32finmux ( 1'b1, out1db, out2db, waysel, dataGettingReplaced);
  mux2to1_1bit writeBackSignalToMainMemory1( 1'b0, 1'b1, ~hit && dirty, writeBackSignalToMainMemory);
endmodule

module cacheTestbench;
  
  reg clk;
  reg reset;
  // Input signals to the cache module
  // This is data that is to be fed into the cache. (Assume this comes from memory)
  // In case of a miss, this is the data that replaces the old data in the cache
  reg [255:0] blockIntoTheCache;
  
  reg [7:0] byteIntoTheCache;
  
  // Physical address(32-b) gets split and taken as tag-index-offset inside the cache
  // reg [31:0] physicalAddressToCache;

  // IF SPLIT INTO TAG INDEX OFFSET OVER HERE(instead of inside the cache module), we can read four bytes by just changing the offset 
  // in the test bench. 
  reg [22:0] tagIn;
  reg [3:0] indexIn;
  reg [4:0] offsetIn;

  // Signal indicating that some data is to be written to the cache at [physical address] (since write back policy) 
  // This is when the dirty bit is made one inside the cache
  reg memWrite;    
  // Signal indicating that data at [physical address] is to be read from the cache
  reg memRead;
  // Outputs from the cache module
  // these should be ouput depending on what is being accessed inside the cache
  wire hit;   // shows hit or miss
  wire dirty; // shows whether block is modified
  wire valid;   // to know if data was replaced because it was invalid or because of no hit wrt to the tag
  wire waysel;
  wire [22:0] tag_out;   // This is to be displayed to indicate which location in memory is to be accessed for an actual write back operation to the memory
  wire [255:0] dataGettingReplaced;   // The 32 B of data that is getting replaced in the cache
  wire [7:0] byteDataOutFromCache;
  wire writeBackSignalToMainMemory;
  Cache cache_1(.clk(clk), .reset(reset), .byteIntoTheCache(byteIntoTheCache), .blockIntoTheCache(blockIntoTheCache), .tagIn(tagIn), .indexIn(indexIn), .offsetIn(offsetIn), .memWrite(memWrite), .memRead(memRead), .hit(hit), .valid(valid), .dirty(dirty), .tag_out(tag_out), .waysel(waysel), .dataGettingReplaced(dataGettingReplaced), .byteDataOutFromCache(byteDataOutFromCache), .writeBackSignalToMainMemory(writeBackSignalToMainMemory));
  
  always
    #5 clk=~clk;
  initial
    begin
      clk=0; reset=1;
      #10  reset=0;                              // t = 10 : reset = 0
      
      #10                                        // t = 20 : Should be a cache miss at set 1 (since, invalid) 
      
      /*
      1. Cache Miss (READ) Set 1  (Data gets written to way1)
      physicalAddressToCache = 32'h00_11_22_33; 
      READ MISS - must take a block from memory and read from that block in the cache
      */
      memRead = 1;  
      memWrite = 0;
      tagIn = 23'b0000_0000_0001_0001_0010_001;
      indexIn = 4'b0_001;
      offsetIn = 5'b1_0011;                         // offset = 19 => EE should be printed
      
      //32 B data (that is actually supposed to be in the memory at the above address)  
      blockIntoTheCache = 256'hAA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_22;
      
      //byteIntoTheCache is a don't care as it is a memRead signal
      byteIntoTheCache = 8'd0;
     
       /*
       2.  Cache Hit (READ) way1, set1 
         physicalAddressToCache = 32'h00_11_22_33;
       */
      #30                                            // t = 50 : Should be a cache hit in way 1 at set 1
      memRead = 1;  
      memWrite = 0; 
      tagIn = 23'b0000_0000_0001_0001_0010_001;     // Same tag and different offset
      indexIn = 4'b0_001;
      offsetIn = 5'b0_0000;                         // Offset = 0 => 22 should be printed
            
      /*
      3.  Cache miss (READ) way2, set1
        physicalAddressToCache = 32'h10_11_22_33;  Note: New 'tag' with same index
      */
      
      #30                                            // t = 80 : Should be a cache miss in way 2 at set 1 (since invalid)
      memRead = 1;  
      memWrite = 0;
          
      tagIn = 23'b1000_0000_0001_0001_0010_001;
      indexIn = 4'b0_001;
      offsetIn = 5'b0_0000;                             // This must take the new data and print FF
      
      #5                                                // Data is fed in late ; Check if this works
      
      //Feed in the 32 B data (that is actually supposed to be in the memory at the above address) because it is a miss
      blockIntoTheCache = 256'hDD_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_FF;
      
      
      
      //#5 byteIntoTheCache = 8'h17;
      #30                                               // t = 120
      /*
      4. Cache Hit (Write) ; way 1 ; set 1
       t = 110 : Should be a cache hit and byteIntoTheCache(=33) should be written into the cache; dirty = 1 
       
       At this point it won't be written into memory because we have a write-back policy 
       (Only gets written to memory if dirty=1 and hit=0(i.e., cache miss) 
       
       The values shown are only to monitor the inside of the cache.
       */ 
      memRead = 0;      
      memWrite = 1;
      //physicalAddressToCache = 32'h00_11_22_33;
      tagIn = 23'b0000_0000_0001_0001_0010_001;
      indexIn = 4'b0_001;
      offsetIn = 5'b0_0000;
      //#5 byteIntoTheCache = 8'h17;
      #5
      
      #25                                           // t = 140
      /*
       5. Cache miss (Write) ; way 2 - set 1
          physicalAddressToCache = 32'h10_11_22_33;  Note: New 'tag' with same index      
      */
      memRead = 0;  
      memWrite = 1;
          
      tagIn = 23'b1110_0000_0001_0001_0010_111;         // Changing the last 3 bits of the tag to check halt-tag array functionality
      indexIn = 4'b0_001;
      offsetIn = 5'b1_1100;                             // This must take the new data and write the byteIntoTheCacheValue
      
      //Feed in the 32 B data (that is actually supposed to be in the memory at the above address) because it is a miss
      blockIntoTheCache = 256'h77_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_99;
      
      // Trying to write a word into the cache
      #5 byteIntoTheCache = 8'h18; offsetIn = 5'b1_1101;   // t = 150
      #15 byteIntoTheCache = 8'h19; offsetIn = 5'b1_1110;   // t = 160
      #10 byteIntoTheCache = 8'h20; offsetIn = 5'b1_1111;   // t = 170
      
      
      #30                                                   // t = 200
      /*
      6. Cache miss (Read) ; set 1 ; To demonstrate FIFO replacement; 
         Way 1 side should be replaced(first-in) because data in way2 was the last-in  
         Also dirty bit was set previously because of a write hit => Write-Back must happen (miss&&dirty == 1)
      */
      
      memRead = 1;  
      memWrite = 0;
          
      tagIn = 23'b1111_0000_0001_0001_1111_111;
      indexIn = 4'b0_001;
      offsetIn = 5'b0_0001;  
       
      //Feed in the 32 B data (that is actually supposed to be in the memory at the above address) because it is a miss
      blockIntoTheCache = 256'h55_66_44_00_00_00_11_22_AA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_88_99;

 
        /*
      7. Cache miss (Read) ; set 1 ; To demonstrate FIFO replacement; 
         Way 2 side should be replaced(first-in) because data in way1 was the last-in  (previous operation)
         Also dirty bit was set previously because of a write hit => Write-Back must happen (miss&&dirty == 1)
      */
      #30                                           //t = 230
      memRead = 1;  
      memWrite = 0;
          
      tagIn = 23'b1111_1111_0001_1111_1111_111;
      indexIn = 4'b0_001;
      offsetIn = 5'b0_0000;  
       
      //Feed in the 32 B data (that is actually supposed to be in the memory at the above address) because it is a miss
      blockIntoTheCache = 256'h00_00_00_00_00_00_11_22_AA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_22_AA_BB_CC_DD_EE_00_11_11;
       
      #50 $finish; 
    end
    
endmodule

