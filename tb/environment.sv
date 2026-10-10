class environment;
  stimulus stim;
  driver drv;
  monitor mon;
  scoreboard scb;

  mailbox #(packet) s2d_mb;
  mailbox #(packet) s2s_mb;
  mailbox #(packet) m2s_mb;
  
  virtual dut_if dut_vif;
  function new(virtual dut_if dut_vif );
     this.dut_vif = dut_vif;
     s2d_mb = new(1);
     s2s_mb = new(1);
     m2s_mb = new(1);

     stim = new(s2d_mb, s2s_mb);
     drv = new(s2d_mb, dut_vif);
     mon = new(m2s_mb, dut_vif);
     scb = new(s2s_mb, m2s_mb);
  endfunction
  
  task run();
    fork
      stim.run();
      drv.run();
      mon.run();
      scb.run();
    join_any

  endtask
endclass
