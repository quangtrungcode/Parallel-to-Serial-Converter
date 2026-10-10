/*class scoreboard;
  mailbox #(packet) s2s_mb;
  mailbox #(packet) m2s_mb;

  function new(mailbox #(packet) s2s, mailbox #(packet) m2s);
    this.s2s_mb = s2s;
    this.m2s_mb = m2s;
  endfunction

  task run();
    forever begin
      packet pkt_exp, pkt_act;
      s2s_mb.get(pkt_exp);
      m2s_mb.get(pkt_act);

      if (pkt_exp.data == pkt_act.data)
        $display("# %0d: [scoreboard] Data comparision is matching 8'h%h", $time, pkt_exp.data);
      else
        $display("# %0d: [scoreboard] Data comparision is MISMATCH 8'h%h != 8'h%h", $time, pkt_exp.data, pkt_act.data);
    end
  endtask
endclass
*/
class scoreboard;
  mailbox #(packet) s2s_mb;
  mailbox #(packet) m2s_mb;
  
  function new(mailbox #(packet) s2s, mailbox #(packet) m2s);
    this.s2s_mb = s2s;    
    this.m2s_mb = m2s;
  endfunction
  
  task run();
    packet pkt_exp, pkt_act;
    while(1) begin
      s2s_mb.get(pkt_exp); 
      m2s_mb.get(pkt_act);
      
      if(pkt_exp.data === pkt_act.data)
        $display("#%0d: [scoreboard] Data comparision is matching 8'h%0h", $time, pkt_exp.data);
      else
        $display("#%0d: [scoreboard] Data comparision is mismatch, Exp = 8'h%0h, Act = 8'h%0h", $time, pkt_exp.data, pkt_act.data);
    end 
  endtask
  
endclass

