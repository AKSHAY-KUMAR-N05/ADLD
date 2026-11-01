//Design Code
module n_bit_comparator #(parameter N = 4) (
    input [N-1:0] A,
    input [N-1:0] B,
    output reg GT,
    output reg LT,
    output reg EQ
);

always @(*) begin
    if (A > B) begin
        GT = 1'b1;
        LT = 1'b0;
        EQ = 1'b0;
    end
    else if (A < B) begin
        GT = 1'b0;
        LT = 1'b1;
        EQ = 1'b0;
    end
    else begin
        GT = 1'b0;
        LT = 1'b0;
        EQ = 1'b1;
    end
end

endmodule
//Testbench Code
module tb;

parameter N = 4;
reg [N-1:0] A, B;
wire GT, LT, EQ;

n_bit_comparator #(N) dut (
    .A(A),
    .B(B),
    .GT(GT),
    .LT(LT),
    .EQ(EQ)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    $monitor("Time=%0t A=%b B=%b GT=%b LT=%b EQ=%b",
             $time, A, B, GT, LT, EQ);

    A = 4'b1010; B = 4'b0101; #10;
    A = 4'b0011; B = 4'b1001; #10;
    A = 4'b0110; B = 4'b0110; #10;
    A = 4'b1111; B = 4'b0001; #10;
    A = 4'b0000; B = 4'b1111; #10;

    $finish;
end

endmodule