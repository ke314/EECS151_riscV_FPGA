module alu #(
    parameter N = 32
)
(
    input [N-1:0] A,
    input [N-1:0] B,
    input [3:0] ALUSel,

    output [N-1:0] ALURes
);

reg [N-1:0] res;
always @(*) begin
    case (ALUSel)
        4'b0000: res = A + B;               // add
        4'b0001: res = A << B[4:0];         // sll
        4'b0011:
            if (A < B) begin
                res = {31'b0, 1'b1};                    // sltu
            end
        4'b0010:
            if ($signed(A) < $signed(B)) begin
                res = {31'b0, 1'b1};                    // slt
            end
        4'b0100: res = A ^ B;                           // xor
        4'b0101: res = A >> B[4:0];                     // srl
        4'b0110: res = A | B;                           // or
        4'b0111: res = A & B;                           // and
        // 4'b1000: // mul
        // 4'b1001: // mulh
        // 4'b1010:
        // 4'b1011: // mulhu
        4'b1100: res = A - B;                           // sub
        4'b1101: res = A >>> B[4:0];                    // sra
//<<<<<<< HEAD
//        4'b1111: res = B;                               // bsel
//	default: res = {32{1'bx}};			// undefined
//=======
        4'b1111: res = B;                               // bsel  
        default: res = {N{1'b0}};
//<<<<<<< HEAD
//>>>>>>> ce73806 (avr: CPU progress)
//=======
//>>>>>>> ce73806 (avr: CPU progress)
    endcase
end

assign ALURes = res;
endmodule
