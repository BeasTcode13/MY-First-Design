module up_down_counter (
    input clk,
    input reset,
    input mode,        // 0 for up counter, 1 for down counter
    output reg [3:0] count,
    output reg carry   // Indicates when counter reaches limit
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'b0000;
        carry <= 1'b0;
    end else begin
        carry <= 1'b0;  // Default no carry
        
        if (mode == 1'b0) begin  // Up counter (0 to 9)
            if (count == 4'd9) begin
                count <= 4'b0000;
                carry <= 1'b1;
            end else begin
                count <= count + 1'b1;
            end
        end else begin  // Down counter (9 to 0)
            if (count == 4'b0000) begin
                count <= 4'd9;
                carry <= 1'b1;
            end else begin
                count <= count - 1'b1;
            end
        end
    end
end

endmodule
