
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

module M_Inst(
    input [`XLEN-1:0] rs1, //input 1
    input [`XLEN-1:0] rs2, //input 2
    input ALUorCONTROL, //basically an enable
    input [`CONTROLOPS_SIZE-1:0] CONTROLop, //decides which instruction is being executed
    output reg [`XLEN-1:0] rd, //result register
    output reg Ovr_Flw, //Flag for if an overflow occurs
    output reg Zero //Flag for if division by zero occurs
    );
    wire [`XLEN-1:0] mul_result;
    wire [`XLEN-1:0] mulh_result;
    wire [`XLEN-1:0] mulhu_result;
    wire [`XLEN-1:0] mulhsu_result;
    wire [`XLEN-1:0] div_result;
    wire [`XLEN-1:0] divu_result;
    wire [`XLEN-1:0] rem_result;
    wire [`XLEN-1:0] remu_result;
    
    wire [(2*(`XLEN)-1):0] mulh_intermediate; //will use this to then shift aqnd store upper 32 bits
    wire[(2*(`XLEN)-1):0] mulhu_intermediate; //will use this to then shift aqnd store upper 32 bits
    wire[(2*(`XLEN)-1):0] mulhsu_intermediate; //will use this to then shift aqnd store upper 32 bits   
        
    assign mul_result = $signed(($signed(rs1)) * ($signed(rs2))); //stores lower 32 bits 
    
    assign mulh_intermediate = ($signed(rs1)) * ($signed(rs2));//stores all 64 bits
    assign mulh_result = mulh_intermediate >> 32; //now stores upper 32
    
    assign mulhu_intermediate = ($unsigned(rs1)) * ($unsigned(rs2)); //stores all 64 bits
    assign mulhu_result = mulhu_intermediate[(2*(`XLEN)-1):`XLEN]; //stores upper 32 bits
  
    assign mulhsu_intermediate = $signed(($signed(rs1)) * ($unsigned(rs2)));//stores all 64 bits
    assign mulhsu_result = mulhsu_intermediate >> 32; //stores upper 32 bits
    
    assign div_result = (rs2 == 0) ? -1 :
                        ( rs1 == -(2**(31)) && rs2 == -1'sd1 ) ?  -(2**(31)) :
                        $signed(($signed(rs1)) / ($signed(rs2)));//stores lower 32 bits;
    
    assign divu_result =(rs2 == 0) ? ((2**(32))-1) :
                        ($unsigned(rs1)) / ($unsigned(rs2));//stores lower 32 bits;
    
    assign rem_result = (rs2 == 0) ? rs1 :
                        ( rs1 == -(2**(31)) && rs2 == -1'sd1 ) ? 0 :
                        $signed(($signed(rs1)) % ($signed(rs2)));//stores lower 32 bits;
    
    assign remu_result = (rs2 == 0) ? rs1 :
                         ($unsigned(rs1)) % ($unsigned(rs2));//stores lower 32 bits;
    
    always @(*)
    begin
    if (ALUorCONTROL==1)
        begin
        case (CONTROLop)
                `CONTROL_OP_MUL : rd = mul_result;
                `CONTROL_OP_MULH : rd = mulh_result;
                `CONTROL_OP_MULHSU : rd = mulhsu_result;
                `CONTROL_OP_MULHU : rd = mulhu_result;
                `CONTROL_OP_DIV : rd = div_result;                      
                `CONTROL_OP_DIVU : rd = divu_result;
                `CONTROL_OP_REM : rd = rem_result;
                `CONTROL_OP_REMU : rd = remu_result;
                default: rd = {(`XLEN){1'b0}};          
            endcase
          if (rs2 == 0  && (CONTROLop==3'b100 || CONTROLop==3'b101 || CONTROLop==3'b110 || CONTROLop==3'b111))
                begin
                    Zero =1;
                    Ovr_Flw=0;
                end 
            else if (rs1 == 32'h80000000 && rs2 == 32'hFFFFFFFF  && (CONTROLop==3'b100 || CONTROLop==3'b110))
                begin
                    Zero =0;
                    Ovr_Flw=1;
                end 
            else
                begin
                    Zero =0;
                    Ovr_Flw=0;
                end 
         end
    end

endmodule

