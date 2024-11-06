module ProgramCounter(in, out, clk);

	input logic [31:0]in;
	input logic clk;
	output logic [31:0]out;

	always_ff @ (posedge clk) begin
		out = in;
	end

endmodule
