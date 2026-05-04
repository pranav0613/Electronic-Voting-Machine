module evm(
    input clk,
    input reset,
    input vote_btn1,
    input vote_btn2,
    input vote_btn3,
    output reg [7:0] count1,
    output reg [7:0] count2,
    output reg [7:0] count3
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count1 <= 0;
            count2 <= 0;
            count3 <= 0;
        end else begin
            if (vote_btn1) count1 <= count1 + 1;
            if (vote_btn2) count2 <= count2 + 1;
            if (vote_btn3) count3 <= count3 + 1;
        end
    end

    initial begin
    $display("Time\tcount1\tcount2\tcount3");  // header
    $monitor("%d\t%b\t%b\t%b", $time, count1, count2, count3);
end
endmodule
