﻿# VerilogArithmeticAndControlModules
## Project Description
This repository contains a collection of Verilog modules designed to simulate various arithmetic and control operations. Each module is well-documented and demonstrates a specific functionality or algorithm.

## Files
- `basamak_bulma.v`: Verilog module for determining the digits of a number.
- `bir_sayma.v`: Verilog module for a single counter.
- `boruhatti_toplama.v`: Verilog module for pipelined addition.
- `dortbit_bulma.v`: Verilog module for finding a 4-bit value.
- `duz_toplama.v`: Verilog module for regular addition.
- `kuyruk_denetleyicisi.v`: Verilog module for queue control.
- `yaklasik_carpma.v`: Verilog module for approximate multiplication.

## Module Descriptions

### Module Usage
```verilog
// basamak_bulma.v
module basamak_bulma(input [7:0] number, output [3:0] digits);
// Module implementation
endmodule

// bir_sayma.v
module bir_sayma(input clk, input reset, output [7:0] count);
// Module implementation
endmodule

// boruhatti_toplama.v
module boruhatti_toplama(input [7:0] a, input [7:0] b, output [7:0] sum);
// Module implementation
endmodule

// dortbit_bulma.v
module dortbit_bulma(input [3:0] a, output found);
// Module implementation
endmodule

// duz_toplama.v
module duz_toplama(input [7:0] a, input [7:0] b, output [7:0] sum);
// Module implementation
endmodule

// kuyruk_denetleyicisi.v
module kuyruk_denetleyicisi(input clk, input reset, input enqueue, input dequeue, output [7:0] queue_status);
// Module implementation
endmodule

// yaklasik_carpma.v
module yaklasik_carpma(input [7:0] a, input [7:0] b, output [7:0] product);
// Module implementation
endmodule
