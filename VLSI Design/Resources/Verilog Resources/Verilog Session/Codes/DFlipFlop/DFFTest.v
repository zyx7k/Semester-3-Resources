module test();

    reg D,Clk;
    wire Q,done;

    DFF uut(.D(D),.Clk(Clk),.Q(Q),.done(done));

    initial begin
		$dumpfile("DFFTest.vcd");
     	$dumpvars(0,test);
		// Initialize Inputs
		D = 1'b0;
        Clk = 1'b0;

		#80 $finish;//global reset
	end

	always #10 D=~D;
	always #15 Clk=~Clk;

	always @(Clk)
    begin
        #1;
        $display("time =%0t , D = %b , Clk = %b , Q = %b",$time,D,Clk,Q);
    end

endmodule