//`ifdef PTM
`ifdef BITWIDTH_8
    localparam byte pps     [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,5,4,4,3,3,2,2,1};
    localparam byte plusone [2*`BITWIDTH-1:0] = {1,0,1,0,1,0,1,1,1,0,0,0,0,0,0,0};
    localparam byte co_size [2*`BITWIDTH-1:0] = {0,0,1,1,2,2,3,3,3,2,2,1,1,0,0,0};
    localparam byte ci_size [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,3,2,2,1,1,0,0,0,0};
`elsif BITWIDTH_10
    localparam byte pps     [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,6,5,5,4,4,3,3,2,2,1};
    localparam byte plusone [2*`BITWIDTH-1:0] = {1,0,1,0,1,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0};
    localparam byte co_size [2*`BITWIDTH-1:0] = {0,0,1,1,2,2,3,3,4,4,4,3,3,2,2,1,1,0,0,0};
    localparam byte ci_size [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,4,3,3,2,2,1,1,0,0,0,0};
`elsif BITWIDTH_12
    localparam byte pps     [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,7,6,6,5,5,4,4,3,3,2,2,1};
    localparam byte plusone [2*`BITWIDTH-1:0] = {1,0,1,0,1,0,1,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte co_size [2*`BITWIDTH-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,5,4,4,3,3,2,2,1,1,0,0,0};
    localparam byte ci_size [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,5,4,4,3,3,2,2,1,1,0,0,0,0};
`elsif BITWIDTH_14
    localparam byte pps     [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,8,7,7,6,6,5,5,4,4,3,3,2,2,1};
    localparam byte plusone [2*`BITWIDTH-1:0] = {1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte co_size [2*`BITWIDTH-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,6,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0};
    localparam byte ci_size [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0,0};
`elsif BITWIDTH_16
    localparam byte pps     [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,9,8,8,7,7,6,6,5,5,4,4,3,3,2,2,1};
    localparam byte plusone [2*`BITWIDTH-1:0] = {1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte co_size [2*`BITWIDTH-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,7,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0};
    localparam byte ci_size [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,7,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0,0};
`elsif BITWIDTH_18
    localparam byte pps     [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,10,9,9,8,8,7,7,6,6,5,5,4,4,3,3,2,2,1};
    localparam byte plusone [2*`BITWIDTH-1:0] = {1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte co_size [2*`BITWIDTH-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,8,7,7,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0};
    localparam byte ci_size [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,8,7,7,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0,0};
`elsif BITWIDTH_20
    localparam byte pps     [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,11,10,10,9,9,8,8,7,7,6,6,5,5,4,4,3,3,2,2,1};
    localparam byte plusone [2*`BITWIDTH-1:0] = {1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte co_size [2*`BITWIDTH-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,9,8,8,7,7,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0};
    localparam byte ci_size [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,9,8,8,7,7,6,6,5,5,4,4,3,3,2,2,1,1,0,0,0,0};
//`else
    //$error("Parameter `BITWIDTH_ is not defined, or unreachable from PTM.svh");
`endif
//`endif //PTM