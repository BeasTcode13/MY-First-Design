module tb_up_down_counter;
    reg clk, reset, mode;
    wire [3:0] count;
    wire carry;

    // Instantiate the counter
    up_down_counter uut (
        .clk(clk),
        .reset(reset),
        .mode(mode),
        .count(count),
        .carry(carry)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $display("Time\tCLK\tRST\tMODE\tCOUNT\tCARRY");
        $display("----\t---\t---\t----\t-----\t-----");
        
        clk = 0;
        reset = 1;
        mode = 0;  // Up counter
        
        // Apply reset
        #10 reset = 0;
        
        // Test up counter (0-9)
        #100;
        
        // Switch to down counter
        mode = 1;
        #100;
        
        // Test down counter (9-0)
        #100;
        
        $finish;
    end
    
    // Monitor signals
    always @(posedge clk) begin
        $display("%0t\t%b\t%b\t%b\t%0d\t%b", $time, clk, reset, mode, count, carry);
    end
endmodule
