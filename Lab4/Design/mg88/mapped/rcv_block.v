/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Feb 10 22:04:45 2016
/////////////////////////////////////////////////////////////


module rcu ( clk, n_rst, framing_error, packet_done, start_bit_detected, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, framing_error, packet_done, start_bit_detected;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26;
  wire   [2:0] state;
  wire   [2:0] next_state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  INVX1 U6 ( .A(enable_timer), .Y(n4) );
  INVX2 U7 ( .A(n4), .Y(n5) );
  INVX1 U8 ( .A(n8), .Y(n6) );
  INVX1 U9 ( .A(state[1]), .Y(n19) );
  INVX1 U10 ( .A(n14), .Y(n7) );
  INVX2 U11 ( .A(state[2]), .Y(n8) );
  INVX1 U12 ( .A(n6), .Y(n11) );
  INVX2 U13 ( .A(state[0]), .Y(n14) );
  INVX1 U14 ( .A(n19), .Y(n9) );
  INVX1 U15 ( .A(n11), .Y(n12) );
  INVX1 U16 ( .A(n14), .Y(n10) );
  INVX4 U17 ( .A(n15), .Y(enable_timer) );
  INVX2 U18 ( .A(framing_error), .Y(n23) );
  MUX2X1 U19 ( .B(start_bit_detected), .A(n23), .S(n12), .Y(n13) );
  OR2X1 U20 ( .A(n9), .B(n13), .Y(n17) );
  NAND3X1 U21 ( .A(n8), .B(state[1]), .C(n14), .Y(n15) );
  NAND2X1 U22 ( .A(packet_done), .B(n5), .Y(n16) );
  OAI21X1 U23 ( .A(n10), .B(n17), .C(n16), .Y(next_state[0]) );
  NAND2X1 U24 ( .A(n9), .B(n10), .Y(n21) );
  INVX2 U25 ( .A(n21), .Y(n18) );
  NAND2X1 U26 ( .A(n18), .B(n11), .Y(n25) );
  NAND2X1 U27 ( .A(n7), .B(n19), .Y(n26) );
  OAI21X1 U28 ( .A(n10), .B(n19), .C(n26), .Y(n20) );
  INVX2 U29 ( .A(n20), .Y(n22) );
  NAND3X1 U30 ( .A(n22), .B(n12), .C(n21), .Y(n24) );
  NAND2X1 U31 ( .A(n25), .B(n24), .Y(next_state[2]) );
  OAI22X1 U32 ( .A(n24), .B(n23), .C(n12), .D(n22), .Y(next_state[1]) );
  NOR2X1 U33 ( .A(n11), .B(n26), .Y(load_buffer) );
  INVX2 U34 ( .A(n25), .Y(sbc_enable) );
  NOR2X1 U35 ( .A(n12), .B(n26), .Y(sbc_clear) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected;
  wire   old_sample, new_sample, sync_phase, n4;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  INVX2 U6 ( .A(old_sample), .Y(n4) );
  NOR2X1 U7 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
endmodule


module flex_counter_NUM_CNT_BITS4_1 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n89, n90, n1, n2, n3, n4, n10, n11, n12, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88;
  wire   [3:0] next_count;

  DFFSR rollover_flag_reg ( .D(n86), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n90)
         );
  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n89)
         );
  DFFSR \count_out_reg[2]  ( .D(n88), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  INVX1 U8 ( .A(count_enable), .Y(n11) );
  AND2X2 U9 ( .A(rollover_val[3]), .B(n52), .Y(n1) );
  AND2X2 U10 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n2) );
  INVX1 U11 ( .A(n11), .Y(n3) );
  INVX1 U12 ( .A(count_out[3]), .Y(n52) );
  INVX2 U13 ( .A(n43), .Y(n4) );
  INVX2 U14 ( .A(count_enable), .Y(n10) );
  INVX1 U15 ( .A(count_enable), .Y(n32) );
  INVX2 U16 ( .A(n75), .Y(n33) );
  AND2X1 U17 ( .A(n74), .B(n72), .Y(n12) );
  NAND2X1 U18 ( .A(n73), .B(n12), .Y(n85) );
  BUFX2 U19 ( .A(n64), .Y(n24) );
  BUFX4 U20 ( .A(n90), .Y(rollover_flag) );
  BUFX2 U21 ( .A(n90), .Y(n28) );
  NAND3X1 U22 ( .A(n31), .B(n64), .C(count_enable), .Y(n14) );
  INVX1 U23 ( .A(n67), .Y(n15) );
  INVX2 U24 ( .A(n15), .Y(n16) );
  OR2X2 U25 ( .A(clear), .B(n28), .Y(n43) );
  INVX1 U26 ( .A(clear), .Y(n64) );
  INVX2 U27 ( .A(n29), .Y(n17) );
  INVX1 U28 ( .A(clear), .Y(n18) );
  NAND2X1 U29 ( .A(n61), .B(n2), .Y(n73) );
  OR2X2 U30 ( .A(n50), .B(n66), .Y(n57) );
  AND2X1 U31 ( .A(n64), .B(n47), .Y(n20) );
  AND2X2 U32 ( .A(n53), .B(n64), .Y(n19) );
  XOR2X1 U33 ( .A(n78), .B(rollover_val[1]), .Y(n83) );
  OR2X1 U34 ( .A(n14), .B(rollover_val[0]), .Y(n48) );
  INVX1 U35 ( .A(rollover_flag), .Y(n21) );
  INVX1 U36 ( .A(rollover_flag), .Y(n22) );
  BUFX2 U37 ( .A(n89), .Y(count_out[1]) );
  INVX1 U38 ( .A(n24), .Y(n25) );
  INVX1 U39 ( .A(n43), .Y(n26) );
  INVX1 U40 ( .A(n77), .Y(n27) );
  NAND2X1 U41 ( .A(n63), .B(n20), .Y(n49) );
  INVX1 U42 ( .A(n3), .Y(n53) );
  INVX1 U43 ( .A(n54), .Y(n42) );
  INVX1 U44 ( .A(n63), .Y(n29) );
  INVX2 U45 ( .A(count_out[0]), .Y(n31) );
  OAI22X1 U46 ( .A(count_enable), .B(n31), .C(n10), .D(n21), .Y(n63) );
  NAND3X1 U47 ( .A(n31), .B(n24), .C(n3), .Y(n62) );
  OAI21X1 U48 ( .A(n25), .B(n29), .C(n62), .Y(next_count[0]) );
  NOR2X1 U49 ( .A(n89), .B(n31), .Y(n30) );
  NAND3X1 U50 ( .A(n30), .B(count_enable), .C(n4), .Y(n76) );
  NAND3X1 U51 ( .A(n22), .B(n18), .C(n31), .Y(n75) );
  OAI21X1 U52 ( .A(n33), .B(n19), .C(count_out[1]), .Y(n34) );
  NAND2X1 U53 ( .A(n27), .B(n34), .Y(n87) );
  NAND2X1 U54 ( .A(n89), .B(count_out[0]), .Y(n40) );
  NOR2X1 U55 ( .A(count_out[2]), .B(n40), .Y(n35) );
  NAND3X1 U56 ( .A(count_enable), .B(n26), .C(n35), .Y(n80) );
  NAND2X1 U57 ( .A(count_out[2]), .B(n18), .Y(n38) );
  INVX2 U58 ( .A(count_out[2]), .Y(n45) );
  OAI22X1 U59 ( .A(n89), .B(n45), .C(count_out[0]), .D(n45), .Y(n36) );
  NAND3X1 U60 ( .A(n22), .B(n18), .C(n36), .Y(n37) );
  OAI21X1 U61 ( .A(count_enable), .B(n38), .C(n37), .Y(n79) );
  INVX2 U62 ( .A(n79), .Y(n39) );
  NAND2X1 U63 ( .A(n80), .B(n39), .Y(n88) );
  INVX2 U64 ( .A(n40), .Y(n41) );
  NAND3X1 U65 ( .A(count_enable), .B(n41), .C(n4), .Y(n54) );
  NAND2X1 U66 ( .A(n42), .B(count_out[2]), .Y(n68) );
  OAI21X1 U67 ( .A(n43), .B(count_out[1]), .C(n75), .Y(n44) );
  INVX2 U68 ( .A(n44), .Y(n67) );
  NAND2X1 U69 ( .A(n26), .B(n45), .Y(n50) );
  NAND2X1 U70 ( .A(n67), .B(n50), .Y(n60) );
  NOR2X1 U71 ( .A(n19), .B(n60), .Y(n46) );
  MUX2X1 U72 ( .B(n68), .A(n46), .S(count_out[3]), .Y(next_count[3]) );
  INVX2 U73 ( .A(rollover_val[0]), .Y(n47) );
  NAND2X1 U74 ( .A(n49), .B(n48), .Y(n59) );
  INVX2 U75 ( .A(rollover_val[3]), .Y(n51) );
  NAND2X1 U76 ( .A(count_out[3]), .B(n51), .Y(n66) );
  AOI21X1 U77 ( .A(n1), .B(n45), .C(n32), .Y(n56) );
  NAND2X1 U78 ( .A(n54), .B(n1), .Y(n55) );
  NAND3X1 U79 ( .A(n57), .B(n56), .C(n55), .Y(n58) );
  NOR2X1 U80 ( .A(n59), .B(n58), .Y(n74) );
  INVX2 U81 ( .A(n60), .Y(n61) );
  NAND2X1 U82 ( .A(rollover_val[0]), .B(n62), .Y(n65) );
  OAI22X1 U83 ( .A(n65), .B(n24), .C(n17), .D(n65), .Y(n71) );
  NOR2X1 U84 ( .A(n16), .B(n66), .Y(n70) );
  NOR3X1 U85 ( .A(n68), .B(count_out[3]), .C(rollover_val[3]), .Y(n69) );
  NOR3X1 U86 ( .A(n71), .B(n70), .C(n69), .Y(n72) );
  INVX2 U87 ( .A(n76), .Y(n77) );
  AOI21X1 U88 ( .A(count_out[1]), .B(n33), .C(n77), .Y(n78) );
  INVX2 U89 ( .A(rollover_val[2]), .Y(n81) );
  XOR2X1 U90 ( .A(n88), .B(n81), .Y(n82) );
  NAND2X1 U91 ( .A(n83), .B(n82), .Y(n84) );
  NOR2X1 U92 ( .A(n84), .B(n85), .Y(n86) );
endmodule


module flex_counter_NUM_CNT_BITS4_0 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n73, \next_count[3] , N17, n1, n2, n3, n4, n10, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71;

  DFFSR rollover_flag_reg ( .D(N17), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n73)
         );
  DFFSR \count_out_reg[0]  ( .D(n69), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[2]  ( .D(n71), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n70), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[3]  ( .D(\next_count[3] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[3]) );
  INVX1 U3 ( .A(n31), .Y(n1) );
  INVX2 U4 ( .A(n31), .Y(n22) );
  AND2X2 U5 ( .A(count_out[3]), .B(n52), .Y(n2) );
  AND2X2 U6 ( .A(n22), .B(n18), .Y(n3) );
  AND2X2 U8 ( .A(n36), .B(count_out[0]), .Y(n4) );
  INVX1 U9 ( .A(n20), .Y(n21) );
  INVX2 U10 ( .A(n54), .Y(n20) );
  INVX1 U15 ( .A(count_enable), .Y(n33) );
  AND2X2 U16 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n10) );
  BUFX2 U17 ( .A(n45), .Y(n12) );
  AND2X2 U18 ( .A(n39), .B(n38), .Y(n13) );
  INVX2 U19 ( .A(clear), .Y(n23) );
  INVX1 U20 ( .A(n39), .Y(n34) );
  INVX1 U21 ( .A(n38), .Y(n35) );
  NAND2X1 U22 ( .A(n1), .B(n14), .Y(n49) );
  NOR2X1 U23 ( .A(n17), .B(n30), .Y(n14) );
  INVX1 U24 ( .A(clear), .Y(n37) );
  AND2X2 U25 ( .A(n15), .B(n44), .Y(n66) );
  XNOR2X1 U26 ( .A(n47), .B(rollover_val[0]), .Y(n15) );
  NAND2X1 U27 ( .A(n1), .B(n4), .Y(n62) );
  INVX1 U28 ( .A(n13), .Y(n16) );
  NAND2X1 U29 ( .A(count_out[0]), .B(count_out[1]), .Y(n17) );
  INVX2 U30 ( .A(n17), .Y(n18) );
  NAND2X1 U31 ( .A(n10), .B(n54), .Y(n19) );
  BUFX2 U32 ( .A(n28), .Y(n24) );
  INVX2 U33 ( .A(count_out[2]), .Y(n30) );
  NOR2X1 U34 ( .A(n19), .B(n53), .Y(n60) );
  INVX2 U35 ( .A(n50), .Y(n25) );
  INVX1 U36 ( .A(rollover_flag), .Y(n26) );
  INVX2 U37 ( .A(n26), .Y(n27) );
  INVX2 U38 ( .A(n73), .Y(n28) );
  INVX4 U39 ( .A(n28), .Y(rollover_flag) );
  INVX1 U40 ( .A(n49), .Y(n50) );
  INVX1 U41 ( .A(count_enable), .Y(n55) );
  OAI21X1 U42 ( .A(n27), .B(n33), .C(n37), .Y(n45) );
  INVX2 U43 ( .A(count_out[0]), .Y(n32) );
  NAND2X1 U44 ( .A(n37), .B(n32), .Y(n46) );
  AOI22X1 U45 ( .A(n12), .B(n46), .C(n33), .D(n32), .Y(n69) );
  NAND3X1 U46 ( .A(count_enable), .B(n24), .C(n23), .Y(n31) );
  INVX2 U47 ( .A(count_out[1]), .Y(n36) );
  NAND3X1 U48 ( .A(n32), .B(n24), .C(n23), .Y(n38) );
  NAND2X1 U49 ( .A(n23), .B(n55), .Y(n39) );
  OAI21X1 U50 ( .A(n35), .B(n34), .C(count_out[1]), .Y(n61) );
  NAND2X1 U51 ( .A(n62), .B(n61), .Y(n70) );
  NAND3X1 U52 ( .A(n37), .B(n26), .C(n36), .Y(n48) );
  NAND3X1 U53 ( .A(count_out[2]), .B(n48), .C(n13), .Y(n40) );
  OAI21X1 U54 ( .A(n3), .B(count_out[2]), .C(n40), .Y(n41) );
  INVX2 U55 ( .A(n41), .Y(n71) );
  NAND2X1 U56 ( .A(n22), .B(n30), .Y(n54) );
  NAND2X1 U57 ( .A(n21), .B(n48), .Y(n42) );
  NOR2X1 U58 ( .A(n16), .B(n42), .Y(n43) );
  MUX2X1 U59 ( .B(n25), .A(n43), .S(count_out[3]), .Y(\next_count[3] ) );
  XOR2X1 U60 ( .A(n71), .B(rollover_val[2]), .Y(n68) );
  INVX2 U61 ( .A(count_out[3]), .Y(n51) );
  NAND3X1 U62 ( .A(rollover_val[3]), .B(n51), .C(n49), .Y(n44) );
  NAND2X1 U63 ( .A(n45), .B(n46), .Y(n47) );
  NAND2X1 U64 ( .A(n13), .B(n48), .Y(n53) );
  INVX2 U65 ( .A(rollover_val[3]), .Y(n52) );
  NAND3X1 U66 ( .A(n52), .B(n51), .C(n50), .Y(n58) );
  NAND2X1 U67 ( .A(n53), .B(n2), .Y(n57) );
  AOI21X1 U68 ( .A(n20), .B(n2), .C(n33), .Y(n56) );
  NAND3X1 U69 ( .A(n58), .B(n57), .C(n56), .Y(n59) );
  NOR2X1 U70 ( .A(n59), .B(n60), .Y(n65) );
  INVX2 U71 ( .A(rollover_val[1]), .Y(n63) );
  XOR2X1 U72 ( .A(n70), .B(n63), .Y(n64) );
  NAND3X1 U73 ( .A(n66), .B(n64), .C(n65), .Y(n67) );
  NOR2X1 U74 ( .A(n68), .B(n67), .Y(N17) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_strobe, packet_done );
  input clk, n_rst, enable_timer;
  output shift_strobe, packet_done;
  wire   n3, n1;

  flex_counter_NUM_CNT_BITS4_1 X ( .clk(clk), .n_rst(n_rst), .clear(n3), 
        .count_enable(enable_timer), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), 
        .rollover_flag(shift_strobe) );
  flex_counter_NUM_CNT_BITS4_0 IX ( .clk(clk), .n_rst(n_rst), .clear(n3), 
        .count_enable(shift_strobe), .rollover_val({1'b1, 1'b0, 1'b0, 1'b1}), 
        .rollover_flag(n3) );
  INVX1 U3 ( .A(n3), .Y(n1) );
  INVX2 U4 ( .A(n1), .Y(packet_done) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n15, n17, n19, n21,
         n23, n25, n27, n29, n2, n30;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  OAI21X1 U2 ( .A(n1), .B(n2), .C(n3), .Y(n13) );
  NAND2X1 U3 ( .A(parallel_out[0]), .B(n2), .Y(n3) );
  OAI22X1 U4 ( .A(n2), .B(n4), .C(n30), .D(n1), .Y(n15) );
  INVX1 U5 ( .A(parallel_out[1]), .Y(n1) );
  OAI22X1 U6 ( .A(n2), .B(n5), .C(n30), .D(n4), .Y(n17) );
  INVX1 U7 ( .A(parallel_out[2]), .Y(n4) );
  OAI22X1 U8 ( .A(n2), .B(n6), .C(n30), .D(n5), .Y(n19) );
  INVX1 U9 ( .A(parallel_out[3]), .Y(n5) );
  OAI22X1 U10 ( .A(n2), .B(n7), .C(n30), .D(n6), .Y(n21) );
  INVX1 U11 ( .A(parallel_out[4]), .Y(n6) );
  OAI22X1 U12 ( .A(n2), .B(n8), .C(n30), .D(n7), .Y(n23) );
  INVX1 U13 ( .A(parallel_out[5]), .Y(n7) );
  OAI22X1 U14 ( .A(n2), .B(n9), .C(n30), .D(n8), .Y(n25) );
  INVX1 U15 ( .A(parallel_out[6]), .Y(n8) );
  OAI22X1 U16 ( .A(n2), .B(n10), .C(n30), .D(n9), .Y(n27) );
  INVX1 U17 ( .A(parallel_out[7]), .Y(n9) );
  OAI21X1 U19 ( .A(n30), .B(n10), .C(n11), .Y(n29) );
  NAND2X1 U20 ( .A(serial_in), .B(n30), .Y(n11) );
  INVX1 U21 ( .A(parallel_out[8]), .Y(n10) );
  INVX2 U18 ( .A(shift_enable), .Y(n2) );
  INVX2 U31 ( .A(n2), .Y(n30) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 IX ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n2, n3, n4, n5;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  INVX2 U3 ( .A(sbc_enable), .Y(n2) );
  INVX2 U4 ( .A(stop_bit), .Y(n3) );
  NOR2X1 U5 ( .A(sbc_clear), .B(n4), .Y(n5) );
  AOI22X1 U6 ( .A(framing_error), .B(n2), .C(sbc_enable), .D(n3), .Y(n4) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19, n21, n23,
         n25, n27, n29, n30, n31, n32, n33;

  DFFSR \rx_data_reg[7]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  OAI21X1 U3 ( .A(data_read), .B(n1), .C(n2), .Y(n31) );
  INVX1 U4 ( .A(data_ready), .Y(n1) );
  INVX1 U5 ( .A(n3), .Y(n15) );
  AOI22X1 U6 ( .A(rx_data[0]), .B(n2), .C(packet_data[0]), .D(n33), .Y(n3) );
  INVX1 U7 ( .A(n4), .Y(n17) );
  AOI22X1 U8 ( .A(rx_data[1]), .B(n2), .C(packet_data[1]), .D(n33), .Y(n4) );
  INVX1 U9 ( .A(n5), .Y(n19) );
  AOI22X1 U10 ( .A(rx_data[2]), .B(n2), .C(packet_data[2]), .D(n33), .Y(n5) );
  INVX1 U11 ( .A(n6), .Y(n21) );
  AOI22X1 U12 ( .A(rx_data[3]), .B(n2), .C(packet_data[3]), .D(n33), .Y(n6) );
  INVX1 U13 ( .A(n7), .Y(n23) );
  AOI22X1 U14 ( .A(rx_data[4]), .B(n2), .C(packet_data[4]), .D(n33), .Y(n7) );
  INVX1 U15 ( .A(n8), .Y(n25) );
  AOI22X1 U16 ( .A(rx_data[5]), .B(n2), .C(packet_data[5]), .D(n33), .Y(n8) );
  INVX1 U17 ( .A(n9), .Y(n27) );
  AOI22X1 U18 ( .A(rx_data[6]), .B(n2), .C(packet_data[6]), .D(n33), .Y(n9) );
  INVX1 U19 ( .A(n10), .Y(n29) );
  AOI22X1 U20 ( .A(rx_data[7]), .B(n2), .C(packet_data[7]), .D(n33), .Y(n10)
         );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(n33), .B(data_ready), .C(overrun_error), .Y(n11) );
  INVX8 U21 ( .A(n33), .Y(n2) );
  INVX2 U34 ( .A(load_buffer), .Y(n32) );
  INVX8 U35 ( .A(n32), .Y(n33) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   packet_done, start_bit_flag, sbc_clear, sbc_enable, load_buffer,
         enable_timer, shift_strobe, stop_bit;
  wire   [7:0] packet_data;

  rcu RCU ( .clk(clk), .n_rst(n_rst), .framing_error(framing_error), 
        .packet_done(packet_done), .start_bit_detected(start_bit_flag), 
        .sbc_clear(sbc_clear), .sbc_enable(sbc_enable), .load_buffer(
        load_buffer), .enable_timer(enable_timer) );
  start_bit_det START_BIT_DETECT ( .clk(clk), .n_rst(n_rst), .serial_in(
        serial_in), .start_bit_detected(start_bit_flag) );
  timer TIMER ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .shift_strobe(shift_strobe), .packet_done(packet_done) );
  sr_9bit SHIFT ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_strobe), 
        .serial_in(serial_in), .packet_data(packet_data), .stop_bit(stop_bit)
         );
  stop_bit_chk STOP_BIT_CHECKER ( .clk(clk), .n_rst(n_rst), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .stop_bit(stop_bit), 
        .framing_error(framing_error) );
  rx_data_buff RX_DATA_BUFF ( .clk(clk), .n_rst(n_rst), .load_buffer(
        load_buffer), .packet_data(packet_data), .data_read(data_read), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error) );
endmodule

