/*class monitor;
  mailbox #(packet) m2s_mb;
  virtual dut_if vif;

  function new(mailbox #(packet) m2s, virtual dut_if vif);
    this.m2s_mb = m2s;
    this.vif = vif;
  endfunction

  task run();
    forever begin
      packet pkt;
      bit [7:0] captured_data;
      
      wait(vif.valid == 1);
      $display("# %0d: [monitor] Start capture data in TXD", $time);

      for(int i=0;i<8;i++) begin
        @(posedge vif.clk);
        #1;
        captured_data[i] = vif.TXD; 
      end

   
      pkt = new(captured_data);
      $display("# %0d: [monitor] Data capture is 8'h%h, sent to scoreboard", $time, pkt.data);
      m2s_mb.put(pkt);
      wait(vif.valid == 0);
    end
  endtask
endclass
*/

class monitor;
  mailbox #(packet) m2s_mb;
  virtual dut_if dut_vif;

  function new(mailbox #(packet) m2s, virtual dut_if dut_vif);
    this.m2s_mb = m2s;
    this.dut_vif = dut_vif;
  endfunction

  task run();
    while(1) begin
      packet pkt;
      bit [7:0] capture_data;
      wait(dut_vif.valid == 1);
      $display("#%0d: [monitor] Start capture data in TXD", $time); 

      for (int i=0; i<8;i++) begin
        @(posedge dut_vif.clk);
        #1;
        capture_data[i] = dut_vif.TXD;
      end
      
      pkt = new(capture_data);
      m2s_mb.put(pkt);
      $display("#%0d: [monitor] Data capture is 8'h%0h, sent to scoreboard", $time, capture_data); 
    end
  endtask
endclass

