// 6-bit multiplier not implemented/tested yet
`ifdef OSFM_BITWIDTH_I_6
    `ifdef SHIFTDISTANCE_2 
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,2,1,1,0,1,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_4
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,2,0,1,1,1,0,0,0,1,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,2,1,1,1,1,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,2,1,1,1,1,0,0}; 
    `elsif SHIFTDISTANCE_6 
    `endif
`elsif OSFM_BITWIDTH_I_8
    `ifdef SHIFTDISTANCE_2 
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,1,0,2,1,1,0,1,0,0,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,3,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_4
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,2,0,1,1,1,0,0,0,1,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,3,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_6 
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,2,0,1,0,1,1,1,0,0,0,0,0,1,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,3,2,2,1,1,1,1,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,3,2,2,1,1,1,1,0,0};
    `elsif SHIFTDISTANCE_8 // doesnt make sense for 8bit
    `endif
`elsif OSFM_BITWIDTH_I_10
    `ifdef SHIFTDISTANCE_2
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,6,5,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,1,0,1,0,2,1,1,0,1,0,0,0,0,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,4,4,4,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,4,3,3,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_4 
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,6,5,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,1,0,2,0,1,1,1,0,0,0,1,0,0,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,4,4,4,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,4,3,3,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_6 
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,6,5,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,2,0,1,0,1,1,1,0,0,0,0,0,1,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,4,4,4,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,4,3,3,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_8
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,6,5,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,2,0,1,0,1,0,1,1,1,0,0,0,0,0,0,0,1,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,4,4,4,3,3,2,2,1,1,1,1,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,4,3,3,2,2,1,1,1,1,0,0};  
    `endif
`elsif OSFM_BITWIDTH_I_12
    `ifdef SHIFTDISTANCE_2
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,7,6,6,5,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,1,0,1,0,1,0,2,1,1,0,1,0,0,0,0,0,0,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,5,4,4,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,5,4,4,3,3,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_4
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,7,6,6,5,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,1,0,1,0,2,0,1,1,1,0,0,0,1,0,0,0,0,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,5,4,4,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,5,4,4,3,3,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_6 // doesnt make sense for 12bit
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,7,6,6,5,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,1,0,2,0,1,0,1,1,1,0,0,0,0,0,1,0,0,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,5,4,4,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,5,4,4,3,3,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_8 // doesnt make sense for 12bit
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,7,6,6,5,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,2,0,1,0,1,0,1,1,1,0,0,0,0,0,0,0,1,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,5,4,4,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,5,4,4,3,3,2,2,1,1,0,0,0,0}; 
    `endif
`elsif OSFM_BITWIDTH_I_14
    `ifdef SHIFTDISTANCE_2
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,8,7,7,6,6,5,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,1,0,1,0,1,0,1,0,2,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,6,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_4
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,8,7,7,6,6,5,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,1,0,1,0,1,0,2,0,1,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,6,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_6
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,8,7,7,6,6,5,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,1,0,1,0,2,0,1,0,1,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,6,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_8 
    `endif 
`elsif OSFM_BITWIDTH_I_16
    `ifdef SHIFTDISTANCE_2
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,9,8,8,7,7,6,6,5,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,1,0,1,0,1,0,1,0,1,0,2,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,7,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,7,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_4
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,9,8,8,7,7,6,6,5,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,1,0,1,0,1,0,1,0,2,0,1,1,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,7,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,7,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_6
    `elsif SHIFTDISTANCE_8 
    `endif 
`elsif OSFM_BITWIDTH_I_18
    `ifdef SHIFTDISTANCE_2
        localparam byte pps     [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,10,9,9,8,8,7,7,6,6,5,5,4,4,3,3,2,2,1};
        localparam byte plusone [2*`OSFM_BITWIDTH_I-1:0] = {1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,2,1,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
        localparam byte co_size [2*`OSFM_BITWIDTH_I-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,8,7,7,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0};
        localparam byte ci_size [2*`OSFM_BITWIDTH_I-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,8,7,7,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0,0};
    `elsif SHIFTDISTANCE_4
    `elsif SHIFTDISTANCE_6
    `elsif SHIFTDISTANCE_8
    `endif
`elsif OSFM_BITWIDTH_I_20
    `ifdef SHIFTDISTANCE_2
    `elsif SHIFTDISTANCE_4
    `elsif SHIFTDISTANCE_6
    `elsif SHIFTDISTANCE_8
    `endif
//`else
    //$error("Parameter `BITWIDTH_ is not defined, or unreachable from OSFM.svh");
`endif