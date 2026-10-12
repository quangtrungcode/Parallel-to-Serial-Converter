class single_convert_test extends base_test;
  function new(virtual dut_if dut_vif);
    super.new(dut_vif);
  endfunction
   
  virtual task run_test();
    env.stim.num_trans = 1;
    env.run();  
  endtask  
endclass
