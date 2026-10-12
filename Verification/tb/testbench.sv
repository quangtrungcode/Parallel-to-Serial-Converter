import converter_pkg::*; 
import test_pkg::*;
module testbench;

  dut_if d_if();

  parallel_to_serial DUT(
    .clk(d_if.clk),
    .rst_n(d_if.rst_n),
    .valid(d_if.valid),
    .data_in(d_if.data_in),
    .TXD(d_if.TXD)
  );
  base_test bst;
  single_convert_test sct;
  multi_convert_test mct;
  initial begin
    d_if.clk = 0;
    forever #10 d_if.clk = ~d_if.clk;
  end
  
  initial begin
    d_if.rst_n = 0;
    d_if.valid = 0;
    d_if.data_in = 8'h0;
    
    bst = new(d_if);
    sct = new(d_if);
    mct = new(d_if);
    #30;
    d_if.rst_n = 1;
    if($test$plusargs("single_convert_test"))begin
       bst = sct;
    end else if($test$plusargs("multi_convert_test")) begin
       bst = mct;
    end
    bst.run_test();
  end
  initial begin
    #1000;
    $display("End of simulation");
    $finish;
  end

endmodule

