module led (
    input sys_clk,
    input sys_rst_n,
    output reg led
);

reg [31:0] counter;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        counter <= 0;
        led <=0;
    end
    else begin
        if (counter < 24000000)  begin     // 0.5s delay
            counter <= counter + 1;
        end
        else begin
            counter <= 0;
            led <=~led;
        end    
    end
end


endmodule