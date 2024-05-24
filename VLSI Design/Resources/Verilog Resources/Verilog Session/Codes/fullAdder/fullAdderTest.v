module test();

    reg a,b,c_in;
    wire c_out,sum,done;

    fullAdder uut(.a(a),.b(b),.c_in(c_in),.sum(sum),.c_out(c_out),.done(done));

    initial begin
		$dumpfile("fullAdder.vcd");
     	$dumpvars(0,test);
		// Initialize Inputs
		a = 1'b0;
		b = 1'b0;
        c_in = 1'b0;

		#80 $finish;//global reset
	end

	always #10 a=~a;
	always #20 b=~b;
    always #40 c_in=~c_in;

	always @(posedge done)
    $display("time =%0t , a = %b , b = %b , c_in = %b , sum = %b , c_out = %b",$time,a,b,c_in,sum,c_out);

endmodule