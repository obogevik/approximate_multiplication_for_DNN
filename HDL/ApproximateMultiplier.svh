
`ifndef MULTIPLIER_PARAMETER_SVH
`define MULTIPLIER_PARAMETER_SVH

`define JFM
typedef enum {accBM, PTM, DTM, BM04, BM07, BM11, ABM2, PEBM, JFM, BBM, RAD, HLR, OSFM} Multiplier_type;
parameter Multiplier_type MULTIPLIER_TYPE = JFM; 

// Defines the input and output width of the multiplier implementation
`define BITWIDTH 8
`define BITWIDTH_8

// Defines only for OSFM: 
`define SHIFTDISTANCE 2 
`define SHIFTDISTANCE_2 
`define OSFM_BITWIDTH_I 6 // Determines the size of internal multiplier circuit as BITWIDTH-SHIFTDISTANCE
`define OSFM_BITWIDTH_I_6
`define OSFM_OUTPUTSHIFTER_VERSION_1 // 1 is 4-1mux and 2 is two 2-1mux in series. Version 1 gives best area

// Testbench defines
`define FSDBnn // If defined creates activity file
`define LOG_ERRORS // If defined logs errors in testbench

`endif //MULTIPLIER_PARAMETER_SVH