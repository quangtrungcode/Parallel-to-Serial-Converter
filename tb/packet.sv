class packet;
  bit[7:0] data;

  function new(bit[7:0] data=8'h00);
    this.data = data;
  endfunction

endclass


