module test();

    reg a,b;
    wire carry,s,done;

    halfAdder uut(.a(a),.b(b),.s(s),.carry(carry),.done(done));

    initial begin
		$dumpfile("halfAdder.vcd");
     	$dumpvars(0,test);
		// Initialize Inputs
		a = 1'b0;
		b = 1'b0;

		#70 $finish;//global reset
	end

	always #10 a=~a;
	always #20 b=~b;

	always @(posedge done)
    $display( "time =%0t , a = %b , b = %b , s = %b , carry = %b",$time,a,b,s,carry);

endmodule