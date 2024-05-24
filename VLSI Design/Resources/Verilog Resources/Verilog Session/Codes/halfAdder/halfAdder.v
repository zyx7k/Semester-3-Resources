`timescale 1ns / 1ps
module halfAdder(a,b,s,carry,done);

    input a,b;
    output reg carry,s,done;

    always @ (*)
    begin
        done = 0;
        carry = a&b;
        s = a^b;
        done = 1;
    end

endmodule