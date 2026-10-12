class base_test;
  environment env;
  virtual dut_if dut_vif;
  
  function new(virtual dut_if dut_vif);
    env = new(dut_vif);
  endfunction
  
  virtual task run_test();

  endtask
endclass
