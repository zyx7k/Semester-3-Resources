module DFF(D,Clk,Q,done);

    input D,Clk;
    output reg Q,done;

    always @ (posedge Clk)
    begin
        done=0;
        Q=D;
        done=1;
    end

endmodule