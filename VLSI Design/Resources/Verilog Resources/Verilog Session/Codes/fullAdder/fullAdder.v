module fullAdder(a,b,c_in,sum,c_out,done);

    input a,b,c_in;
    output reg sum,c_out,done;

    always @ (*)
    begin
        done = 0;
        c_out = (a&b)|(a&c_in)|(b&c_in);
        sum = a^b^c_in;
        done = 1;
    end

endmodule