class multi_convert_test extends base_test;
  function new(virtual dut_if dut_vif);
    super.new(dut_vif);
  endfunction

  task run_test();
    env.stim.num_trans = 2;
    env.run();
  endtask
endclass
