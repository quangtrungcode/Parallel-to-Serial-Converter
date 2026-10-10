/*class stimulus;
  mailbox #(packet) s2d_mb;
  mailbox #(packet) s2s_mb;

  function new (mailbox #(packet) s2d, mailbox #(packet) s2s);
    this.s2d_mb = s2d;
    this.s2s_mb = s2s;
  endfunction
  
  task run();
						    packet pkt;

    #80;
    pkt = new(8'ha3);
    $display("# %0d: [stimulus] Sent packet to drive", $time);
    s2d_mb.put(pkt);
    $display("# %0d: [stimulus] Sent packet to scoreboard", $time);
    s2s_mb.put(pkt);

    pkt = new(8'h8a);
    $display("# %0d: [stimulus] Sent packet to drive", $time);
    s2d_mb.put(pkt);
    $display("# %0d: [stimulus] Sent packet to scoreboard", $time);
    s2s_mb.put(pkt);
  endtask
endclass
*/

class stimulus;
  mailbox #(packet) s2d_mb;
  mailbox #(packet) s2s_mb;
  packet pkt;
  int num_trans = 1;
  function new(mailbox #(packet) s2d, mailbox #(packet) s2s);
    this.s2d_mb = s2d;
    this.s2s_mb = s2s;
  endfunction
  
  task run();
    #70;
    pkt = new(8'ha3);
    $display("#%0d: [stimulus] Sent packet to driver", $time);
    s2d_mb.put(pkt);
    $display("#%0d: [stimulus] Sent packet to scoreboard", $time);
    s2s_mb.put(pkt);
    
    if(num_trans > 1) begin
      pkt = new(8'h8a);
      $display("#%0d: [stimulus] Sent packet to driver", $time);
      s2d_mb.put(pkt);
      $display("#%0d: [stimulus] Sent packet to scoreboard", $time);
      s2s_mb.put(pkt);
    end
  endtask	
endclass

