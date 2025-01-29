# **Archer RV32IM Processor with M Extension**  

## **Overview**  
This repository contains the Verilog implementation and testbenches for the **Archer RV32IM Processor**, which supports the **"M" ISA Extension** for integer multiplication and division. This project was developed as part of **EECE 321: Computer Organization** at the **American University of Beirut**.  

## **Features**  
- **Supports RV32IM instructions** (Multiplication and Division)  
- **Implements a dedicated hardware unit (`M_Inst.v`)** for handling M-extension instructions  
- **Detects Division by Zero and Overflow**  
- **Tested using Assembly & Machine Code**, validated with waveforms  
- **Fully integrated into Vivado for simulation and synthesis**  

---

## **Repository Structure**  

### **1. RTL Design Files**  
- `archer_rv32im.v` → Main processor module with added M-extension support  
- `M_Inst.v` → Dedicated multiplication & division unit  
- `archersdefs.v` → Defines key constants such as `CONTROLop`  

### **2. Testbenches**  
- `archer_rv32im_tb.v` → Testbench for verifying processor functionality  
- `M_Inst_tb.v` → Focused testbench for multiplication & division instructions  

### **3. ROM & Assembly Tests**  
- `RV32IM_Test_Rom.v` → ROM containing machine code for verification  
- `RV32IMtest.s` → Assembly file testing all multiplication & division cases  
- `RV32IMtest.o` → Compiled object file for execution  

### **4. Vivado Project Files**  
- `321proj_cmk19_laa100_Sunday.xpr` → Vivado project file  
- `321proj_cmk19_laa100_Sunday.srcs/` → Source files  
- `321proj_cmk19_laa100_Sunday.sim/` → Simulation files  
- `321proj_cmk19_laa100_Sunday.runs/` → Synthesis and implementation runs  

---

## **Instruction Set Support (M Extension)**  
The following RISC-V instructions are implemented and tested:  

| Instruction | Description |  
|------------|------------|  
| `mul` | Multiply two signed integers |  
| `mulh` | Multiply high part (signed × signed) |  
| `mulhsu` | Multiply high part (signed × unsigned) |  
| `mulhu` | Multiply high part (unsigned × unsigned) |  
| `div` | Signed integer division |  
| `divu` | Unsigned integer division |  
| `rem` | Signed remainder |  
| `remu` | Unsigned remainder |  

Division by zero and overflow cases are handled properly.

---

## **Testing & Validation**  
1. **EDA Playground Simulation**  
   - Each instruction was tested separately before integration.  
2. **Machine Code Execution (Venus Simulator)**  
   - The `RV32IMtest.s` assembly file was compiled, and its machine code was loaded into ROM.  
3. **Waveform Analysis in Vivado**  
   - The testbench verifies correctness using `Zero_Flag` and `Ovr_Flw_Flag` signals.  

---


## **How to Run the Project**  
1. **Open Vivado** and load `321proj_cmk19_laa100_Sunday.xpr`  
2. **Run Synthesis & Implementation**  
3. **Simulate using `archer_rv32im_tb.v`**  
4. **Verify outputs using waveforms**  

---

## **Future Work**  
- Expand to **RV64IM** for 64-bit support  
- Optimize **multiplication & division latency**  
- Implement **floating-point extensions (F extension)**  

