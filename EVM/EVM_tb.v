`timescale 1ns/1ps

module tb_evm;
    reg clk = 0;
    reg reset;
    reg vote_btn1, vote_btn2, vote_btn3;
    wire [7:0] count1, count2, count3;

    evm uut (
        .clk(clk),
        .reset(reset),
        .vote_btn1(vote_btn1),
        .vote_btn2(vote_btn2),
        .vote_btn3(vote_btn3),
        .count1(count1),
        .count2(count2),
        .count3(count3)
    );

    always #5 clk = ~clk; 

    initial begin
        // Dump waveform
        $dumpfile("evm_wave.vcd");
        $dumpvars(0, tb_evm);

        $display("Time(ns)\tCount1\tCount2\tCount3");  
        $monitor("%0t\t\t%0d\t%0d\t%0d", $time, count1, count2, count3);

        // Initial reset
        reset = 1; vote_btn1 = 0; vote_btn2 = 0; vote_btn3 = 0;
        #10 reset = 0;

        // Candidate 1 gets 5 votes
        repeat (5) begin
            #10 vote_btn1 = 1; #10 vote_btn1 = 0;
        end

        // Candidate 2 gets 3 votes
        repeat (3) begin
            #10 vote_btn2 = 1; #10 vote_btn2 = 0;
        end

        // Candidate 3 gets 7 votes
        repeat (7) begin
            #10 vote_btn3 = 1; #10 vote_btn3 = 0;
        end

        // Simultaneous votes: Candidate 1 & 3 get 2 more votes each
        repeat (2) begin
            #10 vote_btn1 = 1; vote_btn3 = 1; #10 vote_btn1 = 0; vote_btn3 = 0;
        end

        #20 $finish;
    end
endmodule
