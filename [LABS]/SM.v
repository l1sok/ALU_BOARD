module SM(a, b, S, M, Pin, R, D, F, Pout);

input a, b, M, Pin;
input [3:0] S;
output R, D, F, Pout;

assign R = ((S[3]&a&b)|(S[2]&a&(~b)))^(a|(S[1]&(~b))|(S[0]&b))^(M&Pin);
assign D = (S[3]&a&b)|(S[2]&a&(~b));
assign F = a|(S[1]&(~b))|(S[0]&b);
assign Pout = D | (F&Pin);

endmodule