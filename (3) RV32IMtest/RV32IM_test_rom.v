`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2024 11:03:11 AM
// Design Name: 
// Module Name: M_Inst
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "archerdefs.v"

module RV32IM_Test_Rom(
    input [`ADDRLEN-1:0] addr,
	output [`XLEN-1:0] dataout
	);
	
  integer i;
  reg [7:0] rom_array [0:(2**(`ADDRLEN))-1];
  wire [(`ADDRLEN-1):0] word_addr;
  
  assign word_addr = {addr[(`ADDRLEN-1):2], 2'b00};
  assign dataout = {rom_array[word_addr+3], rom_array[word_addr+2], rom_array[word_addr+1], rom_array[word_addr]};
  
   initial 
   begin
       
    //0xFFF00093, addi x1 x0 -1
    rom_array[0]  = 8'h93;  
    rom_array[1]  = 8'h00;
    rom_array[2]  = 8'hF0;
    rom_array[3]  = 8'hFF;
    
    //0x80000137, lui x2 524288
    rom_array[4]  = 8'h37;
    rom_array[5]  = 8'h01;
    rom_array[6]  = 8'h00;
    rom_array[7]  = 8'h80;
    
    //0x00010113, addi x2 x2 0
    rom_array[8]  = 8'h13;
    rom_array[9]  = 8'h01;
    rom_array[10] = 8'h01;
    rom_array[11] = 8'h00;
    
    //0x800001B7, lui x3 524288
    rom_array[12] = 8'hB7;
    rom_array[13] = 8'h01;
    rom_array[14] = 8'h00;
    rom_array[15] = 8'h80;
    
    //0xFFF18193		addi x3 x3 -1
    rom_array[16] = 8'h93;
    rom_array[17] = 8'h81;
    rom_array[18] = 8'hF1;
    rom_array[19] = 8'hFF;
    
    //0x00400213		addi x4 x0 4
    rom_array[20] = 8'h13;
    rom_array[21] = 8'h02;
    rom_array[22] = 8'h40;
    rom_array[23] = 8'h00;
    
    //0x00200293		addi x5 x0 2
    rom_array[24] = 8'h93;
    rom_array[25] = 8'h02;
    rom_array[26] = 8'h20;
    rom_array[27] = 8'h00;
    
    //0xFFE00313		addi x6 x0 -2
    rom_array[28] = 8'h13;
    rom_array[29] = 8'h03;
    rom_array[30] = 8'hE0;
    rom_array[31] = 8'hFF;
    
    //0x025203B3		mul x7 x4 x5
    rom_array[32] = 8'hB3;
    rom_array[33] = 8'h03;
    rom_array[34] = 8'h52;
    rom_array[35] = 8'h02;
    
    //0x02620433		mul x8 x4 x6
    rom_array[36] = 8'h33;
    rom_array[37] = 8'h04;
    rom_array[38] = 8'h62;
    rom_array[39] = 8'h02;
    
    //0x026304B3		mul x9 x6 x6
    rom_array[40] = 8'hB3;
    rom_array[41] = 8'h04;
    rom_array[42] = 8'h63;
    rom_array[43] = 8'h02;
    
    //0x02020533		mul x10 x4 x0
    rom_array[44] = 8'h33;
    rom_array[45] = 8'h05;
    rom_array[46] = 8'h02;
    rom_array[47] = 8'h02;
    
    //0x025195B3		mulh x11 x3 x5
    rom_array[48] = 8'hB3;
    rom_array[49] = 8'h95;
    rom_array[50] = 8'h51;
    rom_array[51] = 8'h02;
    
    //0x02619633		mulh x12 x3 x6
    rom_array[52] = 8'h33;
    rom_array[53] = 8'h96;
    rom_array[54] = 8'h61;
    rom_array[55] = 8'h02;
    
    //0x022316B3		mulh x13 x6 x2
    rom_array[56] = 8'hB3;
    rom_array[57] = 8'h16;
    rom_array[58] = 8'h23;
    rom_array[59] = 8'h02;
    
    //0x02019733		mulh x14 x3 x0
    rom_array[60] = 8'h33;
    rom_array[61] = 8'h97;
    rom_array[62] = 8'h01;
    rom_array[63] = 8'h02;
    
    //0x0251A7B3		mulhsu x15 x3 x5
    rom_array[64] = 8'hB3;
    rom_array[65] = 8'hA7;
    rom_array[66] = 8'h51;
    rom_array[67] = 8'h02;
    
    //0x02332833		mulhsu x16 x6 x3
    rom_array[68] = 8'h33;
    rom_array[69] = 8'h28;
    rom_array[70] = 8'h33;
    rom_array[71] = 8'h02;
    
    //0x0201A8B3		mulhsu x17 x3 x0
    rom_array[72] = 8'hB3;
    rom_array[73] = 8'hA8;
    rom_array[74] = 8'h01;
    rom_array[75] = 8'h02;
    
    //0x0251B933		mulhu x18 x3 x5
    rom_array[76] = 8'h33;
    rom_array[77] = 8'hB9;
    rom_array[78] = 8'h51;
    rom_array[79] = 8'h02;
    
    //0x0201B9B3		mulhu x19 x3 x0
    rom_array[80] = 8'hB3;
    rom_array[81] = 8'hB9;
    rom_array[82] = 8'h01;
    rom_array[83] = 8'h02;
    
    //0x0251CA33		div x20 x3 x5
    rom_array[84] = 8'h33;
    rom_array[85] = 8'hCA;
    rom_array[86] = 8'h51;
    rom_array[87] = 8'h02;
    
    //0x0261CAB3		div x21 x3 x6
    rom_array[88] = 8'hB3;
    rom_array[89] = 8'hCA;
    rom_array[90] = 8'h61;
    rom_array[91] = 8'h02;
    
    //0x02234B33		div x22 x6 x2
    rom_array[92] = 8'h33;
    rom_array[93] = 8'h4B;
    rom_array[94] = 8'h23;
    rom_array[95] = 8'h02;
    
    //0x0201CBB3		div x23 x3 x0
    rom_array[96] = 8'hB3;
    rom_array[97] = 8'hCB;
    rom_array[98] = 8'h01;
    rom_array[99] = 8'h02;
    
    //0x02114C33		div x24 x2 x1
    rom_array[100] = 8'h33;
    rom_array[101] = 8'h4C;
    rom_array[102] = 8'h11;
    rom_array[103] = 8'h02;
    
    //0x0251DCB3		divu x25 x3 x5
    rom_array[104] = 8'hB3;
    rom_array[105] = 8'hDC;
    rom_array[106] = 8'h51;
    rom_array[107] = 8'h02;
    
    //0x0201DD33		divu x26 x3 x0
    rom_array[108] = 8'h33;
    rom_array[109] = 8'hDD;
    rom_array[110] = 8'h01;
    rom_array[111] = 8'h02;
    
    //0x0251EDB3		rem x27 x3 x5
    rom_array[112] = 8'hB3;
    rom_array[113] = 8'hED;
    rom_array[114] = 8'h51;
    rom_array[115] = 8'h02;
    
    //0x0261EE33		rem x28 x3 x6
    rom_array[116] = 8'h33;
    rom_array[117] = 8'hEE;
    rom_array[118] = 8'h61;
    rom_array[119] = 8'h02;
    
    //0x02236EB3		rem x29 x6 x2
    rom_array[120] = 8'hB3;
    rom_array[121] = 8'h6E;
    rom_array[122] = 8'h23;
    rom_array[123] = 8'h02;
    
    //0x0201EF33		rem x30 x3 x0
    rom_array[124] = 8'h33;
    rom_array[125] = 8'hEF;
    rom_array[126] = 8'h01;
    rom_array[127] = 8'h02;
    
    //0x02116FB3		rem x31 x2 x1
    rom_array[128] = 8'hB3;
    rom_array[129] = 8'h6F;
    rom_array[130] = 8'h11;
    rom_array[131] = 8'h02;
    
    //0x0251F633		remu x12 x3 x5
    rom_array[132] = 8'h33;
    rom_array[133] = 8'hF6;
    rom_array[134] = 8'h51;
    rom_array[135] = 8'h02;
    
    //0x0201F6B3		remu x13 x3 x0
    rom_array[136] = 8'hB3;
    rom_array[137] = 8'hF6;
    rom_array[138] = 8'h01;
    rom_array[139] = 8'h02;
    
    //0x00000073		ecall
    rom_array[140] = 8'h73;
    rom_array[141] = 8'h00;
    rom_array[142] = 8'h00;
    rom_array[143] = 8'h00;
   
   for (i = 144; i < 2**(`ADDRLEN); i = i + 1) 
    begin
      rom_array[i] = 8'h00;
   end
    
  end
endmodule