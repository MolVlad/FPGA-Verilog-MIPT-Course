`timescale 1 ns / 100 ps

module testbench();

reg clk = 1'b0;

always begin
    #1 clk = ~clk;
end

wire divided_clk;
clk_div #(.x(12)) clk_div2(.clk(clk), .clk_out(divided_clk));

wire [3:0]anodes;

wire [7:0]seg;

hex_display hex_display(.clk(divided_clk), .data(data), .anodes(anodes), .seg(seg));

initial begin
	$dumpvars;      /* Open for dump of signals */
	#300000 $finish;
end

endmodule
