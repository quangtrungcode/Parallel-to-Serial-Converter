/*class driver;
  mailbox #(packet) s2d_mb;
  virtual dut_if vif;

  function new(mailbox #(packet) s2d, virtual dut_if vif);
    this.s2d_mb = s2d;
    this.vif = vif;
  endfunction

  task run();
    vif.valid = 0;
    forever begin
      packet pkt;
      s2d_mb.get(pkt);

      $display("# %0d: [driver] Get packet from stimulus", $time);
      repeat(2) @(posedge vif.clk);
      #1;
      vif.valid = 1;
      vif.data_in = pkt.data;
      $display("# %0d: [driver] Drive DUT with data in %h", $time, pkt.data);

      @(posedge vif.clk);
      #1;
      vif.valid = 0;
      repeat(6) @(posedge vif.clk);
    end
  endtask
endclass
*/

class driver;
  mailbox #(packet) s2d_mb;
  virtual dut_if dut_vif;

  function new(mailbox #(packet) s2d, virtual dut_if dut_vif);
    this.s2d_mb = s2d;
    this.dut_vif = dut_vif;
  endfunction 
  
  task run();
    while(1) begin
      packet pkt;
      s2d_mb.get(pkt);
      $display("#%0d: [driver] Get packet from stimulus", $time);
      repeat(2) @(posedge dut_vif.clk);
      #1;
      $display("#%0d: [driver] Drive DUT with data in %0h", $time , pkt.data);
      dut_vif.valid = 1;
      dut_vif.data_in = pkt.data;
      @(posedge dut_vif.clk);
      #1;
      dut_vif.valid = 0;
      repeat(6) @(posedge dut_vif.clk);
    end
  endtask

endclass

