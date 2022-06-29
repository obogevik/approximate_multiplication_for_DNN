//`ifdef DTM
`ifdef BITWIDTH_8
    localparam byte pps     [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,0,0,0,0,0,0,0,0};
    localparam byte plusone [2*`BITWIDTH-1:0] = {1,0,1,0,1,0,1,1,0,0,0,0,0,0,0,0};
    localparam byte co_size [2*`BITWIDTH-1:0] = {0,0,1,1,2,2,2,2,0,0,0,0,0,0,0,0};
    localparam byte ci_size [2*`BITWIDTH-1:0] = {0,1,1,2,2,2,2,0,0,0,0,0,0,0,0,0};
`elsif BITWIDTH_10
    localparam byte pps     [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,0,0,0,0,0,0,0,0,0,0};
    localparam byte plusone [2*`BITWIDTH-1:0] = {1,0,1,0,1,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0};
    localparam byte co_size [2*`BITWIDTH-1:0] = {0,0,1,1,2,2,3,3,3,2,0,0,0,0,0,0,0,0,0,0};
    localparam byte ci_size [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,3,2,0,0,0,0,0,0,0,0,0,0,0};
`elsif BITWIDTH_12
    localparam byte pps     [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte plusone [2*`BITWIDTH-1:0] = {1,0,1,0,1,0,1,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte co_size [2*`BITWIDTH-1:0] = {0,0,1,1,2,2,3,3,4,4,4,3,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte ci_size [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,4,3,0,0,0,0,0,0,0,0,0,0,0,0,0};
`elsif BITWIDTH_14
    localparam byte pps     [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte plusone [2*`BITWIDTH-1:0] = {1,0,1,0,1,0,1,0,1,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte co_size [2*`BITWIDTH-1:0] = {0,0,1,1,2,2,3,3,4,4,4,4,4,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte ci_size [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,4,4,4,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
`elsif BITWIDTH_16
    localparam byte pps     [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte plusone [2*`BITWIDTH-1:0] = {1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte co_size [2*`BITWIDTH-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,5,5,5,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte ci_size [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,5,5,5,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
`elsif BITWIDTH_18
    localparam byte pps     [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte plusone [2*`BITWIDTH-1:0] = {1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte co_size [2*`BITWIDTH-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,6,6,6,6,6,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte ci_size [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,6,6,6,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
`elsif BITWIDTH_20
    localparam byte pps     [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte plusone [2*`BITWIDTH-1:0] = {1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte co_size [2*`BITWIDTH-1:0] = {0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,7,7,7,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    localparam byte ci_size [2*`BITWIDTH-1:0] = {0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,7,7,7,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
//`else
    //$error("Parameter `BITWIDTH_ is not defined, or unreachable from DTM.svh");
`endif
//`endif //DTM