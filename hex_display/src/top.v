module top(
    input CLK,

    output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
    output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G, DS_DP
);

reg [15:0]data = 16'h1234;

wire [3:0]anodes;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~anodes;

wire [7:0]seg;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G, DS_DP} = seg;

clk_div #(.x(15)) clk_div(.clk(CLK), .clk_out(divided_clk));

hex_display hex_display(.clk(divided_clk), .data(data), .anodes(anodes), .seg(seg));

endmodule
