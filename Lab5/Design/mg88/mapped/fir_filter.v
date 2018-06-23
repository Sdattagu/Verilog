/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Feb 16 19:31:27 2016
/////////////////////////////////////////////////////////////


module sync_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   middleSig;

  DFFSR middleSig_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        middleSig) );
  DFFSR sync_out_reg ( .D(middleSig), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sync_out) );
endmodule


module sync_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   middleSig;

  DFFSR middleSig_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        middleSig) );
  DFFSR sync_out_reg ( .D(middleSig), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        sync_out) );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   next_modwait, next_err, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n40, n41, n42, n43, n44, n45, n46, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155;
  wire   [4:0] state;
  wire   [4:0] next_state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \state_reg[4]  ( .D(next_state[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[4]) );
  DFFSR \state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[3]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR current_err_reg ( .D(next_err), .CLK(clk), .R(n_rst), .S(1'b1), .Q(err) );
  DFFSR current_modwait_reg ( .D(next_modwait), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(modwait) );
  NAND2X1 U73 ( .A(n155), .B(n154), .Y(op[1]) );
  INVX4 U3 ( .A(n139), .Y(n146) );
  INVX4 U4 ( .A(n42), .Y(n43) );
  INVX8 U5 ( .A(n43), .Y(n150) );
  AND2X2 U6 ( .A(n43), .B(n33), .Y(n46) );
  INVX2 U7 ( .A(n126), .Y(src2[2]) );
  INVX1 U8 ( .A(n16), .Y(n1) );
  NAND2X1 U9 ( .A(n92), .B(n6), .Y(n2) );
  NAND2X1 U10 ( .A(n110), .B(n3), .Y(n78) );
  INVX2 U11 ( .A(n2), .Y(n3) );
  NAND2X1 U12 ( .A(n15), .B(n150), .Y(n4) );
  NAND2X1 U13 ( .A(n27), .B(n5), .Y(n85) );
  INVX2 U14 ( .A(n4), .Y(n5) );
  AND2X1 U15 ( .A(n48), .B(n144), .Y(n31) );
  AND2X2 U16 ( .A(n116), .B(n81), .Y(n6) );
  AND2X2 U17 ( .A(modwait), .B(n49), .Y(n7) );
  INVX1 U18 ( .A(n123), .Y(n70) );
  BUFX2 U19 ( .A(n115), .Y(n8) );
  AND2X2 U20 ( .A(n150), .B(n33), .Y(n9) );
  INVX1 U21 ( .A(n45), .Y(n10) );
  INVX1 U29 ( .A(n45), .Y(n11) );
  INVX2 U30 ( .A(n45), .Y(n80) );
  INVX1 U31 ( .A(state[4]), .Y(n12) );
  INVX1 U32 ( .A(state[4]), .Y(n48) );
  INVX1 U33 ( .A(n131), .Y(n13) );
  INVX1 U34 ( .A(n33), .Y(n32) );
  AND2X2 U35 ( .A(n48), .B(n144), .Y(n29) );
  INVX1 U36 ( .A(n51), .Y(n14) );
  INVX1 U37 ( .A(n51), .Y(n87) );
  BUFX2 U38 ( .A(n45), .Y(n15) );
  OR2X2 U39 ( .A(n44), .B(n51), .Y(n55) );
  INVX2 U40 ( .A(overflow), .Y(n16) );
  INVX1 U41 ( .A(overflow), .Y(n105) );
  BUFX2 U42 ( .A(n52), .Y(n17) );
  AND2X2 U43 ( .A(n43), .B(n33), .Y(n18) );
  BUFX2 U44 ( .A(n18), .Y(n26) );
  AND2X2 U45 ( .A(n53), .B(n31), .Y(n27) );
  INVX1 U46 ( .A(n27), .Y(n88) );
  INVX2 U47 ( .A(src1[3]), .Y(n28) );
  INVX2 U48 ( .A(n130), .Y(n131) );
  INVX1 U49 ( .A(n146), .Y(n30) );
  AND2X2 U50 ( .A(state[0]), .B(n12), .Y(n33) );
  NAND2X1 U51 ( .A(n18), .B(n104), .Y(n34) );
  INVX4 U52 ( .A(n55), .Y(n104) );
  INVX1 U53 ( .A(n144), .Y(n35) );
  NAND2X1 U54 ( .A(n146), .B(n18), .Y(n36) );
  NAND2X1 U55 ( .A(n146), .B(n26), .Y(n37) );
  AND2X2 U56 ( .A(n129), .B(n133), .Y(n38) );
  OR2X1 U57 ( .A(n118), .B(n117), .Y(dest[0]) );
  AND2X2 U58 ( .A(n122), .B(n85), .Y(n40) );
  AND2X2 U59 ( .A(n150), .B(n33), .Y(n41) );
  INVX1 U60 ( .A(n128), .Y(cnt_up) );
  INVX2 U61 ( .A(state[3]), .Y(n42) );
  INVX1 U62 ( .A(n48), .Y(n49) );
  INVX1 U63 ( .A(n132), .Y(src1[3]) );
  INVX2 U64 ( .A(state[2]), .Y(n44) );
  INVX4 U65 ( .A(n44), .Y(n45) );
  INVX4 U66 ( .A(n38), .Y(src2[0]) );
  INVX2 U67 ( .A(state[1]), .Y(n50) );
  INVX2 U68 ( .A(n50), .Y(n51) );
  INVX1 U69 ( .A(n50), .Y(n52) );
  INVX1 U70 ( .A(n50), .Y(n53) );
  AND2X2 U71 ( .A(n128), .B(n36), .Y(n54) );
  INVX2 U72 ( .A(n54), .Y(src1[2]) );
  INVX1 U74 ( .A(src2[2]), .Y(n134) );
  NAND2X1 U75 ( .A(n45), .B(n52), .Y(n136) );
  INVX2 U76 ( .A(n136), .Y(n61) );
  NAND2X1 U77 ( .A(n41), .B(n61), .Y(n132) );
  NAND2X1 U78 ( .A(n104), .B(n18), .Y(n133) );
  NAND2X1 U79 ( .A(n28), .B(n34), .Y(src2[3]) );
  NAND2X1 U80 ( .A(n87), .B(n80), .Y(n139) );
  NAND2X1 U81 ( .A(n146), .B(n18), .Y(n127) );
  INVX2 U82 ( .A(src2[3]), .Y(n56) );
  NAND3X1 U83 ( .A(n17), .B(n11), .C(n46), .Y(n129) );
  NAND3X1 U84 ( .A(n37), .B(n56), .C(n129), .Y(n57) );
  INVX2 U85 ( .A(n57), .Y(n120) );
  INVX2 U86 ( .A(state[0]), .Y(n144) );
  NAND2X1 U87 ( .A(n49), .B(n144), .Y(n138) );
  INVX2 U88 ( .A(n138), .Y(n58) );
  NAND2X1 U89 ( .A(n58), .B(n150), .Y(n86) );
  INVX2 U90 ( .A(n86), .Y(n106) );
  OAI21X1 U91 ( .A(n17), .B(n104), .C(n106), .Y(n92) );
  NAND2X1 U92 ( .A(n106), .B(n146), .Y(n74) );
  NAND2X1 U93 ( .A(n146), .B(n41), .Y(n114) );
  INVX2 U94 ( .A(n114), .Y(n75) );
  NAND2X1 U95 ( .A(n29), .B(n43), .Y(n123) );
  NOR2X1 U96 ( .A(n75), .B(n70), .Y(n59) );
  NAND3X1 U97 ( .A(n92), .B(n74), .C(n59), .Y(n69) );
  NAND3X1 U98 ( .A(n29), .B(n104), .C(n150), .Y(n122) );
  NAND3X1 U99 ( .A(n35), .B(n49), .C(n150), .Y(n60) );
  INVX2 U100 ( .A(n60), .Y(n62) );
  NAND3X1 U101 ( .A(n62), .B(n53), .C(n11), .Y(n116) );
  NAND2X1 U102 ( .A(n104), .B(n62), .Y(n81) );
  NAND2X1 U103 ( .A(n9), .B(n104), .Y(n115) );
  NAND3X1 U104 ( .A(n40), .B(n6), .C(n8), .Y(n101) );
  INVX2 U105 ( .A(n101), .Y(n64) );
  NAND3X1 U106 ( .A(n9), .B(n53), .C(n10), .Y(n128) );
  NAND2X1 U107 ( .A(n62), .B(n61), .Y(n119) );
  NAND2X1 U108 ( .A(n146), .B(n62), .Y(n113) );
  NAND3X1 U109 ( .A(n128), .B(n119), .C(n113), .Y(dest[3]) );
  INVX2 U110 ( .A(dest[3]), .Y(n63) );
  NAND3X1 U111 ( .A(n64), .B(n63), .C(n88), .Y(op[0]) );
  INVX2 U112 ( .A(op[0]), .Y(n67) );
  NAND3X1 U113 ( .A(n29), .B(n146), .C(n150), .Y(n65) );
  INVX2 U114 ( .A(n65), .Y(clear) );
  NOR2X1 U115 ( .A(n26), .B(clear), .Y(n66) );
  NAND3X1 U116 ( .A(n120), .B(n67), .C(n66), .Y(n68) );
  OR2X1 U117 ( .A(n69), .B(n68), .Y(n112) );
  NAND2X1 U118 ( .A(n105), .B(n70), .Y(n99) );
  NAND3X1 U119 ( .A(n120), .B(n112), .C(n99), .Y(next_state[3]) );
  NAND2X1 U120 ( .A(clear), .B(lc), .Y(n73) );
  INVX2 U121 ( .A(n113), .Y(n71) );
  INVX2 U122 ( .A(n112), .Y(n103) );
  NOR2X1 U123 ( .A(n71), .B(n103), .Y(n72) );
  OAI21X1 U124 ( .A(dr), .B(n73), .C(n72), .Y(n79) );
  INVX2 U125 ( .A(n74), .Y(n94) );
  INVX2 U126 ( .A(dr), .Y(n82) );
  OAI21X1 U127 ( .A(n75), .B(n94), .C(n82), .Y(n76) );
  OAI21X1 U128 ( .A(n123), .B(n16), .C(n76), .Y(n77) );
  INVX2 U129 ( .A(n77), .Y(n110) );
  OR2X1 U130 ( .A(n78), .B(n79), .Y(next_state[4]) );
  NAND3X1 U131 ( .A(n27), .B(n10), .C(n150), .Y(n135) );
  AND2X2 U132 ( .A(n135), .B(n113), .Y(n91) );
  OAI21X1 U133 ( .A(n82), .B(n114), .C(n81), .Y(n84) );
  OAI21X1 U134 ( .A(n14), .B(n112), .C(n36), .Y(n83) );
  NOR2X1 U135 ( .A(n84), .B(n83), .Y(n90) );
  NAND3X1 U136 ( .A(n115), .B(n85), .C(n34), .Y(n130) );
  OAI22X1 U137 ( .A(n1), .B(n88), .C(n14), .D(n86), .Y(n102) );
  NOR2X1 U138 ( .A(n13), .B(n102), .Y(n89) );
  NAND3X1 U139 ( .A(n91), .B(n90), .C(n89), .Y(next_state[1]) );
  INVX2 U140 ( .A(n92), .Y(n93) );
  AOI22X1 U141 ( .A(n94), .B(dr), .C(n93), .D(lc), .Y(n100) );
  OAI21X1 U142 ( .A(lc), .B(dr), .C(clear), .Y(n95) );
  OAI21X1 U143 ( .A(n144), .B(n112), .C(n95), .Y(n97) );
  NAND2X1 U144 ( .A(n40), .B(n135), .Y(n96) );
  NOR2X1 U145 ( .A(n97), .B(n96), .Y(n98) );
  NAND3X1 U146 ( .A(n100), .B(n99), .C(n98), .Y(next_state[0]) );
  NOR3X1 U147 ( .A(cnt_up), .B(src2[0]), .C(n101), .Y(n109) );
  OAI21X1 U148 ( .A(n103), .B(n102), .C(n15), .Y(n108) );
  OAI21X1 U149 ( .A(n106), .B(n105), .C(n104), .Y(n107) );
  NAND3X1 U150 ( .A(n109), .B(n108), .C(n107), .Y(next_state[2]) );
  INVX2 U151 ( .A(err), .Y(n111) );
  OAI21X1 U152 ( .A(n112), .B(n111), .C(n110), .Y(next_err) );
  NAND2X1 U153 ( .A(n114), .B(n113), .Y(n118) );
  NAND3X1 U154 ( .A(n116), .B(n8), .C(n122), .Y(n117) );
  INVX2 U155 ( .A(n118), .Y(n155) );
  NAND3X1 U156 ( .A(n155), .B(n40), .C(n120), .Y(dest[1]) );
  NAND3X1 U157 ( .A(n6), .B(n120), .C(n119), .Y(n121) );
  INVX2 U158 ( .A(n121), .Y(n154) );
  NAND2X1 U159 ( .A(n154), .B(n122), .Y(dest[2]) );
  NAND2X1 U160 ( .A(n133), .B(n123), .Y(src2[1]) );
  INVX2 U161 ( .A(n123), .Y(n125) );
  NAND3X1 U162 ( .A(n129), .B(n132), .C(n127), .Y(n124) );
  NOR2X1 U163 ( .A(n125), .B(n124), .Y(n126) );
  NAND3X1 U164 ( .A(n40), .B(n54), .C(n129), .Y(src1[0]) );
  NAND2X1 U165 ( .A(n131), .B(n54), .Y(src1[1]) );
  NAND3X1 U166 ( .A(n135), .B(n134), .C(n34), .Y(op[2]) );
  OAI21X1 U167 ( .A(n7), .B(n136), .C(n43), .Y(n137) );
  INVX2 U168 ( .A(n137), .Y(n149) );
  NAND2X1 U169 ( .A(n144), .B(overflow), .Y(n143) );
  INVX2 U170 ( .A(lc), .Y(n141) );
  NAND2X1 U171 ( .A(n138), .B(n32), .Y(n145) );
  NOR2X1 U172 ( .A(dr), .B(n30), .Y(n140) );
  OAI21X1 U173 ( .A(n141), .B(n145), .C(n140), .Y(n142) );
  AOI22X1 U174 ( .A(n149), .B(n143), .C(n142), .D(n150), .Y(n153) );
  NAND2X1 U175 ( .A(lc), .B(n144), .Y(n148) );
  NAND2X1 U176 ( .A(dr), .B(n145), .Y(n147) );
  MUX2X1 U177 ( .B(n148), .A(n147), .S(n146), .Y(n151) );
  AOI22X1 U178 ( .A(n151), .B(n150), .C(n7), .D(n149), .Y(n152) );
  OAI21X1 U179 ( .A(n49), .B(n153), .C(n152), .Y(next_modwait) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n1), .B(n3), .C(n2), .Y(w_en) );
  NOR2X1 U7 ( .A(n2), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n3), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n3), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n1), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n2), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n3), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[1]), .Y(n1) );
  INVX2 U4 ( .A(op[0]), .Y(n2) );
  INVX2 U5 ( .A(op[2]), .Y(n3) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n21, n22, n23, n24, n25, n27, n29, n30, n31, n32, n33, n35,
         n37, n38, n39, n40, n41, n43, n45, n46, n47, n48, n49, n51, n53, n54,
         n55, n56, n57, n59, n61, n62, n63, n64, n65, n67, n69, n70, n71, n72,
         n73, n74, n76, n78, n80, n82, n84, n86, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n105, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190;

  XNOR2X1 U5 ( .A(n22), .B(n1), .Y(DIFF[14]) );
  AOI21X1 U6 ( .A(n188), .B(n22), .C(n19), .Y(n17) );
  NAND2X1 U9 ( .A(n21), .B(n188), .Y(n1) );
  NAND2X1 U12 ( .A(n90), .B(A[14]), .Y(n21) );
  XOR2X1 U13 ( .A(n172), .B(n2), .Y(DIFF[13]) );
  OAI21X1 U14 ( .A(n25), .B(n23), .C(n24), .Y(n22) );
  NAND2X1 U15 ( .A(n24), .B(n76), .Y(n2) );
  NOR2X1 U17 ( .A(n91), .B(A[13]), .Y(n23) );
  NAND2X1 U18 ( .A(n91), .B(A[13]), .Y(n24) );
  XNOR2X1 U19 ( .A(n176), .B(n3), .Y(DIFF[12]) );
  AOI21X1 U20 ( .A(n187), .B(n30), .C(n27), .Y(n25) );
  NAND2X1 U23 ( .A(n29), .B(n187), .Y(n3) );
  NAND2X1 U26 ( .A(n92), .B(A[12]), .Y(n29) );
  OAI21X1 U28 ( .A(n33), .B(n31), .C(n32), .Y(n30) );
  NAND2X1 U29 ( .A(n32), .B(n78), .Y(n4) );
  NOR2X1 U31 ( .A(n93), .B(A[11]), .Y(n31) );
  NAND2X1 U32 ( .A(n93), .B(A[11]), .Y(n32) );
  XNOR2X1 U33 ( .A(n174), .B(n5), .Y(DIFF[10]) );
  AOI21X1 U34 ( .A(n186), .B(n38), .C(n35), .Y(n33) );
  NAND2X1 U37 ( .A(n37), .B(n186), .Y(n5) );
  NAND2X1 U40 ( .A(n94), .B(A[10]), .Y(n37) );
  XOR2X1 U41 ( .A(n41), .B(n6), .Y(DIFF[9]) );
  OAI21X1 U42 ( .A(n41), .B(n39), .C(n40), .Y(n38) );
  NAND2X1 U43 ( .A(n40), .B(n80), .Y(n6) );
  NOR2X1 U45 ( .A(n95), .B(A[9]), .Y(n39) );
  NAND2X1 U46 ( .A(n95), .B(A[9]), .Y(n40) );
  XNOR2X1 U47 ( .A(n46), .B(n7), .Y(DIFF[8]) );
  AOI21X1 U48 ( .A(n183), .B(n46), .C(n43), .Y(n41) );
  NAND2X1 U51 ( .A(n45), .B(n183), .Y(n7) );
  NAND2X1 U54 ( .A(n96), .B(A[8]), .Y(n45) );
  OAI21X1 U56 ( .A(n49), .B(n47), .C(n48), .Y(n46) );
  NAND2X1 U57 ( .A(n48), .B(n82), .Y(n8) );
  NOR2X1 U59 ( .A(n97), .B(A[7]), .Y(n47) );
  NAND2X1 U60 ( .A(n97), .B(A[7]), .Y(n48) );
  XNOR2X1 U61 ( .A(n54), .B(n9), .Y(DIFF[6]) );
  AOI21X1 U62 ( .A(n182), .B(n54), .C(n51), .Y(n49) );
  NAND2X1 U65 ( .A(n53), .B(n182), .Y(n9) );
  NAND2X1 U68 ( .A(n98), .B(A[6]), .Y(n53) );
  XOR2X1 U69 ( .A(n57), .B(n10), .Y(DIFF[5]) );
  OAI21X1 U70 ( .A(n57), .B(n55), .C(n56), .Y(n54) );
  NAND2X1 U71 ( .A(n56), .B(n84), .Y(n10) );
  NOR2X1 U73 ( .A(n99), .B(A[5]), .Y(n55) );
  NAND2X1 U74 ( .A(n99), .B(A[5]), .Y(n56) );
  XNOR2X1 U75 ( .A(n62), .B(n11), .Y(DIFF[4]) );
  AOI21X1 U76 ( .A(n185), .B(n62), .C(n59), .Y(n57) );
  NAND2X1 U79 ( .A(n61), .B(n185), .Y(n11) );
  NAND2X1 U82 ( .A(n100), .B(A[4]), .Y(n61) );
  XOR2X1 U83 ( .A(n65), .B(n12), .Y(DIFF[3]) );
  OAI21X1 U84 ( .A(n65), .B(n63), .C(n64), .Y(n62) );
  NAND2X1 U85 ( .A(n64), .B(n86), .Y(n12) );
  NOR2X1 U87 ( .A(n101), .B(A[3]), .Y(n63) );
  NAND2X1 U88 ( .A(n101), .B(A[3]), .Y(n64) );
  XNOR2X1 U89 ( .A(n70), .B(n13), .Y(DIFF[2]) );
  AOI21X1 U90 ( .A(n184), .B(n70), .C(n67), .Y(n65) );
  NAND2X1 U93 ( .A(n69), .B(n184), .Y(n13) );
  NAND2X1 U96 ( .A(n102), .B(A[2]), .Y(n69) );
  XOR2X1 U97 ( .A(n73), .B(n14), .Y(DIFF[1]) );
  OAI21X1 U98 ( .A(n71), .B(n73), .C(n72), .Y(n70) );
  NAND2X1 U99 ( .A(n72), .B(n88), .Y(n14) );
  NOR2X1 U101 ( .A(n103), .B(A[1]), .Y(n71) );
  NAND2X1 U102 ( .A(n103), .B(A[1]), .Y(n72) );
  XNOR2X1 U103 ( .A(n189), .B(n190), .Y(DIFF[0]) );
  NOR2X1 U104 ( .A(A[0]), .B(n190), .Y(n73) );
  INVX1 U125 ( .A(B[0]), .Y(n190) );
  INVX2 U126 ( .A(B[15]), .Y(n89) );
  NAND2X1 U127 ( .A(n74), .B(A[15]), .Y(n164) );
  NAND2X1 U128 ( .A(n74), .B(n89), .Y(n165) );
  NAND2X1 U129 ( .A(A[15]), .B(n89), .Y(n166) );
  NAND3X1 U130 ( .A(n165), .B(n164), .C(n166), .Y(n177) );
  INVX2 U131 ( .A(n17), .Y(n74) );
  XOR2X1 U132 ( .A(A[15]), .B(n89), .Y(n167) );
  XOR2X1 U133 ( .A(n74), .B(n167), .Y(DIFF[15]) );
  NAND2X1 U134 ( .A(n74), .B(A[15]), .Y(n168) );
  NAND2X1 U135 ( .A(n74), .B(n89), .Y(n169) );
  NAND2X1 U136 ( .A(A[15]), .B(n89), .Y(n170) );
  NAND3X1 U137 ( .A(n169), .B(n168), .C(n170), .Y(n16) );
  BUFX2 U138 ( .A(n49), .Y(n171) );
  INVX1 U139 ( .A(B[12]), .Y(n92) );
  INVX1 U140 ( .A(B[2]), .Y(n102) );
  INVX1 U141 ( .A(B[4]), .Y(n100) );
  INVX1 U142 ( .A(B[14]), .Y(n90) );
  BUFX2 U143 ( .A(n25), .Y(n172) );
  BUFX2 U144 ( .A(n33), .Y(n173) );
  BUFX2 U145 ( .A(n38), .Y(n174) );
  INVX1 U146 ( .A(n30), .Y(n175) );
  INVX2 U147 ( .A(n175), .Y(n176) );
  XOR2X1 U148 ( .A(n105), .B(B[16]), .Y(n178) );
  XOR2X1 U149 ( .A(n177), .B(n178), .Y(DIFF[16]) );
  NAND2X1 U150 ( .A(n16), .B(n105), .Y(n179) );
  NAND2X1 U151 ( .A(n16), .B(B[16]), .Y(n180) );
  NAND2X1 U152 ( .A(n105), .B(B[16]), .Y(n181) );
  NAND3X1 U153 ( .A(n180), .B(n179), .C(n181), .Y(n15) );
  XOR2X1 U154 ( .A(n173), .B(n4), .Y(DIFF[11]) );
  XOR2X1 U155 ( .A(n171), .B(n8), .Y(DIFF[7]) );
  OR2X2 U156 ( .A(n102), .B(A[2]), .Y(n184) );
  OR2X1 U157 ( .A(n98), .B(A[6]), .Y(n182) );
  OR2X1 U158 ( .A(n96), .B(A[8]), .Y(n183) );
  OR2X1 U159 ( .A(n100), .B(A[4]), .Y(n185) );
  OR2X1 U160 ( .A(n94), .B(A[10]), .Y(n186) );
  OR2X1 U161 ( .A(n92), .B(A[12]), .Y(n187) );
  OR2X1 U162 ( .A(n90), .B(A[14]), .Y(n188) );
  BUFX2 U163 ( .A(A[0]), .Y(n189) );
  INVX1 U164 ( .A(B[8]), .Y(n96) );
  INVX1 U165 ( .A(B[6]), .Y(n98) );
  INVX1 U166 ( .A(B[10]), .Y(n94) );
  INVX1 U167 ( .A(B[11]), .Y(n93) );
  INVX1 U168 ( .A(B[3]), .Y(n101) );
  INVX1 U169 ( .A(B[5]), .Y(n99) );
  INVX1 U170 ( .A(B[1]), .Y(n103) );
  INVX1 U171 ( .A(B[9]), .Y(n95) );
  INVX1 U172 ( .A(B[13]), .Y(n91) );
  INVX2 U173 ( .A(B[7]), .Y(n97) );
  INVX2 U174 ( .A(n71), .Y(n88) );
  INVX2 U175 ( .A(n63), .Y(n86) );
  INVX2 U176 ( .A(n55), .Y(n84) );
  INVX2 U177 ( .A(n47), .Y(n82) );
  INVX2 U178 ( .A(n39), .Y(n80) );
  INVX2 U179 ( .A(n31), .Y(n78) );
  INVX2 U180 ( .A(n23), .Y(n76) );
  INVX2 U181 ( .A(n69), .Y(n67) );
  INVX2 U182 ( .A(n61), .Y(n59) );
  INVX2 U183 ( .A(n53), .Y(n51) );
  INVX2 U184 ( .A(n45), .Y(n43) );
  INVX2 U185 ( .A(n37), .Y(n35) );
  INVX2 U186 ( .A(n29), .Y(n27) );
  INVX2 U187 ( .A(n21), .Y(n19) );
  INVX2 U188 ( .A(A[17]), .Y(n105) );
  INVX2 U189 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n20, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34, n36,
         n38, n39, n40, n41, n42, n44, n46, n47, n48, n49, n50, n52, n54, n55,
         n56, n57, n58, n60, n62, n63, n64, n65, n66, n68, n70, n71, n72, n73,
         n75, n76, n78, n80, n82, n84, n86, n88, n90, n92, n93, n152, n153,
         n154, n155, n156, n157, n158, n159, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171;

  XNOR2X1 U5 ( .A(n23), .B(n1), .Y(SUM[14]) );
  AOI21X1 U6 ( .A(n171), .B(n23), .C(n20), .Y(n18) );
  NAND2X1 U9 ( .A(n22), .B(n171), .Y(n1) );
  NAND2X1 U12 ( .A(B[14]), .B(A[14]), .Y(n22) );
  XOR2X1 U13 ( .A(n26), .B(n2), .Y(SUM[13]) );
  OAI21X1 U14 ( .A(n26), .B(n24), .C(n25), .Y(n23) );
  NAND2X1 U15 ( .A(n25), .B(n78), .Y(n2) );
  NOR2X1 U17 ( .A(B[13]), .B(A[13]), .Y(n24) );
  NAND2X1 U18 ( .A(B[13]), .B(A[13]), .Y(n25) );
  XNOR2X1 U19 ( .A(n31), .B(n3), .Y(SUM[12]) );
  AOI21X1 U20 ( .A(n169), .B(n31), .C(n28), .Y(n26) );
  NAND2X1 U23 ( .A(n30), .B(n169), .Y(n3) );
  NAND2X1 U26 ( .A(B[12]), .B(A[12]), .Y(n30) );
  XOR2X1 U27 ( .A(n34), .B(n4), .Y(SUM[11]) );
  OAI21X1 U28 ( .A(n34), .B(n32), .C(n33), .Y(n31) );
  NAND2X1 U29 ( .A(n33), .B(n80), .Y(n4) );
  NOR2X1 U31 ( .A(B[11]), .B(A[11]), .Y(n32) );
  NAND2X1 U32 ( .A(B[11]), .B(A[11]), .Y(n33) );
  XNOR2X1 U33 ( .A(n39), .B(n5), .Y(SUM[10]) );
  AOI21X1 U34 ( .A(n170), .B(n39), .C(n36), .Y(n34) );
  NAND2X1 U37 ( .A(n38), .B(n170), .Y(n5) );
  NAND2X1 U40 ( .A(B[10]), .B(A[10]), .Y(n38) );
  XOR2X1 U41 ( .A(n42), .B(n6), .Y(SUM[9]) );
  OAI21X1 U42 ( .A(n42), .B(n40), .C(n41), .Y(n39) );
  NAND2X1 U43 ( .A(n41), .B(n82), .Y(n6) );
  NOR2X1 U45 ( .A(B[9]), .B(A[9]), .Y(n40) );
  NAND2X1 U46 ( .A(B[9]), .B(A[9]), .Y(n41) );
  XNOR2X1 U47 ( .A(n47), .B(n7), .Y(SUM[8]) );
  AOI21X1 U48 ( .A(n165), .B(n47), .C(n44), .Y(n42) );
  NAND2X1 U51 ( .A(n46), .B(n165), .Y(n7) );
  NAND2X1 U54 ( .A(B[8]), .B(A[8]), .Y(n46) );
  XOR2X1 U55 ( .A(n50), .B(n8), .Y(SUM[7]) );
  OAI21X1 U56 ( .A(n50), .B(n48), .C(n49), .Y(n47) );
  NAND2X1 U57 ( .A(n49), .B(n84), .Y(n8) );
  NOR2X1 U59 ( .A(B[7]), .B(A[7]), .Y(n48) );
  NAND2X1 U60 ( .A(B[7]), .B(A[7]), .Y(n49) );
  XNOR2X1 U61 ( .A(n55), .B(n9), .Y(SUM[6]) );
  AOI21X1 U62 ( .A(n166), .B(n55), .C(n52), .Y(n50) );
  NAND2X1 U65 ( .A(n54), .B(n166), .Y(n9) );
  NAND2X1 U68 ( .A(B[6]), .B(A[6]), .Y(n54) );
  XOR2X1 U69 ( .A(n58), .B(n10), .Y(SUM[5]) );
  OAI21X1 U70 ( .A(n58), .B(n56), .C(n57), .Y(n55) );
  NAND2X1 U71 ( .A(n57), .B(n86), .Y(n10) );
  NOR2X1 U73 ( .A(B[5]), .B(A[5]), .Y(n56) );
  NAND2X1 U74 ( .A(B[5]), .B(A[5]), .Y(n57) );
  XNOR2X1 U75 ( .A(n162), .B(n11), .Y(SUM[4]) );
  AOI21X1 U76 ( .A(n63), .B(n168), .C(n60), .Y(n58) );
  NAND2X1 U79 ( .A(n62), .B(n168), .Y(n11) );
  NAND2X1 U82 ( .A(B[4]), .B(A[4]), .Y(n62) );
  XOR2X1 U83 ( .A(n66), .B(n12), .Y(SUM[3]) );
  OAI21X1 U84 ( .A(n66), .B(n64), .C(n65), .Y(n63) );
  NAND2X1 U85 ( .A(n65), .B(n88), .Y(n12) );
  NOR2X1 U87 ( .A(B[3]), .B(A[3]), .Y(n64) );
  NAND2X1 U88 ( .A(B[3]), .B(A[3]), .Y(n65) );
  XNOR2X1 U89 ( .A(n71), .B(n13), .Y(SUM[2]) );
  AOI21X1 U90 ( .A(n167), .B(n71), .C(n68), .Y(n66) );
  NAND2X1 U93 ( .A(n70), .B(n167), .Y(n13) );
  NAND2X1 U96 ( .A(B[2]), .B(A[2]), .Y(n70) );
  XOR2X1 U97 ( .A(n14), .B(n163), .Y(SUM[1]) );
  OAI21X1 U98 ( .A(n72), .B(n75), .C(n73), .Y(n71) );
  NAND2X1 U99 ( .A(n73), .B(n90), .Y(n14) );
  NOR2X1 U101 ( .A(B[1]), .B(A[1]), .Y(n72) );
  NAND2X1 U102 ( .A(B[1]), .B(A[1]), .Y(n73) );
  NAND2X1 U107 ( .A(B[0]), .B(A[0]), .Y(n75) );
  XOR2X1 U113 ( .A(B[15]), .B(A[15]), .Y(n152) );
  XOR2X1 U114 ( .A(n152), .B(n76), .Y(SUM[15]) );
  NAND2X1 U115 ( .A(B[15]), .B(A[15]), .Y(n153) );
  NAND2X1 U116 ( .A(B[15]), .B(n76), .Y(n154) );
  NAND2X1 U117 ( .A(A[15]), .B(n76), .Y(n155) );
  NAND3X1 U118 ( .A(n153), .B(n154), .C(n155), .Y(n17) );
  XOR2X1 U119 ( .A(n92), .B(n93), .Y(n156) );
  XOR2X1 U120 ( .A(n156), .B(n17), .Y(SUM[16]) );
  NAND2X1 U121 ( .A(n92), .B(n93), .Y(n157) );
  NAND2X1 U122 ( .A(n92), .B(n17), .Y(n158) );
  NAND2X1 U123 ( .A(n93), .B(n17), .Y(n159) );
  NAND3X1 U124 ( .A(n157), .B(n158), .C(n159), .Y(n16) );
  INVX1 U125 ( .A(n72), .Y(n90) );
  AND2X2 U126 ( .A(n163), .B(n164), .Y(SUM[0]) );
  OR2X2 U127 ( .A(B[2]), .B(A[2]), .Y(n167) );
  OR2X2 U128 ( .A(B[8]), .B(A[8]), .Y(n165) );
  INVX1 U129 ( .A(n63), .Y(n161) );
  INVX2 U130 ( .A(n161), .Y(n162) );
  BUFX2 U131 ( .A(n75), .Y(n163) );
  OR2X2 U132 ( .A(B[0]), .B(A[0]), .Y(n164) );
  OR2X2 U133 ( .A(B[4]), .B(A[4]), .Y(n168) );
  OR2X2 U134 ( .A(B[12]), .B(A[12]), .Y(n169) );
  OR2X2 U135 ( .A(B[14]), .B(A[14]), .Y(n171) );
  OR2X1 U136 ( .A(B[6]), .B(A[6]), .Y(n166) );
  OR2X1 U137 ( .A(B[10]), .B(A[10]), .Y(n170) );
  INVX2 U138 ( .A(A[17]), .Y(n93) );
  INVX2 U139 ( .A(B[17]), .Y(n92) );
  INVX2 U140 ( .A(n64), .Y(n88) );
  INVX2 U141 ( .A(n56), .Y(n86) );
  INVX2 U142 ( .A(n48), .Y(n84) );
  INVX2 U143 ( .A(n40), .Y(n82) );
  INVX2 U144 ( .A(n32), .Y(n80) );
  INVX2 U145 ( .A(n24), .Y(n78) );
  INVX2 U146 ( .A(n18), .Y(n76) );
  INVX2 U147 ( .A(n70), .Y(n68) );
  INVX2 U148 ( .A(n62), .Y(n60) );
  INVX2 U149 ( .A(n54), .Y(n52) );
  INVX2 U150 ( .A(n46), .Y(n44) );
  INVX2 U151 ( .A(n38), .Y(n36) );
  INVX2 U152 ( .A(n30), .Y(n28) );
  INVX2 U153 ( .A(n22), .Y(n20) );
  INVX2 U154 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu_DW_mult_uns_2 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n6, n7, n9, n12, n13, n16, n18, n19, n25, n31, n34, n37, n40, n46,
         n49, n51, n52, n53, n55, n56, n57, n58, n59, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n72, n73, n74, n75, n77, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n109, n111,
         n112, n113, n114, n115, n116, n120, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n133, n134, n135, n136, n137, n140, n142,
         n144, n145, n146, n147, n148, n149, n151, n154, n155, n156, n159,
         n160, n161, n162, n163, n164, n165, n166, n169, n170, n171, n172,
         n173, n174, n177, n178, n179, n181, n182, n183, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n197, n198, n199, n200,
         n201, n202, n205, n206, n207, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n248,
         n249, n250, n251, n256, n257, n258, n259, n264, n265, n266, n267,
         n275, n279, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323, n324, n325, n326, n327, n328, n329, n330, n331, n332, n333,
         n334, n335, n336, n337, n338, n339, n340, n341, n342, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n358, n359, n360, n361, n362, n363, n364, n365, n366,
         n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, n377,
         n378, n379, n380, n381, n382, n383, n384, n385, n387, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n545, n546,
         n548, n551, n554, n557, n560, n563, n565, n566, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n582, n584, n585, n586, n587, n588, n589, n590, n591, n592, n593,
         n594, n595, n596, n597, n598, n599, n600, n601, n602, n603, n604,
         n605, n606, n607, n608, n609, n610, n611, n612, n613, n614, n615,
         n616, n617, n618, n619, n620, n621, n622, n623, n624, n625, n626,
         n627, n628, n629, n630, n631, n632, n633, n634, n635, n636, n637,
         n638, n639, n640, n641, n642, n643, n644, n645, n646, n647, n648,
         n649, n650, n651, n652, n653, n654, n655, n656, n657, n658, n659,
         n660, n661, n662, n663, n664, n665, n666, n667, n668, n669, n670,
         n671, n672, n673, n674, n675, n676, n677, n678, n679, n680, n681,
         n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692,
         n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, n703,
         n704, n705, n706, n707, n708, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n741,
         n742, n743, n744, n745, n746, n747, n748, n749, n750, n751, n752,
         n753, n754, n755, n756, n757, n758, n759, n760, n761, n762, n763,
         n764, n765, n766, n767, n768, n769, n770, n771, n772, n773, n774,
         n775, n776, n777, n778, n779, n780, n781, n782, n783, n784, n785,
         n786, n787, n788, n789, n790, n791, n792, n793, n794, n795, n796,
         n797, n798, n799, n800, n801, n802, n803, n804, n805, n806, n807,
         n808, n809, n810, n811, n812, n813, n814, n815, n816, n817, n818,
         n819, n820, n821, n822, n823, n824, n825, n826, n827, n828, n829,
         n830, n831, n832, n833, n834, n835, n836, n837, n838, n839, n840,
         n841, n842, n843, n844, n845, n846, n847, n848, n849, n850, n851,
         n852, n853, n854, n855, n856, n857, n858, n859, n860, n861, n862,
         n863, n864, n865, n866, n867, n868, n869, n870, n871, n872, n873,
         n874, n875, n876, n877, n878, n879, n880, n881, n882, n883, n884,
         n885, n886, n887, n888, n889, n890, n891, n893, n894, n895, n897,
         n898, n899, n900, n917, n919, n920, n921, n922, n923, n925, n995,
         n996, n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005,
         n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015,
         n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025,
         n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035,
         n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045,
         n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055,
         n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065,
         n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075,
         n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085,
         n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095,
         n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105,
         n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115,
         n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125,
         n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135,
         n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145,
         n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155,
         n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165,
         n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175,
         n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185,
         n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195,
         n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205,
         n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215,
         n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225,
         n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235,
         n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245,
         n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255,
         n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265,
         n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275,
         n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285,
         n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295,
         n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304, n1305,
         n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315,
         n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324, n1325,
         n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333, n1334, n1335,
         n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343, n1344, n1345,
         n1346, n1347, n1348, n1349, n1350, n1351, n1352, n1353, n1354, n1355,
         n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363, n1364, n1365,
         n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373, n1374, n1375,
         n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383, n1384, n1385,
         n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394, n1395,
         n1396, n1397, n1398, n1399, n1400;
  assign n1 = b[1];
  assign n7 = b[3];
  assign n13 = b[5];
  assign n19 = b[7];
  assign n25 = b[9];
  assign n31 = b[11];
  assign n37 = b[13];
  assign n49 = a[15];
  assign n541 = b[15];
  assign n877 = a[30];
  assign n878 = a[29];
  assign n879 = a[28];
  assign n880 = a[27];
  assign n881 = a[26];
  assign n882 = a[25];
  assign n883 = a[24];
  assign n884 = a[23];
  assign n885 = a[22];
  assign n886 = a[21];
  assign n887 = a[20];
  assign n888 = a[19];
  assign n889 = a[18];
  assign n890 = a[17];
  assign n891 = a[16];

  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  XOR2X1 U59 ( .A(n86), .B(n55), .Y(product[45]) );
  AOI21X1 U60 ( .A(n1346), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1231), .B(n1255), .Y(n74) );
  OAI21X1 U62 ( .A(n1231), .B(n1136), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NAND2X1 U71 ( .A(n85), .B(n275), .Y(n55) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  XOR2X1 U75 ( .A(n95), .B(n56), .Y(product[44]) );
  AOI21X1 U76 ( .A(n1346), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n89), .B(n1256), .Y(n87) );
  OAI21X1 U78 ( .A(n89), .B(n1259), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NAND2X1 U83 ( .A(n94), .B(n91), .Y(n56) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  XOR2X1 U87 ( .A(n112), .B(n57), .Y(product[43]) );
  AOI21X1 U88 ( .A(n1346), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n1256), .Y(n96) );
  OAI21X1 U90 ( .A(n1136), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n137), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n106), .B(n130), .Y(n104) );
  OAI21X1 U98 ( .A(n106), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1241), .B(n1091), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1241), .C(n109), .Y(n107) );
  NAND2X1 U103 ( .A(n111), .B(n1241), .Y(n57) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  XOR2X1 U107 ( .A(n123), .B(n58), .Y(product[42]) );
  AOI21X1 U108 ( .A(n1346), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n1256), .B(n115), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1259), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1091), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n1091), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U117 ( .A(n122), .B(n1091), .Y(n58) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  XOR2X1 U121 ( .A(n134), .B(n59), .Y(product[41]) );
  AOI21X1 U122 ( .A(n1346), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n126), .B(n1256), .Y(n124) );
  OAI21X1 U124 ( .A(n1136), .B(n126), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n130), .B(n137), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NAND2X1 U131 ( .A(n133), .B(n279), .Y(n59) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  AOI21X1 U136 ( .A(n1166), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1201), .B(n1255), .Y(n135) );
  OAI21X1 U138 ( .A(n1259), .B(n1201), .C(n140), .Y(n136) );
  NAND2X1 U141 ( .A(n1232), .B(n281), .Y(n137) );
  AOI21X1 U142 ( .A(n151), .B(n1232), .C(n142), .Y(n140) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  AOI21X1 U150 ( .A(n1346), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1256), .Y(n146) );
  OAI21X1 U152 ( .A(n1259), .B(n148), .C(n149), .Y(n147) );
  NOR2X1 U159 ( .A(n339), .B(n330), .Y(n148) );
  NAND2X1 U160 ( .A(n339), .B(n330), .Y(n149) );
  XOR2X1 U161 ( .A(n163), .B(n62), .Y(product[38]) );
  AOI21X1 U162 ( .A(n1346), .B(n155), .C(n156), .Y(n154) );
  NAND2X1 U165 ( .A(n159), .B(n171), .Y(n53) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n161), .B(n169), .C(n162), .Y(n160) );
  NAND2X1 U169 ( .A(n162), .B(n282), .Y(n62) );
  NOR2X1 U171 ( .A(n340), .B(n349), .Y(n161) );
  NAND2X1 U172 ( .A(n340), .B(n349), .Y(n162) );
  XOR2X1 U173 ( .A(n170), .B(n63), .Y(product[37]) );
  AOI21X1 U174 ( .A(n164), .B(n1346), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n1004), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n166), .C(n169), .Y(n165) );
  NAND2X1 U179 ( .A(n169), .B(n283), .Y(n63) );
  NOR2X1 U181 ( .A(n350), .B(n361), .Y(n166) );
  NAND2X1 U182 ( .A(n350), .B(n361), .Y(n169) );
  XOR2X1 U183 ( .A(n179), .B(n64), .Y(product[36]) );
  AOI21X1 U184 ( .A(n1165), .B(n1346), .C(n1156), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n1157), .B(n183), .C(n178), .Y(n172) );
  NAND2X1 U191 ( .A(n178), .B(n284), .Y(n64) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  XNOR2X1 U195 ( .A(n1166), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n285), .B(n1346), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n387), .B(n374), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n185), .B(n213), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n200), .B(n1100), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n189), .B(n194), .Y(n187) );
  OAI21X1 U208 ( .A(n1179), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NOR2X1 U211 ( .A(n401), .B(n1101), .Y(n189) );
  NAND2X1 U212 ( .A(n401), .B(n1101), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n212), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1227), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n1227), .C(n1174), .Y(n193) );
  NAND2X1 U219 ( .A(n1174), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n402), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n1169), .B(n212), .C(n200), .Y(n198) );
  NOR2X1 U229 ( .A(n210), .B(n205), .Y(n199) );
  OAI21X1 U230 ( .A(n1272), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n429), .B(n416), .Y(n205) );
  NAND2X1 U234 ( .A(n429), .B(n416), .Y(n206) );
  XNOR2X1 U235 ( .A(n212), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n212), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n443), .B(n430), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n216), .Y(n214) );
  OAI21X1 U247 ( .A(n1190), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n444), .B(n457), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1233), .B(n1236), .Y(n223) );
  AOI21X1 U258 ( .A(n1233), .B(n1235), .C(n1237), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n236), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1234), .B(n248), .C(n1238), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1246), .C(n1247), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1242), .C(n1243), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1245), .B(n1228), .C(n1229), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n601), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n305), .B(n574), .C(n585), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n602), .C(n586), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n315), .C(n310), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n587), .B(n619), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n319), .B(n575), .C(n603), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U322 ( .A(n320), .B(n620), .C(n588), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U327 ( .A(n337), .B(n576), .C(n621), .YC(n327), .YS(n328) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U330 ( .A(n622), .B(n606), .C(n347), .YC(n333), .YS(n334) );
  FAX1 U331 ( .A(n338), .B(n638), .C(n590), .YC(n335), .YS(n336) );
  FAX1 U335 ( .A(n607), .B(n348), .C(n357), .YC(n343), .YS(n344) );
  FAX1 U336 ( .A(n623), .B(n591), .C(n655), .YC(n345), .YS(n346) );
  FAX1 U337 ( .A(n359), .B(n577), .C(n639), .YC(n347), .YS(n348) );
  FAX1 U342 ( .A(n360), .B(n656), .C(n592), .YC(n357), .YS(n358) );
  FAX1 U344 ( .A(n366), .B(n375), .C(n364), .YC(n361), .YS(n362) );
  FAX1 U350 ( .A(n378), .B(n389), .C(n376), .YC(n373), .YS(n374) );
  FAX1 U353 ( .A(n626), .B(n399), .C(n397), .YC(n379), .YS(n380) );
  FAX1 U354 ( .A(n658), .B(n610), .C(n594), .YC(n381), .YS(n382) );
  FAX1 U359 ( .A(n1086), .B(n398), .C(n396), .YC(n391), .YS(n392) );
  FAX1 U361 ( .A(n611), .B(n595), .C(n1160), .YC(n395), .YS(n396) );
  FAX1 U362 ( .A(n627), .B(n675), .C(n691), .YC(n397), .YS(n398) );
  FAX1 U366 ( .A(n412), .B(n423), .C(n410), .YC(n405), .YS(n406) );
  FAX1 U367 ( .A(n427), .B(n414), .C(n425), .YC(n407), .YS(n408) );
  FAX1 U370 ( .A(n1161), .B(n580), .C(n644), .YC(n413), .YS(n414) );
  FAX1 U374 ( .A(n428), .B(n441), .C(n437), .YC(n421), .YS(n422) );
  FAX1 U376 ( .A(n661), .B(n693), .C(n677), .YC(n425), .YS(n426) );
  FAX1 U380 ( .A(n442), .B(n440), .C(n438), .YC(n433), .YS(n434) );
  FAX1 U381 ( .A(n455), .B(n453), .C(n451), .YC(n435), .YS(n436) );
  FAX1 U382 ( .A(n630), .B(n694), .C(n614), .YC(n437), .YS(n438) );
  FAX1 U383 ( .A(n662), .B(n598), .C(n678), .YC(n439), .YS(n440) );
  FAX1 U389 ( .A(n695), .B(n615), .C(n663), .YC(n451), .YS(n452) );
  HAX1 U391 ( .A(n711), .B(n565), .YC(n455), .YS(n456) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U395 ( .A(n664), .B(n632), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U397 ( .A(n712), .B(n696), .C(n600), .YC(n467), .YS(n468) );
  FAX1 U399 ( .A(n476), .B(n478), .C(n485), .YC(n471), .YS(n472) );
  FAX1 U400 ( .A(n480), .B(n1087), .C(n487), .YC(n473), .YS(n474) );
  FAX1 U401 ( .A(n649), .B(n633), .C(n566), .YC(n475), .YS(n476) );
  HAX1 U403 ( .A(n713), .B(n681), .YC(n479), .YS(n480) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U405 ( .A(n490), .B(n488), .C(n495), .YC(n483), .YS(n484) );
  FAX1 U406 ( .A(n666), .B(n499), .C(n497), .YC(n485), .YS(n486) );
  FAX1 U407 ( .A(n650), .B(n634), .C(n682), .YC(n487), .YS(n488) );
  FAX1 U408 ( .A(n714), .B(n698), .C(n618), .YC(n489), .YS(n490) );
  FAX1 U409 ( .A(n496), .B(n1088), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U411 ( .A(n667), .B(n567), .C(n500), .YC(n495), .YS(n496) );
  HAX1 U413 ( .A(n715), .B(n683), .YC(n499), .YS(n500) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n996), .C(n508), .YC(n503), .YS(n504) );
  FAX1 U417 ( .A(n636), .B(n700), .C(n716), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n568), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n669), .B(n701), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n717), .B(n685), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n670), .B(n686), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n718), .B(n702), .C(n654), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n569), .B(n703), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n719), .B(n687), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n688), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n720), .B(n704), .C(n672), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n705), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n721), .B(n570), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n722), .B(n706), .C(n690), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n1230), .B(n1396), .Y(n573) );
  NOR2X1 U435 ( .A(n1394), .B(n1230), .Y(n295) );
  NOR2X1 U436 ( .A(n1392), .B(n1230), .Y(n574) );
  NOR2X1 U437 ( .A(n1109), .B(n1230), .Y(n305) );
  NOR2X1 U438 ( .A(n1388), .B(n1230), .Y(n575) );
  NOR2X1 U439 ( .A(n1386), .B(n1230), .Y(n319) );
  NOR2X1 U440 ( .A(n1384), .B(n1230), .Y(n576) );
  NOR2X1 U441 ( .A(n1382), .B(n1230), .Y(n337) );
  NOR2X1 U442 ( .A(n1380), .B(n1230), .Y(n577) );
  NOR2X1 U444 ( .A(n1377), .B(n1230), .Y(n578) );
  NOR2X1 U446 ( .A(n1373), .B(n1230), .Y(n579) );
  NOR2X1 U447 ( .A(n1371), .B(n1230), .Y(n580) );
  OAI22X1 U466 ( .A(n1343), .B(n757), .C(n1230), .D(n1249), .Y(n565) );
  OAI22X1 U469 ( .A(n1230), .B(n1343), .C(n741), .D(n1344), .Y(n584) );
  OAI22X1 U470 ( .A(n1343), .B(n741), .C(n742), .D(n1267), .Y(n585) );
  OAI22X1 U471 ( .A(n1343), .B(n742), .C(n743), .D(n1344), .Y(n586) );
  OAI22X1 U472 ( .A(n1343), .B(n743), .C(n744), .D(n1267), .Y(n587) );
  OAI22X1 U473 ( .A(n1343), .B(n744), .C(n745), .D(n1344), .Y(n588) );
  OAI22X1 U474 ( .A(n1343), .B(n745), .C(n746), .D(n1267), .Y(n589) );
  OAI22X1 U475 ( .A(n1343), .B(n746), .C(n747), .D(n1344), .Y(n590) );
  OAI22X1 U476 ( .A(n1343), .B(n747), .C(n748), .D(n1267), .Y(n591) );
  OAI22X1 U477 ( .A(n1343), .B(n748), .C(n749), .D(n1344), .Y(n592) );
  OAI22X1 U478 ( .A(n1343), .B(n749), .C(n750), .D(n1249), .Y(n593) );
  OAI22X1 U479 ( .A(n1343), .B(n750), .C(n751), .D(n1344), .Y(n594) );
  OAI22X1 U480 ( .A(n1343), .B(n751), .C(n752), .D(n1249), .Y(n595) );
  OAI22X1 U482 ( .A(n1343), .B(n753), .C(n754), .D(n1249), .Y(n597) );
  OAI22X1 U483 ( .A(n1343), .B(n754), .C(n755), .D(n1344), .Y(n598) );
  OAI22X1 U484 ( .A(n1343), .B(n755), .C(n756), .D(n1249), .Y(n599) );
  AND2X1 U485 ( .A(n1398), .B(n1342), .Y(n600) );
  XNOR2X1 U487 ( .A(n1397), .B(n1216), .Y(n741) );
  XNOR2X1 U488 ( .A(n1368), .B(n1395), .Y(n742) );
  XNOR2X1 U489 ( .A(n1368), .B(n1393), .Y(n743) );
  XNOR2X1 U490 ( .A(n1368), .B(n1110), .Y(n744) );
  XNOR2X1 U491 ( .A(n1368), .B(n1389), .Y(n745) );
  XNOR2X1 U492 ( .A(n1368), .B(n1387), .Y(n746) );
  XNOR2X1 U493 ( .A(n1368), .B(n1385), .Y(n747) );
  XNOR2X1 U494 ( .A(n1368), .B(n1383), .Y(n748) );
  XNOR2X1 U495 ( .A(n1368), .B(n1381), .Y(n749) );
  XNOR2X1 U496 ( .A(n1216), .B(n1379), .Y(n750) );
  XNOR2X1 U497 ( .A(n1216), .B(n887), .Y(n751) );
  XNOR2X1 U498 ( .A(n1216), .B(n1376), .Y(n752) );
  XNOR2X1 U499 ( .A(n1216), .B(n1374), .Y(n753) );
  XNOR2X1 U500 ( .A(n1216), .B(n1372), .Y(n754) );
  XNOR2X1 U501 ( .A(n1216), .B(n1370), .Y(n755) );
  XNOR2X1 U502 ( .A(n1398), .B(n1216), .Y(n756) );
  OAI22X1 U505 ( .A(n1339), .B(n774), .C(n919), .D(n1341), .Y(n566) );
  OAI22X1 U508 ( .A(n919), .B(n1340), .C(n758), .D(n1114), .Y(n602) );
  OAI22X1 U509 ( .A(n1340), .B(n758), .C(n759), .D(n1341), .Y(n603) );
  OAI22X1 U510 ( .A(n1339), .B(n759), .C(n760), .D(n1114), .Y(n604) );
  OAI22X1 U511 ( .A(n1340), .B(n760), .C(n761), .D(n1341), .Y(n605) );
  OAI22X1 U512 ( .A(n1339), .B(n761), .C(n762), .D(n1341), .Y(n606) );
  OAI22X1 U513 ( .A(n1340), .B(n762), .C(n763), .D(n1114), .Y(n607) );
  OAI22X1 U514 ( .A(n1339), .B(n763), .C(n764), .D(n1341), .Y(n608) );
  OAI22X1 U515 ( .A(n1340), .B(n764), .C(n765), .D(n1341), .Y(n609) );
  OAI22X1 U516 ( .A(n1339), .B(n765), .C(n766), .D(n1250), .Y(n610) );
  OAI22X1 U517 ( .A(n1340), .B(n766), .C(n767), .D(n1250), .Y(n611) );
  OAI22X1 U518 ( .A(n1339), .B(n767), .C(n768), .D(n1341), .Y(n612) );
  OAI22X1 U519 ( .A(n1340), .B(n768), .C(n769), .D(n1265), .Y(n613) );
  OAI22X1 U520 ( .A(n1339), .B(n769), .C(n770), .D(n1265), .Y(n614) );
  OAI22X1 U521 ( .A(n1340), .B(n770), .C(n771), .D(n1250), .Y(n615) );
  OAI22X1 U522 ( .A(n1339), .B(n771), .C(n772), .D(n1265), .Y(n616) );
  XNOR2X1 U526 ( .A(n1397), .B(n1275), .Y(n758) );
  XNOR2X1 U527 ( .A(n1275), .B(n1395), .Y(n759) );
  XNOR2X1 U528 ( .A(n1275), .B(n1393), .Y(n760) );
  XNOR2X1 U529 ( .A(n1275), .B(n1391), .Y(n761) );
  XNOR2X1 U530 ( .A(n1275), .B(n1389), .Y(n762) );
  XNOR2X1 U531 ( .A(n1365), .B(n1387), .Y(n763) );
  XNOR2X1 U532 ( .A(n1275), .B(n1385), .Y(n764) );
  XNOR2X1 U533 ( .A(n1275), .B(n1383), .Y(n765) );
  XNOR2X1 U534 ( .A(n1275), .B(n1381), .Y(n766) );
  XNOR2X1 U535 ( .A(n1365), .B(n1379), .Y(n767) );
  XNOR2X1 U536 ( .A(n1275), .B(n887), .Y(n768) );
  XNOR2X1 U537 ( .A(n1365), .B(n1376), .Y(n769) );
  XNOR2X1 U538 ( .A(n1275), .B(n1374), .Y(n770) );
  XNOR2X1 U540 ( .A(n1275), .B(n1370), .Y(n772) );
  XNOR2X1 U541 ( .A(n1398), .B(n1275), .Y(n773) );
  OAI22X1 U544 ( .A(n1269), .B(n791), .C(n920), .D(n1002), .Y(n567) );
  OAI22X1 U547 ( .A(n920), .B(n1269), .C(n775), .D(n1002), .Y(n620) );
  OAI22X1 U548 ( .A(n1269), .B(n775), .C(n776), .D(n1001), .Y(n621) );
  OAI22X1 U549 ( .A(n1269), .B(n776), .C(n777), .D(n1002), .Y(n622) );
  OAI22X1 U550 ( .A(n1269), .B(n777), .C(n778), .D(n1002), .Y(n623) );
  OAI22X1 U551 ( .A(n1269), .B(n778), .C(n779), .D(n1002), .Y(n624) );
  OAI22X1 U552 ( .A(n1269), .B(n779), .C(n780), .D(n1002), .Y(n625) );
  OAI22X1 U553 ( .A(n1269), .B(n780), .C(n781), .D(n1002), .Y(n626) );
  OAI22X1 U554 ( .A(n1269), .B(n781), .C(n782), .D(n1336), .Y(n627) );
  OAI22X1 U555 ( .A(n1269), .B(n782), .C(n783), .D(n1001), .Y(n628) );
  OAI22X1 U556 ( .A(n1269), .B(n783), .C(n784), .D(n1336), .Y(n629) );
  OAI22X1 U557 ( .A(n1269), .B(n784), .C(n785), .D(n1336), .Y(n630) );
  OAI22X1 U558 ( .A(n1269), .B(n785), .C(n786), .D(n1002), .Y(n631) );
  OAI22X1 U559 ( .A(n1269), .B(n786), .C(n787), .D(n1002), .Y(n632) );
  OAI22X1 U560 ( .A(n1269), .B(n787), .C(n788), .D(n1001), .Y(n633) );
  OAI22X1 U561 ( .A(n1269), .B(n788), .C(n789), .D(n1336), .Y(n634) );
  OAI22X1 U562 ( .A(n1269), .B(n789), .C(n790), .D(n1336), .Y(n635) );
  AND2X1 U563 ( .A(n1398), .B(n1335), .Y(n636) );
  XNOR2X1 U565 ( .A(n1397), .B(n1363), .Y(n775) );
  XNOR2X1 U566 ( .A(n1363), .B(n1395), .Y(n776) );
  XNOR2X1 U567 ( .A(n1363), .B(n1393), .Y(n777) );
  XNOR2X1 U568 ( .A(n1363), .B(n1110), .Y(n778) );
  XNOR2X1 U569 ( .A(n1363), .B(n1389), .Y(n779) );
  XNOR2X1 U570 ( .A(n1363), .B(n1387), .Y(n780) );
  XNOR2X1 U573 ( .A(n1363), .B(n1381), .Y(n783) );
  XNOR2X1 U574 ( .A(n1363), .B(n1379), .Y(n784) );
  XNOR2X1 U575 ( .A(n1363), .B(n887), .Y(n785) );
  XNOR2X1 U576 ( .A(n1363), .B(n1376), .Y(n786) );
  XNOR2X1 U577 ( .A(n1363), .B(n1374), .Y(n787) );
  XNOR2X1 U578 ( .A(n1363), .B(n1372), .Y(n788) );
  XNOR2X1 U579 ( .A(n1363), .B(n1370), .Y(n789) );
  XNOR2X1 U580 ( .A(n1398), .B(n1363), .Y(n790) );
  OAI22X1 U583 ( .A(n998), .B(n808), .C(n921), .D(n1334), .Y(n568) );
  OAI22X1 U586 ( .A(n921), .B(n1333), .C(n792), .D(n1334), .Y(n638) );
  OAI22X1 U587 ( .A(n1333), .B(n792), .C(n793), .D(n1226), .Y(n639) );
  OAI22X1 U588 ( .A(n998), .B(n793), .C(n794), .D(n1334), .Y(n640) );
  OAI22X1 U590 ( .A(n998), .B(n795), .C(n796), .D(n1334), .Y(n642) );
  OAI22X1 U591 ( .A(n1333), .B(n796), .C(n797), .D(n1226), .Y(n643) );
  OAI22X1 U592 ( .A(n997), .B(n797), .C(n798), .D(n1226), .Y(n644) );
  OAI22X1 U593 ( .A(n1333), .B(n798), .C(n799), .D(n1226), .Y(n645) );
  OAI22X1 U594 ( .A(n998), .B(n799), .C(n800), .D(n1334), .Y(n646) );
  OAI22X1 U595 ( .A(n1333), .B(n800), .C(n801), .D(n1226), .Y(n647) );
  OAI22X1 U596 ( .A(n998), .B(n801), .C(n802), .D(n1334), .Y(n648) );
  OAI22X1 U597 ( .A(n1333), .B(n802), .C(n803), .D(n1334), .Y(n649) );
  OAI22X1 U598 ( .A(n998), .B(n803), .C(n804), .D(n1334), .Y(n650) );
  OAI22X1 U599 ( .A(n1333), .B(n804), .C(n805), .D(n1334), .Y(n651) );
  OAI22X1 U600 ( .A(n998), .B(n805), .C(n806), .D(n1334), .Y(n652) );
  OAI22X1 U601 ( .A(n1333), .B(n806), .C(n807), .D(n1334), .Y(n653) );
  AND2X1 U602 ( .A(n999), .B(n1159), .Y(n654) );
  XNOR2X1 U604 ( .A(n1397), .B(n1268), .Y(n792) );
  XNOR2X1 U605 ( .A(n1268), .B(n1395), .Y(n793) );
  XNOR2X1 U606 ( .A(n1268), .B(n1393), .Y(n794) );
  XNOR2X1 U612 ( .A(n1261), .B(n1381), .Y(n800) );
  XNOR2X1 U613 ( .A(n1261), .B(n1379), .Y(n801) );
  XNOR2X1 U614 ( .A(n1261), .B(n887), .Y(n802) );
  XNOR2X1 U615 ( .A(n1261), .B(n1376), .Y(n803) );
  XNOR2X1 U616 ( .A(n1261), .B(n1374), .Y(n804) );
  XNOR2X1 U617 ( .A(n1261), .B(n1372), .Y(n805) );
  XNOR2X1 U618 ( .A(n1261), .B(n1202), .Y(n806) );
  XNOR2X1 U619 ( .A(n1398), .B(n1268), .Y(n807) );
  OAI22X1 U622 ( .A(n1329), .B(n825), .C(n922), .D(n1330), .Y(n569) );
  OAI22X1 U625 ( .A(n922), .B(n1147), .C(n809), .D(n1330), .Y(n656) );
  OAI22X1 U626 ( .A(n1147), .B(n809), .C(n810), .D(n1330), .Y(n657) );
  OAI22X1 U627 ( .A(n1329), .B(n810), .C(n811), .D(n1330), .Y(n658) );
  OAI22X1 U628 ( .A(n1147), .B(n811), .C(n812), .D(n1331), .Y(n659) );
  OAI22X1 U629 ( .A(n1329), .B(n812), .C(n813), .D(n1330), .Y(n660) );
  OAI22X1 U630 ( .A(n1147), .B(n813), .C(n814), .D(n1330), .Y(n661) );
  OAI22X1 U631 ( .A(n1329), .B(n814), .C(n815), .D(n1330), .Y(n662) );
  OAI22X1 U632 ( .A(n1147), .B(n815), .C(n816), .D(n1330), .Y(n663) );
  OAI22X1 U633 ( .A(n1329), .B(n816), .C(n817), .D(n1330), .Y(n664) );
  OAI22X1 U634 ( .A(n1147), .B(n817), .C(n818), .D(n1330), .Y(n665) );
  OAI22X1 U635 ( .A(n1329), .B(n818), .C(n819), .D(n1330), .Y(n666) );
  OAI22X1 U636 ( .A(n1147), .B(n819), .C(n820), .D(n1330), .Y(n667) );
  OAI22X1 U637 ( .A(n1329), .B(n820), .C(n821), .D(n1330), .Y(n668) );
  OAI22X1 U638 ( .A(n1147), .B(n821), .C(n822), .D(n1330), .Y(n669) );
  OAI22X1 U639 ( .A(n1329), .B(n822), .C(n823), .D(n1330), .Y(n670) );
  OAI22X1 U640 ( .A(n1147), .B(n823), .C(n824), .D(n1330), .Y(n671) );
  AND2X1 U641 ( .A(n1398), .B(n1146), .Y(n672) );
  XNOR2X1 U643 ( .A(n1397), .B(n1189), .Y(n809) );
  XNOR2X1 U644 ( .A(n1225), .B(n1395), .Y(n810) );
  XNOR2X1 U645 ( .A(n1357), .B(n1393), .Y(n811) );
  XNOR2X1 U648 ( .A(n1189), .B(n1387), .Y(n814) );
  XNOR2X1 U649 ( .A(n1189), .B(n1385), .Y(n815) );
  XNOR2X1 U650 ( .A(n1225), .B(n1383), .Y(n816) );
  XNOR2X1 U651 ( .A(n1225), .B(n1381), .Y(n817) );
  XNOR2X1 U652 ( .A(n1357), .B(n1379), .Y(n818) );
  XNOR2X1 U653 ( .A(n1189), .B(n887), .Y(n819) );
  XNOR2X1 U654 ( .A(n1225), .B(n1376), .Y(n820) );
  XNOR2X1 U655 ( .A(n1357), .B(n1374), .Y(n821) );
  XNOR2X1 U656 ( .A(n1357), .B(n1372), .Y(n822) );
  XNOR2X1 U657 ( .A(n1189), .B(n1202), .Y(n823) );
  XNOR2X1 U658 ( .A(n1000), .B(n1357), .Y(n824) );
  OAI22X1 U661 ( .A(n1326), .B(n842), .C(n923), .D(n1328), .Y(n570) );
  OAI22X1 U664 ( .A(n923), .B(n1163), .C(n826), .D(n1328), .Y(n674) );
  OAI22X1 U665 ( .A(n1164), .B(n826), .C(n827), .D(n1328), .Y(n675) );
  OAI22X1 U666 ( .A(n827), .B(n1326), .C(n828), .D(n1328), .Y(n676) );
  OAI22X1 U667 ( .A(n1163), .B(n828), .C(n829), .D(n1328), .Y(n677) );
  OAI22X1 U668 ( .A(n1326), .B(n829), .C(n830), .D(n1328), .Y(n678) );
  OAI22X1 U669 ( .A(n1164), .B(n830), .C(n831), .D(n1328), .Y(n679) );
  OAI22X1 U670 ( .A(n1326), .B(n831), .C(n832), .D(n1328), .Y(n680) );
  OAI22X1 U671 ( .A(n1163), .B(n832), .C(n833), .D(n1328), .Y(n681) );
  OAI22X1 U672 ( .A(n1326), .B(n833), .C(n834), .D(n1328), .Y(n682) );
  OAI22X1 U673 ( .A(n1164), .B(n834), .C(n835), .D(n1328), .Y(n683) );
  OAI22X1 U674 ( .A(n1326), .B(n835), .C(n836), .D(n1328), .Y(n684) );
  OAI22X1 U675 ( .A(n1164), .B(n836), .C(n837), .D(n1328), .Y(n685) );
  OAI22X1 U676 ( .A(n1326), .B(n837), .C(n838), .D(n1328), .Y(n686) );
  OAI22X1 U677 ( .A(n1163), .B(n838), .C(n839), .D(n1328), .Y(n687) );
  OAI22X1 U678 ( .A(n1326), .B(n839), .C(n840), .D(n1328), .Y(n688) );
  OAI22X1 U679 ( .A(n1326), .B(n840), .C(n841), .D(n1328), .Y(n689) );
  AND2X1 U680 ( .A(n1000), .B(n1167), .Y(n690) );
  XNOR2X1 U682 ( .A(n1397), .B(n1099), .Y(n826) );
  XNOR2X1 U683 ( .A(n1353), .B(n1395), .Y(n827) );
  XNOR2X1 U684 ( .A(n1353), .B(n1393), .Y(n828) );
  XNOR2X1 U685 ( .A(n1353), .B(n1391), .Y(n829) );
  XNOR2X1 U686 ( .A(n1353), .B(n1389), .Y(n830) );
  XNOR2X1 U688 ( .A(n1354), .B(n1385), .Y(n832) );
  XNOR2X1 U689 ( .A(n1354), .B(n1383), .Y(n833) );
  XNOR2X1 U690 ( .A(n1354), .B(n1381), .Y(n834) );
  XNOR2X1 U691 ( .A(n1354), .B(n1379), .Y(n835) );
  XNOR2X1 U692 ( .A(n1354), .B(n887), .Y(n836) );
  XNOR2X1 U693 ( .A(n1354), .B(n1376), .Y(n837) );
  XNOR2X1 U694 ( .A(n1354), .B(n1119), .Y(n838) );
  XNOR2X1 U695 ( .A(n1354), .B(n1372), .Y(n839) );
  XNOR2X1 U696 ( .A(n1354), .B(n1202), .Y(n840) );
  XNOR2X1 U697 ( .A(n1000), .B(n1354), .Y(n841) );
  OR2X1 U698 ( .A(n999), .B(n923), .Y(n842) );
  OAI22X1 U700 ( .A(n1322), .B(n859), .C(n1176), .D(n1324), .Y(n571) );
  OAI22X1 U703 ( .A(n1176), .B(n1273), .C(n843), .D(n1324), .Y(n692) );
  OAI22X1 U704 ( .A(n1273), .B(n843), .C(n844), .D(n1324), .Y(n693) );
  OAI22X1 U705 ( .A(n1322), .B(n844), .C(n845), .D(n1324), .Y(n694) );
  OAI22X1 U706 ( .A(n1273), .B(n845), .C(n846), .D(n1324), .Y(n695) );
  OAI22X1 U707 ( .A(n1322), .B(n846), .C(n847), .D(n1324), .Y(n696) );
  OAI22X1 U708 ( .A(n1273), .B(n847), .C(n848), .D(n1324), .Y(n697) );
  OAI22X1 U709 ( .A(n1322), .B(n848), .C(n849), .D(n1266), .Y(n698) );
  OAI22X1 U710 ( .A(n1273), .B(n849), .C(n850), .D(n1324), .Y(n699) );
  OAI22X1 U711 ( .A(n1322), .B(n850), .C(n851), .D(n1324), .Y(n700) );
  OAI22X1 U712 ( .A(n1273), .B(n851), .C(n852), .D(n1324), .Y(n701) );
  OAI22X1 U713 ( .A(n1322), .B(n852), .C(n853), .D(n1324), .Y(n702) );
  OAI22X1 U714 ( .A(n1273), .B(n853), .C(n854), .D(n1324), .Y(n703) );
  OAI22X1 U715 ( .A(n1322), .B(n854), .C(n855), .D(n1324), .Y(n704) );
  OAI22X1 U716 ( .A(n1273), .B(n855), .C(n856), .D(n1324), .Y(n705) );
  OAI22X1 U717 ( .A(n1322), .B(n856), .C(n857), .D(n1324), .Y(n706) );
  OAI22X1 U718 ( .A(n1273), .B(n857), .C(n858), .D(n1324), .Y(n707) );
  AND2X1 U719 ( .A(n1000), .B(n1321), .Y(n708) );
  XNOR2X1 U721 ( .A(n1397), .B(n1177), .Y(n843) );
  XNOR2X1 U722 ( .A(n1177), .B(n1395), .Y(n844) );
  XNOR2X1 U723 ( .A(n1177), .B(n1393), .Y(n845) );
  XNOR2X1 U724 ( .A(n1177), .B(n1391), .Y(n846) );
  XNOR2X1 U725 ( .A(n1177), .B(n1389), .Y(n847) );
  XNOR2X1 U726 ( .A(n1177), .B(n1387), .Y(n848) );
  XNOR2X1 U727 ( .A(n1258), .B(n1385), .Y(n849) );
  XNOR2X1 U728 ( .A(n1257), .B(n1383), .Y(n850) );
  XNOR2X1 U729 ( .A(n1257), .B(n1381), .Y(n851) );
  XNOR2X1 U730 ( .A(n1258), .B(n1379), .Y(n852) );
  XNOR2X1 U731 ( .A(n1257), .B(n887), .Y(n853) );
  XNOR2X1 U732 ( .A(n1257), .B(n1376), .Y(n854) );
  XNOR2X1 U733 ( .A(n1258), .B(n1119), .Y(n855) );
  XNOR2X1 U734 ( .A(n1258), .B(n1372), .Y(n856) );
  XNOR2X1 U735 ( .A(n1257), .B(n1202), .Y(n857) );
  XNOR2X1 U736 ( .A(n1000), .B(n1177), .Y(n858) );
  OAI22X1 U739 ( .A(n917), .B(n876), .C(n925), .D(n1320), .Y(n572) );
  OAI22X1 U742 ( .A(n917), .B(n925), .C(n860), .D(n1320), .Y(n710) );
  OAI22X1 U743 ( .A(n917), .B(n860), .C(n861), .D(n1320), .Y(n711) );
  OAI22X1 U744 ( .A(n917), .B(n861), .C(n862), .D(n1320), .Y(n712) );
  OAI22X1 U745 ( .A(n917), .B(n862), .C(n863), .D(n1320), .Y(n713) );
  OAI22X1 U746 ( .A(n917), .B(n863), .C(n864), .D(n1320), .Y(n714) );
  OAI22X1 U747 ( .A(n917), .B(n864), .C(n865), .D(n1320), .Y(n715) );
  OAI22X1 U748 ( .A(n917), .B(n865), .C(n866), .D(n1320), .Y(n716) );
  OAI22X1 U749 ( .A(n917), .B(n866), .C(n867), .D(n1320), .Y(n717) );
  OAI22X1 U750 ( .A(n917), .B(n867), .C(n868), .D(n1320), .Y(n718) );
  OAI22X1 U751 ( .A(n917), .B(n868), .C(n869), .D(n1320), .Y(n719) );
  OAI22X1 U752 ( .A(n917), .B(n869), .C(n870), .D(n1320), .Y(n720) );
  OAI22X1 U753 ( .A(n917), .B(n870), .C(n871), .D(n1320), .Y(n721) );
  OAI22X1 U754 ( .A(n917), .B(n871), .C(n872), .D(n1320), .Y(n722) );
  OAI22X1 U755 ( .A(n917), .B(n872), .C(n873), .D(n1320), .Y(n723) );
  OAI22X1 U756 ( .A(n917), .B(n873), .C(n874), .D(n1320), .Y(n724) );
  OAI22X1 U757 ( .A(n917), .B(n874), .C(n1320), .D(n875), .Y(n725) );
  XNOR2X1 U758 ( .A(n1397), .B(n1349), .Y(n860) );
  XNOR2X1 U759 ( .A(n1349), .B(n1395), .Y(n861) );
  XNOR2X1 U760 ( .A(n1349), .B(n1393), .Y(n862) );
  XNOR2X1 U761 ( .A(n1349), .B(n1391), .Y(n863) );
  XNOR2X1 U762 ( .A(n1349), .B(n1389), .Y(n864) );
  XNOR2X1 U763 ( .A(n1349), .B(n1387), .Y(n865) );
  XNOR2X1 U764 ( .A(n1349), .B(n1385), .Y(n866) );
  XNOR2X1 U765 ( .A(n1349), .B(n1383), .Y(n867) );
  XNOR2X1 U766 ( .A(n1349), .B(n1381), .Y(n868) );
  XNOR2X1 U767 ( .A(n1349), .B(n1379), .Y(n869) );
  XNOR2X1 U768 ( .A(n1349), .B(n887), .Y(n870) );
  XNOR2X1 U769 ( .A(n1349), .B(n1376), .Y(n871) );
  XNOR2X1 U770 ( .A(n1349), .B(n1119), .Y(n872) );
  XNOR2X1 U771 ( .A(n1349), .B(n1372), .Y(n873) );
  XNOR2X1 U772 ( .A(n1349), .B(n1202), .Y(n874) );
  XNOR2X1 U773 ( .A(n1000), .B(n1349), .Y(n875) );
  XOR2X1 U802 ( .A(n1367), .B(b[14]), .Y(n893) );
  XOR2X1 U808 ( .A(b[10]), .B(n1362), .Y(n895) );
  NAND2X1 U816 ( .A(n16), .B(n898), .Y(n18) );
  NAND2X1 U819 ( .A(n899), .B(n9), .Y(n12) );
  XOR2X1 U820 ( .A(n1351), .B(b[2]), .Y(n899) );
  XNOR2X1 U821 ( .A(n1348), .B(b[2]), .Y(n9) );
  NAND2X1 U822 ( .A(n917), .B(n900), .Y(n6) );
  XOR2X1 U823 ( .A(n1295), .B(n1348), .Y(n900) );
  INVX8 U828 ( .A(n1215), .Y(n1216) );
  INVX4 U829 ( .A(n40), .Y(n1338) );
  BUFX4 U830 ( .A(n400), .Y(n1086) );
  INVX8 U831 ( .A(n1342), .Y(n1343) );
  INVX2 U832 ( .A(n513), .Y(n995) );
  INVX4 U833 ( .A(n995), .Y(n996) );
  BUFX2 U834 ( .A(n1332), .Y(n997) );
  BUFX4 U835 ( .A(n1332), .Y(n998) );
  INVX1 U836 ( .A(n1159), .Y(n1332) );
  INVX8 U837 ( .A(n1319), .Y(n1320) );
  INVX4 U838 ( .A(n882), .Y(n1386) );
  BUFX4 U839 ( .A(n489), .Y(n1087) );
  INVX8 U840 ( .A(n1390), .Y(n1391) );
  INVX8 U841 ( .A(n880), .Y(n1390) );
  BUFX2 U842 ( .A(n1399), .Y(n999) );
  BUFX4 U843 ( .A(n1399), .Y(n1000) );
  INVX1 U844 ( .A(n1400), .Y(n1399) );
  INVX8 U845 ( .A(n1090), .Y(n1330) );
  BUFX2 U846 ( .A(n1337), .Y(n1001) );
  BUFX4 U847 ( .A(n1337), .Y(n1002) );
  INVX1 U848 ( .A(n1251), .Y(n1337) );
  INVX4 U849 ( .A(n1321), .Y(n1322) );
  INVX4 U850 ( .A(n1271), .Y(n1344) );
  INVX8 U851 ( .A(n1388), .Y(n1389) );
  INVX4 U852 ( .A(n881), .Y(n1388) );
  INVX8 U853 ( .A(n1380), .Y(n1381) );
  INVX4 U854 ( .A(n885), .Y(n1380) );
  INVX2 U855 ( .A(n1352), .Y(n1353) );
  INVX2 U856 ( .A(n25), .Y(n1358) );
  INVX2 U857 ( .A(n1146), .Y(n1147) );
  BUFX2 U858 ( .A(n1351), .Y(n1257) );
  BUFX2 U859 ( .A(n1369), .Y(n1085) );
  INVX2 U860 ( .A(n1268), .Y(n1116) );
  INVX2 U861 ( .A(n1372), .Y(n1042) );
  INVX2 U862 ( .A(n1361), .Y(n1362) );
  INVX2 U863 ( .A(n1360), .Y(n1260) );
  INVX2 U864 ( .A(n12), .Y(n1323) );
  INVX4 U865 ( .A(n1260), .Y(n1268) );
  INVX4 U866 ( .A(n1160), .Y(n1161) );
  INVX4 U867 ( .A(n1392), .Y(n1393) );
  INVX2 U868 ( .A(n1355), .Y(n1356) );
  INVX2 U869 ( .A(n1117), .Y(n385) );
  INVX2 U870 ( .A(n1353), .Y(n1033) );
  INVX4 U871 ( .A(n1260), .Y(n1261) );
  INVX2 U872 ( .A(n888), .Y(n1375) );
  INVX2 U873 ( .A(n18), .Y(n1327) );
  INVX4 U874 ( .A(n1400), .Y(n1398) );
  INVX2 U875 ( .A(n354), .Y(n1111) );
  BUFX2 U876 ( .A(n52), .Y(n1259) );
  INVX1 U877 ( .A(n1189), .Y(n922) );
  BUFX2 U878 ( .A(n431), .Y(n1003) );
  INVX2 U879 ( .A(n283), .Y(n1004) );
  XOR2X1 U880 ( .A(n345), .B(n336), .Y(n1005) );
  XOR2X1 U881 ( .A(n334), .B(n1005), .Y(n332) );
  NAND2X1 U882 ( .A(n334), .B(n345), .Y(n1006) );
  NAND2X1 U883 ( .A(n334), .B(n336), .Y(n1007) );
  NAND2X1 U884 ( .A(n345), .B(n336), .Y(n1008) );
  NAND3X1 U885 ( .A(n1007), .B(n1006), .C(n1008), .Y(n331) );
  XOR2X1 U886 ( .A(n605), .B(n637), .Y(n1009) );
  XOR2X1 U887 ( .A(n589), .B(n1009), .Y(n326) );
  NAND2X1 U888 ( .A(n589), .B(n605), .Y(n1010) );
  NAND2X1 U889 ( .A(n589), .B(n637), .Y(n1011) );
  NAND2X1 U890 ( .A(n605), .B(n637), .Y(n1012) );
  NAND3X1 U891 ( .A(n1011), .B(n1010), .C(n1012), .Y(n325) );
  XOR2X1 U892 ( .A(n640), .B(n608), .Y(n1013) );
  XOR2X1 U893 ( .A(n624), .B(n1013), .Y(n356) );
  NAND2X1 U894 ( .A(n624), .B(n640), .Y(n1014) );
  NAND2X1 U895 ( .A(n624), .B(n608), .Y(n1015) );
  NAND2X1 U896 ( .A(n640), .B(n608), .Y(n1016) );
  NAND3X1 U897 ( .A(n1015), .B(n1014), .C(n1016), .Y(n355) );
  XOR2X1 U898 ( .A(n657), .B(n593), .Y(n1017) );
  XOR2X1 U899 ( .A(n673), .B(n1017), .Y(n370) );
  NAND2X1 U900 ( .A(n673), .B(n657), .Y(n1018) );
  NAND2X1 U901 ( .A(n673), .B(n593), .Y(n1019) );
  NAND2X1 U902 ( .A(n657), .B(n593), .Y(n1020) );
  NAND3X1 U903 ( .A(n1019), .B(n1018), .C(n1020), .Y(n369) );
  XOR2X1 U904 ( .A(n379), .B(n368), .Y(n1021) );
  XOR2X1 U905 ( .A(n377), .B(n1021), .Y(n364) );
  NAND2X1 U906 ( .A(n377), .B(n379), .Y(n1022) );
  NAND2X1 U907 ( .A(n377), .B(n368), .Y(n1023) );
  NAND2X1 U908 ( .A(n379), .B(n368), .Y(n1024) );
  NAND3X1 U909 ( .A(n1023), .B(n1022), .C(n1024), .Y(n363) );
  XOR2X1 U910 ( .A(n660), .B(n692), .Y(n1025) );
  XOR2X1 U911 ( .A(n676), .B(n1025), .Y(n412) );
  NAND2X1 U912 ( .A(n676), .B(n660), .Y(n1026) );
  NAND2X1 U913 ( .A(n676), .B(n692), .Y(n1027) );
  NAND2X1 U914 ( .A(n660), .B(n692), .Y(n1028) );
  NAND3X1 U915 ( .A(n1027), .B(n1026), .C(n1028), .Y(n411) );
  XOR2X1 U916 ( .A(n445), .B(n434), .Y(n1029) );
  XOR2X1 U917 ( .A(n432), .B(n1029), .Y(n430) );
  NAND2X1 U918 ( .A(n432), .B(n445), .Y(n1030) );
  NAND2X1 U919 ( .A(n432), .B(n434), .Y(n1031) );
  NAND2X1 U920 ( .A(n445), .B(n434), .Y(n1032) );
  NAND3X1 U921 ( .A(n1031), .B(n1030), .C(n1032), .Y(n429) );
  NAND2X1 U922 ( .A(n1353), .B(n1387), .Y(n1035) );
  NAND2X1 U923 ( .A(n1033), .B(n1034), .Y(n1036) );
  NAND2X1 U924 ( .A(n1035), .B(n1036), .Y(n831) );
  INVX4 U925 ( .A(n1387), .Y(n1034) );
  INVX8 U926 ( .A(n1386), .Y(n1387) );
  XOR2X1 U927 ( .A(n335), .B(n328), .Y(n1037) );
  XOR2X1 U928 ( .A(n326), .B(n1037), .Y(n324) );
  NAND2X1 U929 ( .A(n326), .B(n335), .Y(n1038) );
  NAND2X1 U930 ( .A(n326), .B(n328), .Y(n1039) );
  NAND2X1 U931 ( .A(n335), .B(n328), .Y(n1040) );
  NAND3X1 U932 ( .A(n1039), .B(n1038), .C(n1040), .Y(n323) );
  NAND2X1 U933 ( .A(n1275), .B(n1372), .Y(n1043) );
  NAND2X1 U934 ( .A(n1041), .B(n1042), .Y(n1044) );
  NAND2X1 U935 ( .A(n1043), .B(n1044), .Y(n771) );
  INVX2 U936 ( .A(n1275), .Y(n1041) );
  INVX8 U937 ( .A(n1371), .Y(n1372) );
  XOR2X1 U938 ( .A(n629), .B(n613), .Y(n1045) );
  XOR2X1 U939 ( .A(n597), .B(n1045), .Y(n424) );
  NAND2X1 U940 ( .A(n597), .B(n629), .Y(n1046) );
  NAND2X1 U941 ( .A(n597), .B(n613), .Y(n1047) );
  NAND2X1 U942 ( .A(n629), .B(n613), .Y(n1048) );
  NAND3X1 U943 ( .A(n1047), .B(n1046), .C(n1048), .Y(n423) );
  XOR2X1 U944 ( .A(n1318), .B(n393), .Y(n1049) );
  XOR2X1 U945 ( .A(n391), .B(n1049), .Y(n376) );
  NAND2X1 U946 ( .A(n391), .B(n1318), .Y(n1050) );
  NAND2X1 U947 ( .A(n391), .B(n393), .Y(n1051) );
  NAND2X1 U948 ( .A(n1318), .B(n393), .Y(n1052) );
  NAND3X1 U949 ( .A(n1051), .B(n1050), .C(n1052), .Y(n375) );
  INVX2 U950 ( .A(n1317), .Y(n1318) );
  XOR2X1 U951 ( .A(n651), .B(n635), .Y(n1053) );
  XOR2X1 U952 ( .A(n1053), .B(n699), .Y(n498) );
  XOR2X1 U953 ( .A(n507), .B(n505), .Y(n1054) );
  XOR2X1 U954 ( .A(n1054), .B(n498), .Y(n494) );
  NAND2X1 U955 ( .A(n651), .B(n635), .Y(n1055) );
  NAND2X1 U956 ( .A(n651), .B(n699), .Y(n1056) );
  NAND2X1 U957 ( .A(n635), .B(n699), .Y(n1057) );
  NAND3X1 U958 ( .A(n1055), .B(n1056), .C(n1057), .Y(n497) );
  NAND2X1 U959 ( .A(n507), .B(n505), .Y(n1058) );
  NAND2X1 U960 ( .A(n507), .B(n498), .Y(n1059) );
  NAND2X1 U961 ( .A(n505), .B(n498), .Y(n1060) );
  NAND3X1 U962 ( .A(n1058), .B(n1059), .C(n1060), .Y(n493) );
  INVX4 U963 ( .A(n889), .Y(n1373) );
  XOR2X1 U964 ( .A(n647), .B(n679), .Y(n1061) );
  XOR2X1 U965 ( .A(n599), .B(n1061), .Y(n454) );
  NAND2X1 U966 ( .A(n599), .B(n647), .Y(n1062) );
  NAND2X1 U967 ( .A(n599), .B(n679), .Y(n1063) );
  NAND2X1 U968 ( .A(n647), .B(n679), .Y(n1064) );
  NAND3X1 U969 ( .A(n1063), .B(n1062), .C(n1064), .Y(n453) );
  XOR2X1 U970 ( .A(n643), .B(n579), .Y(n1065) );
  XOR2X1 U971 ( .A(n659), .B(n1065), .Y(n400) );
  NAND2X1 U972 ( .A(n659), .B(n643), .Y(n1066) );
  NAND2X1 U973 ( .A(n659), .B(n579), .Y(n1067) );
  NAND2X1 U974 ( .A(n643), .B(n579), .Y(n1068) );
  NAND3X1 U975 ( .A(n1067), .B(n1066), .C(n1068), .Y(n399) );
  XOR2X1 U976 ( .A(n1089), .B(n1161), .Y(n1069) );
  XOR2X1 U977 ( .A(n645), .B(n1069), .Y(n428) );
  NAND2X1 U978 ( .A(n645), .B(n1089), .Y(n1070) );
  NAND2X1 U979 ( .A(n645), .B(n1161), .Y(n1071) );
  NAND2X1 U980 ( .A(n1089), .B(n1161), .Y(n1072) );
  NAND3X1 U981 ( .A(n1071), .B(n1070), .C(n1072), .Y(n427) );
  XOR2X1 U982 ( .A(n459), .B(n448), .Y(n1073) );
  XOR2X1 U983 ( .A(n446), .B(n1073), .Y(n444) );
  NAND2X1 U984 ( .A(n446), .B(n459), .Y(n1074) );
  NAND2X1 U985 ( .A(n446), .B(n448), .Y(n1075) );
  NAND2X1 U986 ( .A(n459), .B(n448), .Y(n1076) );
  NAND3X1 U987 ( .A(n1075), .B(n1074), .C(n1076), .Y(n443) );
  XOR2X1 U988 ( .A(n464), .B(n468), .Y(n1077) );
  XOR2X1 U989 ( .A(n473), .B(n1077), .Y(n460) );
  NAND2X1 U990 ( .A(n473), .B(n464), .Y(n1078) );
  NAND2X1 U991 ( .A(n473), .B(n468), .Y(n1079) );
  NAND2X1 U992 ( .A(n464), .B(n468), .Y(n1080) );
  NAND3X1 U993 ( .A(n1079), .B(n1078), .C(n1080), .Y(n459) );
  XOR2X1 U994 ( .A(n668), .B(n684), .Y(n1081) );
  XOR2X1 U995 ( .A(n652), .B(n1081), .Y(n506) );
  NAND2X1 U996 ( .A(n652), .B(n668), .Y(n1082) );
  NAND2X1 U997 ( .A(n652), .B(n684), .Y(n1083) );
  NAND2X1 U998 ( .A(n668), .B(n684), .Y(n1084) );
  NAND3X1 U999 ( .A(n1083), .B(n1082), .C(n1084), .Y(n505) );
  INVX8 U1000 ( .A(n1382), .Y(n1383) );
  INVX8 U1001 ( .A(n884), .Y(n1382) );
  INVX2 U1002 ( .A(n49), .Y(n1400) );
  INVX1 U1003 ( .A(n891), .Y(n1369) );
  INVX2 U1004 ( .A(n1), .Y(n1347) );
  BUFX4 U1005 ( .A(n503), .Y(n1088) );
  INVX2 U1006 ( .A(n1093), .Y(n1146) );
  AND2X2 U1007 ( .A(n1370), .B(n1368), .Y(n1089) );
  INVX2 U1008 ( .A(n887), .Y(n1377) );
  AND2X2 U1009 ( .A(n897), .B(n1093), .Y(n1090) );
  INVX2 U1010 ( .A(n7), .Y(n1350) );
  INVX2 U1011 ( .A(n1146), .Y(n1329) );
  OR2X2 U1012 ( .A(n308), .B(n313), .Y(n1091) );
  AND2X2 U1013 ( .A(n149), .B(n281), .Y(n1092) );
  INVX2 U1014 ( .A(n1167), .Y(n1326) );
  XNOR2X1 U1015 ( .A(n13), .B(b[6]), .Y(n1093) );
  INVX2 U1016 ( .A(n1109), .Y(n1110) );
  INVX2 U1017 ( .A(n890), .Y(n1371) );
  INVX4 U1018 ( .A(n1335), .Y(n1269) );
  INVX2 U1019 ( .A(n34), .Y(n1335) );
  INVX4 U1020 ( .A(n1373), .Y(n1374) );
  INVX2 U1021 ( .A(n879), .Y(n1392) );
  INVX4 U1022 ( .A(n1394), .Y(n1395) );
  INVX2 U1023 ( .A(n878), .Y(n1394) );
  OR2X2 U1024 ( .A(n292), .B(n293), .Y(n1094) );
  INVX4 U1025 ( .A(n1396), .Y(n1397) );
  INVX2 U1026 ( .A(n1323), .Y(n1266) );
  INVX2 U1027 ( .A(n1090), .Y(n1331) );
  XOR2X1 U1028 ( .A(n395), .B(n384), .Y(n1095) );
  XOR2X1 U1029 ( .A(n382), .B(n1095), .Y(n378) );
  NAND2X1 U1030 ( .A(n382), .B(n395), .Y(n1096) );
  NAND2X1 U1031 ( .A(n382), .B(n384), .Y(n1097) );
  NAND2X1 U1032 ( .A(n395), .B(n384), .Y(n1098) );
  NAND3X1 U1033 ( .A(n1097), .B(n1096), .C(n1098), .Y(n377) );
  INVX1 U1034 ( .A(n1352), .Y(n1099) );
  NOR2X1 U1035 ( .A(n189), .B(n194), .Y(n1100) );
  XOR2X1 U1036 ( .A(n1149), .B(n390), .Y(n1101) );
  NAND2X1 U1037 ( .A(n1102), .B(n1103), .Y(n641) );
  OR2X2 U1038 ( .A(n1333), .B(n794), .Y(n1102) );
  OR2X1 U1039 ( .A(n795), .B(n1226), .Y(n1103) );
  BUFX2 U1040 ( .A(n421), .Y(n1180) );
  NAND2X1 U1041 ( .A(n917), .B(n900), .Y(n1104) );
  INVX8 U1042 ( .A(n1323), .Y(n1324) );
  XNOR2X1 U1043 ( .A(n1364), .B(b[12]), .Y(n894) );
  INVX4 U1044 ( .A(n1364), .Y(n1275) );
  INVX4 U1045 ( .A(b[4]), .Y(n1113) );
  XOR2X1 U1046 ( .A(n1362), .B(n1382), .Y(n782) );
  XOR2X1 U1047 ( .A(n327), .B(n604), .Y(n1105) );
  XOR2X1 U1048 ( .A(n325), .B(n1105), .Y(n316) );
  NAND2X1 U1049 ( .A(n325), .B(n327), .Y(n1106) );
  NAND2X1 U1050 ( .A(n325), .B(n604), .Y(n1107) );
  NAND2X1 U1051 ( .A(n327), .B(n604), .Y(n1108) );
  NAND3X1 U1052 ( .A(n1107), .B(n1106), .C(n1108), .Y(n315) );
  BUFX2 U1053 ( .A(n1249), .Y(n1267) );
  INVX2 U1054 ( .A(n1189), .Y(n1168) );
  INVX2 U1055 ( .A(n1391), .Y(n1109) );
  XOR2X1 U1056 ( .A(n352), .B(n1111), .Y(n1112) );
  XNOR2X1 U1057 ( .A(n1112), .B(n363), .Y(n350) );
  AND2X1 U1058 ( .A(n46), .B(n893), .Y(n1271) );
  XOR2X1 U1059 ( .A(n1362), .B(n1384), .Y(n781) );
  XOR2X1 U1060 ( .A(n1352), .B(n1113), .Y(n898) );
  XOR2X1 U1061 ( .A(n1268), .B(n1388), .Y(n796) );
  BUFX2 U1062 ( .A(n1341), .Y(n1114) );
  AND2X2 U1063 ( .A(n894), .B(n1340), .Y(n1115) );
  INVX4 U1064 ( .A(n1270), .Y(n1341) );
  XOR2X1 U1065 ( .A(n1116), .B(n1391), .Y(n795) );
  NAND2X1 U1066 ( .A(n1376), .B(n1248), .Y(n1117) );
  XNOR2X1 U1067 ( .A(n1118), .B(n450), .Y(n446) );
  XNOR2X1 U1068 ( .A(n463), .B(n461), .Y(n1118) );
  INVX2 U1069 ( .A(n1373), .Y(n1119) );
  XNOR2X1 U1070 ( .A(n145), .B(n1120), .Y(product[40]) );
  AND2X2 U1071 ( .A(n144), .B(n1232), .Y(n1120) );
  AND2X2 U1072 ( .A(n1398), .B(n546), .Y(n618) );
  INVX1 U1073 ( .A(n100), .Y(n98) );
  INVX1 U1074 ( .A(n211), .Y(n209) );
  NAND2X1 U1075 ( .A(n363), .B(n352), .Y(n1121) );
  NAND2X1 U1076 ( .A(n363), .B(n354), .Y(n1122) );
  NAND2X1 U1077 ( .A(n352), .B(n354), .Y(n1123) );
  NAND3X1 U1078 ( .A(n1122), .B(n1121), .C(n1123), .Y(n349) );
  NAND2X1 U1079 ( .A(n642), .B(n1239), .Y(n1126) );
  NAND2X1 U1080 ( .A(n1124), .B(n1125), .Y(n1127) );
  NAND2X1 U1081 ( .A(n1126), .B(n1127), .Y(n384) );
  INVX2 U1082 ( .A(n642), .Y(n1124) );
  INVX2 U1083 ( .A(n1239), .Y(n1125) );
  INVX4 U1084 ( .A(n13), .Y(n1352) );
  XOR2X1 U1085 ( .A(n1357), .B(n1390), .Y(n812) );
  XOR2X1 U1086 ( .A(n431), .B(n420), .Y(n1128) );
  XOR2X1 U1087 ( .A(n418), .B(n1128), .Y(n416) );
  NAND2X1 U1088 ( .A(n418), .B(n1003), .Y(n1129) );
  NAND2X1 U1089 ( .A(n418), .B(n420), .Y(n1130) );
  NAND2X1 U1090 ( .A(n1003), .B(n420), .Y(n1131) );
  NAND3X1 U1091 ( .A(n1130), .B(n1129), .C(n1131), .Y(n415) );
  XOR2X1 U1092 ( .A(n483), .B(n474), .Y(n1132) );
  XOR2X1 U1093 ( .A(n1132), .B(n472), .Y(n470) );
  NAND2X1 U1094 ( .A(n472), .B(n483), .Y(n1133) );
  NAND2X1 U1095 ( .A(n472), .B(n474), .Y(n1134) );
  NAND2X1 U1096 ( .A(n483), .B(n474), .Y(n1135) );
  NAND3X1 U1097 ( .A(n1134), .B(n1133), .C(n1135), .Y(n469) );
  INVX4 U1098 ( .A(n1352), .Y(n1354) );
  INVX1 U1099 ( .A(n128), .Y(n126) );
  XNOR2X1 U1100 ( .A(n154), .B(n1092), .Y(product[39]) );
  OR2X2 U1101 ( .A(n1000), .B(n925), .Y(n876) );
  OR2X2 U1102 ( .A(n1000), .B(n921), .Y(n808) );
  OR2X2 U1103 ( .A(n1000), .B(n1176), .Y(n859) );
  OR2X2 U1104 ( .A(n999), .B(n922), .Y(n825) );
  OR2X2 U1105 ( .A(n999), .B(n920), .Y(n791) );
  OR2X2 U1106 ( .A(n1398), .B(n919), .Y(n774) );
  OR2X2 U1107 ( .A(n1398), .B(n1230), .Y(n757) );
  INVX2 U1108 ( .A(n31), .Y(n1158) );
  BUFX4 U1109 ( .A(n52), .Y(n1136) );
  XNOR2X1 U1110 ( .A(n73), .B(n1137), .Y(product[46]) );
  AND2X2 U1111 ( .A(n72), .B(n1094), .Y(n1137) );
  INVX2 U1112 ( .A(n1136), .Y(n156) );
  INVX8 U1113 ( .A(n1162), .Y(n1363) );
  XOR2X1 U1114 ( .A(n1261), .B(n1382), .Y(n799) );
  INVX4 U1115 ( .A(n1085), .Y(n1202) );
  BUFX2 U1116 ( .A(n214), .Y(n1138) );
  XOR2X1 U1117 ( .A(n631), .B(n456), .Y(n1139) );
  XOR2X1 U1118 ( .A(n1139), .B(n467), .Y(n450) );
  NAND2X1 U1119 ( .A(n631), .B(n456), .Y(n1140) );
  NAND2X1 U1120 ( .A(n631), .B(n467), .Y(n1141) );
  NAND2X1 U1121 ( .A(n456), .B(n467), .Y(n1142) );
  NAND3X1 U1122 ( .A(n1140), .B(n1141), .C(n1142), .Y(n449) );
  NAND2X1 U1123 ( .A(n463), .B(n461), .Y(n1143) );
  NAND2X1 U1124 ( .A(n463), .B(n450), .Y(n1144) );
  NAND2X1 U1125 ( .A(n461), .B(n450), .Y(n1145) );
  NAND3X1 U1126 ( .A(n1143), .B(n1144), .C(n1145), .Y(n445) );
  XOR2X1 U1127 ( .A(n407), .B(n394), .Y(n1148) );
  XOR2X1 U1128 ( .A(n1148), .B(n405), .Y(n390) );
  XOR2X1 U1129 ( .A(n392), .B(n403), .Y(n1149) );
  NAND2X1 U1130 ( .A(n407), .B(n394), .Y(n1150) );
  NAND2X1 U1131 ( .A(n407), .B(n405), .Y(n1151) );
  NAND2X1 U1132 ( .A(n394), .B(n405), .Y(n1152) );
  NAND3X1 U1133 ( .A(n1150), .B(n1151), .C(n1152), .Y(n389) );
  NAND2X1 U1134 ( .A(n392), .B(n403), .Y(n1153) );
  NAND2X1 U1135 ( .A(n392), .B(n390), .Y(n1154) );
  NAND2X1 U1136 ( .A(n403), .B(n390), .Y(n1155) );
  NAND3X1 U1137 ( .A(n1153), .B(n1154), .C(n1155), .Y(n387) );
  INVX1 U1138 ( .A(n174), .Y(n1156) );
  NOR2X1 U1139 ( .A(n373), .B(n362), .Y(n1157) );
  INVX1 U1140 ( .A(n200), .Y(n202) );
  INVX2 U1141 ( .A(n31), .Y(n1361) );
  INVX1 U1142 ( .A(n1339), .Y(n546) );
  XNOR2X1 U1143 ( .A(n1355), .B(b[8]), .Y(n1159) );
  INVX4 U1144 ( .A(n563), .Y(n1160) );
  XOR2X1 U1145 ( .A(n1261), .B(n1384), .Y(n798) );
  XOR2X1 U1146 ( .A(n1268), .B(n1386), .Y(n797) );
  XNOR2X1 U1147 ( .A(n1355), .B(b[8]), .Y(n1253) );
  BUFX2 U1148 ( .A(n1158), .Y(n1162) );
  XOR2X1 U1149 ( .A(n385), .B(n674), .Y(n1239) );
  INVX1 U1150 ( .A(n1325), .Y(n1163) );
  INVX1 U1151 ( .A(n1325), .Y(n1164) );
  INVX2 U1152 ( .A(n16), .Y(n1325) );
  INVX1 U1153 ( .A(n173), .Y(n1165) );
  BUFX4 U1154 ( .A(n1366), .Y(n1230) );
  INVX1 U1155 ( .A(n1345), .Y(n1166) );
  BUFX2 U1156 ( .A(n1325), .Y(n1167) );
  XOR2X1 U1157 ( .A(n1168), .B(n1389), .Y(n813) );
  XOR2X1 U1158 ( .A(n1158), .B(b[12]), .Y(n40) );
  INVX1 U1159 ( .A(n201), .Y(n1169) );
  XOR2X1 U1160 ( .A(n646), .B(n582), .Y(n1170) );
  XOR2X1 U1161 ( .A(n1170), .B(n710), .Y(n442) );
  NAND2X1 U1162 ( .A(n710), .B(n646), .Y(n1171) );
  NAND2X1 U1163 ( .A(n710), .B(n582), .Y(n1172) );
  NAND2X1 U1164 ( .A(n646), .B(n582), .Y(n1173) );
  NAND3X1 U1165 ( .A(n1172), .B(n1171), .C(n1173), .Y(n441) );
  AND2X2 U1166 ( .A(n1398), .B(n1368), .Y(n582) );
  BUFX2 U1167 ( .A(n197), .Y(n1174) );
  NAND3X1 U1168 ( .A(n1205), .B(n1204), .C(n1206), .Y(n1175) );
  INVX4 U1169 ( .A(n1351), .Y(n1176) );
  INVX8 U1170 ( .A(n1176), .Y(n1177) );
  INVX2 U1171 ( .A(n1350), .Y(n1351) );
  OAI21X1 U1172 ( .A(n223), .B(n233), .C(n224), .Y(n1178) );
  NOR2X1 U1173 ( .A(n401), .B(n1101), .Y(n1179) );
  XOR2X1 U1174 ( .A(n435), .B(n422), .Y(n1181) );
  XOR2X1 U1175 ( .A(n1181), .B(n433), .Y(n418) );
  NAND2X1 U1176 ( .A(n435), .B(n422), .Y(n1182) );
  NAND2X1 U1177 ( .A(n435), .B(n433), .Y(n1183) );
  NAND2X1 U1178 ( .A(n422), .B(n433), .Y(n1184) );
  NAND3X1 U1179 ( .A(n1182), .B(n1183), .C(n1184), .Y(n417) );
  XOR2X1 U1180 ( .A(n404), .B(n406), .Y(n1185) );
  XOR2X1 U1181 ( .A(n1185), .B(n417), .Y(n402) );
  NAND2X1 U1182 ( .A(n406), .B(n404), .Y(n1186) );
  NAND2X1 U1183 ( .A(n406), .B(n417), .Y(n1187) );
  NAND2X1 U1184 ( .A(n404), .B(n417), .Y(n1188) );
  NAND3X1 U1185 ( .A(n1186), .B(n1187), .C(n1188), .Y(n401) );
  INVX2 U1186 ( .A(n1355), .Y(n1189) );
  INVX4 U1187 ( .A(n19), .Y(n1355) );
  NOR2X1 U1188 ( .A(n457), .B(n444), .Y(n1190) );
  XOR2X1 U1189 ( .A(n665), .B(n697), .Y(n1191) );
  XOR2X1 U1190 ( .A(n1191), .B(n617), .Y(n478) );
  NAND2X1 U1191 ( .A(n665), .B(n697), .Y(n1192) );
  NAND2X1 U1192 ( .A(n665), .B(n617), .Y(n1193) );
  NAND2X1 U1193 ( .A(n697), .B(n617), .Y(n1194) );
  NAND3X1 U1194 ( .A(n1192), .B(n1193), .C(n1194), .Y(n477) );
  XOR2X1 U1195 ( .A(n475), .B(n466), .Y(n1195) );
  XOR2X1 U1196 ( .A(n1195), .B(n477), .Y(n462) );
  NAND2X1 U1197 ( .A(n475), .B(n466), .Y(n1196) );
  NAND2X1 U1198 ( .A(n475), .B(n477), .Y(n1197) );
  NAND2X1 U1199 ( .A(n466), .B(n477), .Y(n1198) );
  NAND3X1 U1200 ( .A(n1196), .B(n1197), .C(n1198), .Y(n461) );
  NOR2X1 U1201 ( .A(n1340), .B(n772), .Y(n1199) );
  NOR2X1 U1202 ( .A(n773), .B(n1341), .Y(n1200) );
  OR2X2 U1203 ( .A(n1199), .B(n1200), .Y(n617) );
  NAND2X1 U1204 ( .A(n1232), .B(n281), .Y(n1201) );
  XOR2X1 U1205 ( .A(n439), .B(n424), .Y(n1203) );
  XOR2X1 U1206 ( .A(n426), .B(n1203), .Y(n420) );
  NAND2X1 U1207 ( .A(n426), .B(n439), .Y(n1204) );
  NAND2X1 U1208 ( .A(n426), .B(n424), .Y(n1205) );
  NAND2X1 U1209 ( .A(n439), .B(n424), .Y(n1206) );
  NAND3X1 U1210 ( .A(n1204), .B(n1205), .C(n1206), .Y(n419) );
  XOR2X1 U1211 ( .A(n616), .B(n648), .Y(n1207) );
  XOR2X1 U1212 ( .A(n1207), .B(n680), .Y(n466) );
  NAND2X1 U1213 ( .A(n648), .B(n616), .Y(n1208) );
  NAND2X1 U1214 ( .A(n648), .B(n680), .Y(n1209) );
  NAND2X1 U1215 ( .A(n616), .B(n680), .Y(n1210) );
  NAND3X1 U1216 ( .A(n1208), .B(n1209), .C(n1210), .Y(n465) );
  XOR2X1 U1217 ( .A(n452), .B(n454), .Y(n1211) );
  XOR2X1 U1218 ( .A(n1211), .B(n465), .Y(n448) );
  NAND2X1 U1219 ( .A(n452), .B(n454), .Y(n1212) );
  NAND2X1 U1220 ( .A(n452), .B(n465), .Y(n1213) );
  NAND2X1 U1221 ( .A(n454), .B(n465), .Y(n1214) );
  NAND3X1 U1222 ( .A(n1212), .B(n1213), .C(n1214), .Y(n447) );
  INVX2 U1223 ( .A(n1367), .Y(n1215) );
  INVX1 U1224 ( .A(n1366), .Y(n1367) );
  XOR2X1 U1225 ( .A(n419), .B(n421), .Y(n1217) );
  XOR2X1 U1226 ( .A(n408), .B(n1217), .Y(n404) );
  NAND2X1 U1227 ( .A(n408), .B(n1175), .Y(n1218) );
  NAND2X1 U1228 ( .A(n408), .B(n1180), .Y(n1219) );
  NAND2X1 U1229 ( .A(n1175), .B(n1180), .Y(n1220) );
  NAND3X1 U1230 ( .A(n1219), .B(n1218), .C(n1220), .Y(n403) );
  INVX1 U1231 ( .A(n1355), .Y(n1225) );
  XOR2X1 U1232 ( .A(n447), .B(n449), .Y(n1221) );
  XOR2X1 U1233 ( .A(n436), .B(n1221), .Y(n432) );
  NAND2X1 U1234 ( .A(n436), .B(n449), .Y(n1222) );
  NAND2X1 U1235 ( .A(n436), .B(n447), .Y(n1223) );
  NAND2X1 U1236 ( .A(n449), .B(n447), .Y(n1224) );
  NAND3X1 U1237 ( .A(n1223), .B(n1222), .C(n1224), .Y(n431) );
  AND2X2 U1238 ( .A(n724), .B(n708), .Y(n1229) );
  AND2X2 U1239 ( .A(n1379), .B(n1248), .Y(n359) );
  INVX1 U1240 ( .A(n1230), .Y(n1248) );
  INVX2 U1241 ( .A(n1355), .Y(n1357) );
  OR2X2 U1242 ( .A(n1274), .B(n1253), .Y(n1226) );
  INVX2 U1243 ( .A(n287), .Y(n1227) );
  OR2X2 U1244 ( .A(n1201), .B(n80), .Y(n1231) );
  OR2X2 U1245 ( .A(n322), .B(n329), .Y(n1232) );
  OR2X2 U1246 ( .A(n481), .B(n470), .Y(n1233) );
  INVX1 U1247 ( .A(n84), .Y(n275) );
  INVX1 U1248 ( .A(n94), .Y(n92) );
  OR2X2 U1249 ( .A(n302), .B(n307), .Y(n1241) );
  OR2X1 U1250 ( .A(n724), .B(n708), .Y(n1228) );
  INVX4 U1251 ( .A(n1254), .Y(n1334) );
  INVX2 U1252 ( .A(n541), .Y(n1366) );
  OR2X1 U1253 ( .A(n523), .B(n518), .Y(n1234) );
  AND2X2 U1254 ( .A(n491), .B(n482), .Y(n1235) );
  OR2X1 U1255 ( .A(n491), .B(n482), .Y(n1236) );
  AND2X2 U1256 ( .A(n481), .B(n470), .Y(n1237) );
  AND2X2 U1257 ( .A(n523), .B(n518), .Y(n1238) );
  XNOR2X1 U1258 ( .A(n1240), .B(n342), .Y(n340) );
  XNOR2X1 U1259 ( .A(n344), .B(n351), .Y(n1240) );
  OR2X1 U1260 ( .A(n539), .B(n538), .Y(n1242) );
  AND2X2 U1261 ( .A(n539), .B(n538), .Y(n1243) );
  INVX2 U1262 ( .A(n554), .Y(n655) );
  INVX2 U1263 ( .A(n551), .Y(n637) );
  INVX2 U1264 ( .A(n548), .Y(n619) );
  XNOR2X1 U1265 ( .A(n1244), .B(n409), .Y(n394) );
  XNOR2X1 U1266 ( .A(n413), .B(n411), .Y(n1244) );
  INVX2 U1267 ( .A(n545), .Y(n601) );
  AND2X2 U1268 ( .A(n572), .B(n725), .Y(n1245) );
  BUFX2 U1269 ( .A(n1351), .Y(n1258) );
  INVX2 U1270 ( .A(n1115), .Y(n1265) );
  OR2X1 U1271 ( .A(n533), .B(n530), .Y(n1246) );
  AND2X2 U1272 ( .A(n533), .B(n530), .Y(n1247) );
  XNOR2X1 U1273 ( .A(n542), .B(n573), .Y(n291) );
  INVX2 U1274 ( .A(n1354), .Y(n923) );
  INVX2 U1275 ( .A(n1251), .Y(n1336) );
  INVX2 U1276 ( .A(n1366), .Y(n1368) );
  INVX2 U1277 ( .A(n46), .Y(n1342) );
  NAND2X1 U1278 ( .A(n46), .B(n893), .Y(n1249) );
  INVX4 U1279 ( .A(n1347), .Y(n1348) );
  NAND2X1 U1280 ( .A(n894), .B(n1340), .Y(n1250) );
  XOR2X1 U1281 ( .A(n1364), .B(b[14]), .Y(n46) );
  INVX4 U1282 ( .A(n1085), .Y(n1370) );
  AND2X2 U1283 ( .A(n34), .B(n895), .Y(n1251) );
  INVX4 U1284 ( .A(n886), .Y(n1378) );
  INVX4 U1285 ( .A(n883), .Y(n1384) );
  INVX2 U1286 ( .A(n877), .Y(n1396) );
  XNOR2X1 U1287 ( .A(n1252), .B(n1356), .Y(n897) );
  INVX1 U1288 ( .A(b[6]), .Y(n1252) );
  NOR2X1 U1289 ( .A(n1274), .B(n1159), .Y(n1254) );
  INVX1 U1290 ( .A(n210), .Y(n289) );
  BUFX2 U1291 ( .A(n53), .Y(n1255) );
  BUFX4 U1292 ( .A(n53), .Y(n1256) );
  INVX1 U1293 ( .A(n215), .Y(n1262) );
  INVX1 U1294 ( .A(n1262), .Y(n1263) );
  INVX1 U1295 ( .A(n9), .Y(n1321) );
  AOI21X1 U1296 ( .A(n1178), .B(n1138), .C(n1263), .Y(n1264) );
  INVX1 U1297 ( .A(n183), .Y(n181) );
  INVX1 U1298 ( .A(n182), .Y(n285) );
  INVX2 U1299 ( .A(n1358), .Y(n1359) );
  INVX1 U1300 ( .A(n1179), .Y(n286) );
  AND2X2 U1301 ( .A(n894), .B(n1340), .Y(n1270) );
  INVX1 U1302 ( .A(n216), .Y(n290) );
  NOR2X1 U1303 ( .A(n429), .B(n416), .Y(n1272) );
  BUFX2 U1304 ( .A(n9), .Y(n1273) );
  XNOR2X1 U1305 ( .A(b[8]), .B(n1359), .Y(n1274) );
  INVX2 U1306 ( .A(n1253), .Y(n1333) );
  INVX2 U1307 ( .A(n560), .Y(n691) );
  INVX2 U1308 ( .A(n1104), .Y(n1319) );
  XOR2X1 U1309 ( .A(n612), .B(n628), .Y(n1276) );
  XOR2X1 U1310 ( .A(n1276), .B(n596), .Y(n410) );
  NAND2X1 U1311 ( .A(n628), .B(n612), .Y(n1277) );
  NAND2X1 U1312 ( .A(n628), .B(n596), .Y(n1278) );
  NAND2X1 U1313 ( .A(n612), .B(n596), .Y(n1279) );
  NAND3X1 U1314 ( .A(n1277), .B(n1278), .C(n1279), .Y(n409) );
  NAND2X1 U1315 ( .A(n413), .B(n411), .Y(n1280) );
  NAND2X1 U1316 ( .A(n413), .B(n409), .Y(n1281) );
  NAND2X1 U1317 ( .A(n411), .B(n409), .Y(n1282) );
  NAND3X1 U1318 ( .A(n1280), .B(n1281), .C(n1282), .Y(n393) );
  NOR2X1 U1319 ( .A(n1343), .B(n752), .Y(n1283) );
  NOR2X1 U1320 ( .A(n753), .B(n1344), .Y(n1284) );
  OR2X2 U1321 ( .A(n1283), .B(n1284), .Y(n596) );
  INVX4 U1322 ( .A(n51), .Y(n1345) );
  INVX2 U1323 ( .A(n1338), .Y(n1339) );
  XOR2X1 U1324 ( .A(b[4]), .B(n1350), .Y(n16) );
  XOR2X1 U1325 ( .A(n1358), .B(b[10]), .Y(n34) );
  XOR2X1 U1326 ( .A(n385), .B(n578), .Y(n1285) );
  XOR2X1 U1327 ( .A(n1285), .B(n641), .Y(n372) );
  XOR2X1 U1328 ( .A(n625), .B(n609), .Y(n1286) );
  XOR2X1 U1329 ( .A(n1286), .B(n372), .Y(n368) );
  NAND2X1 U1330 ( .A(n385), .B(n578), .Y(n1287) );
  NAND2X1 U1331 ( .A(n385), .B(n641), .Y(n1288) );
  NAND2X1 U1332 ( .A(n578), .B(n641), .Y(n1289) );
  NAND3X1 U1333 ( .A(n1287), .B(n1288), .C(n1289), .Y(n371) );
  NAND2X1 U1334 ( .A(n625), .B(n609), .Y(n1290) );
  NAND2X1 U1335 ( .A(n625), .B(n372), .Y(n1291) );
  NAND2X1 U1336 ( .A(n609), .B(n372), .Y(n1292) );
  NAND3X1 U1337 ( .A(n1290), .B(n1291), .C(n1292), .Y(n367) );
  XNOR2X1 U1338 ( .A(n1293), .B(n365), .Y(n352) );
  XNOR2X1 U1339 ( .A(n367), .B(n356), .Y(n1293) );
  INVX4 U1340 ( .A(n1347), .Y(n1349) );
  INVX2 U1341 ( .A(b[0]), .Y(n1294) );
  INVX4 U1342 ( .A(n1294), .Y(n1295) );
  XOR2X1 U1343 ( .A(n355), .B(n346), .Y(n1296) );
  XOR2X1 U1344 ( .A(n1296), .B(n353), .Y(n342) );
  NAND2X1 U1345 ( .A(n355), .B(n346), .Y(n1297) );
  NAND2X1 U1346 ( .A(n355), .B(n353), .Y(n1298) );
  NAND2X1 U1347 ( .A(n346), .B(n353), .Y(n1299) );
  NAND3X1 U1348 ( .A(n1297), .B(n1298), .C(n1299), .Y(n341) );
  NAND2X1 U1349 ( .A(n344), .B(n351), .Y(n1300) );
  NAND2X1 U1350 ( .A(n344), .B(n342), .Y(n1301) );
  NAND2X1 U1351 ( .A(n351), .B(n342), .Y(n1302) );
  NAND3X1 U1352 ( .A(n1300), .B(n1301), .C(n1302), .Y(n339) );
  XOR2X1 U1353 ( .A(n358), .B(n371), .Y(n1303) );
  XOR2X1 U1354 ( .A(n369), .B(n1303), .Y(n354) );
  NAND2X1 U1355 ( .A(n369), .B(n358), .Y(n1304) );
  NAND2X1 U1356 ( .A(n369), .B(n371), .Y(n1305) );
  NAND2X1 U1357 ( .A(n358), .B(n371), .Y(n1306) );
  NAND3X1 U1358 ( .A(n1305), .B(n1304), .C(n1306), .Y(n353) );
  INVX1 U1359 ( .A(n205), .Y(n288) );
  INVX1 U1360 ( .A(n199), .Y(n201) );
  XOR2X1 U1361 ( .A(n383), .B(n381), .Y(n1307) );
  XOR2X1 U1362 ( .A(n1307), .B(n370), .Y(n366) );
  NAND2X1 U1363 ( .A(n383), .B(n381), .Y(n1308) );
  NAND2X1 U1364 ( .A(n383), .B(n370), .Y(n1309) );
  NAND2X1 U1365 ( .A(n381), .B(n370), .Y(n1310) );
  NAND3X1 U1366 ( .A(n1308), .B(n1309), .C(n1310), .Y(n365) );
  NAND2X1 U1367 ( .A(n356), .B(n367), .Y(n1311) );
  NAND2X1 U1368 ( .A(n356), .B(n365), .Y(n1312) );
  NAND2X1 U1369 ( .A(n367), .B(n365), .Y(n1313) );
  NAND3X1 U1370 ( .A(n1311), .B(n1312), .C(n1313), .Y(n351) );
  NAND2X1 U1371 ( .A(n642), .B(n674), .Y(n1314) );
  NAND2X1 U1372 ( .A(n642), .B(n1117), .Y(n1315) );
  NAND2X1 U1373 ( .A(n674), .B(n1117), .Y(n1316) );
  NAND3X1 U1374 ( .A(n1315), .B(n1314), .C(n1316), .Y(n383) );
  INVX2 U1375 ( .A(n380), .Y(n1317) );
  INVX2 U1376 ( .A(n557), .Y(n673) );
  INVX1 U1377 ( .A(n172), .Y(n174) );
  INVX1 U1378 ( .A(n194), .Y(n287) );
  INVX1 U1379 ( .A(n1157), .Y(n284) );
  INVX2 U1380 ( .A(n1358), .Y(n1360) );
  INVX1 U1381 ( .A(n166), .Y(n283) );
  INVX1 U1382 ( .A(n161), .Y(n282) );
  INVX2 U1383 ( .A(n1364), .Y(n1365) );
  INVX4 U1384 ( .A(n37), .Y(n1364) );
  INVX1 U1385 ( .A(n171), .Y(n173) );
  INVX1 U1386 ( .A(n1256), .Y(n155) );
  INVX8 U1387 ( .A(n1295), .Y(n917) );
  INVX8 U1388 ( .A(n1327), .Y(n1328) );
  INVX8 U1389 ( .A(n1338), .Y(n1340) );
  INVX8 U1390 ( .A(n1345), .Y(n1346) );
  INVX8 U1391 ( .A(n1375), .Y(n1376) );
  INVX8 U1392 ( .A(n1378), .Y(n1379) );
  INVX8 U1393 ( .A(n1384), .Y(n1385) );
  INVX2 U1394 ( .A(n101), .Y(n99) );
  INVX2 U1395 ( .A(n79), .Y(n77) );
  OAI22X1 U1396 ( .A(n917), .B(n925), .C(n6), .D(n925), .Y(n563) );
  INVX2 U1397 ( .A(n1348), .Y(n925) );
  OAI22X1 U1398 ( .A(n1322), .B(n1176), .C(n1176), .D(n1266), .Y(n560) );
  OAI22X1 U1399 ( .A(n1326), .B(n923), .C(n1328), .D(n923), .Y(n557) );
  OAI22X1 U1400 ( .A(n1329), .B(n922), .C(n1330), .D(n922), .Y(n554) );
  OAI22X1 U1401 ( .A(n998), .B(n921), .C(n1334), .D(n921), .Y(n551) );
  INVX2 U1402 ( .A(n1261), .Y(n921) );
  OAI22X1 U1403 ( .A(n1269), .B(n920), .C(n1002), .D(n920), .Y(n548) );
  INVX2 U1404 ( .A(n1363), .Y(n920) );
  OAI22X1 U1405 ( .A(n1339), .B(n919), .C(n1114), .D(n919), .Y(n545) );
  INVX2 U1406 ( .A(n1275), .Y(n919) );
  OAI22X1 U1407 ( .A(n1343), .B(n1230), .C(n1344), .D(n1230), .Y(n542) );
  INVX2 U1408 ( .A(n359), .Y(n360) );
  INVX2 U1409 ( .A(n337), .Y(n338) );
  INVX2 U1410 ( .A(n319), .Y(n320) );
  INVX2 U1411 ( .A(n305), .Y(n306) );
  INVX2 U1412 ( .A(n295), .Y(n296) );
  INVX2 U1413 ( .A(n130), .Y(n279) );
  INVX2 U1414 ( .A(n93), .Y(n91) );
  INVX2 U1415 ( .A(n1178), .Y(n221) );
  INVX2 U1416 ( .A(n1264), .Y(n212) );
  INVX2 U1417 ( .A(n149), .Y(n151) );
  INVX2 U1418 ( .A(n148), .Y(n281) );
  INVX2 U1419 ( .A(n144), .Y(n142) );
  INVX2 U1420 ( .A(n129), .Y(n127) );
  INVX2 U1421 ( .A(n122), .Y(n120) );
  INVX2 U1422 ( .A(n111), .Y(n109) );
  INVX2 U1423 ( .A(n105), .Y(n103) );
  INVX2 U1424 ( .A(n104), .Y(n102) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16], n36, n12, n17, n1, 
        n5, n10, src1_data[9:8], n9, n4, src1_data[5], n16, n11, n3, n32, n42}), .B({src2_data[16], src2_data[16], n39, src2_data[14], n19, n2, n14, n7, n15, 
        n8, n41, src2_data[6], n21, n38, n22, src2_data[2], n23, src2_data[0]}), .CI(1'b0), .DIFF(large_dif) );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16], n36, n12, n17, n1, 
        n5, n10, src1_data[9:5], n16, src1_data[3:2], n32, src1_data[0]}), .B(
        {src2_data[16], src2_data[16], n39, src2_data[14], n19, n2, n14, n7, 
        n15, n8, n41, n40, n21, n38, n22, src2_data[2], n23, n34}), .CI(1'b0), 
        .SUM(large_sum) );
  alu_DW_mult_uns_2 mult_35 ( .a({src1_data[15:13], n1, src1_data[11:2], n32, 
        n42, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0}), .b({src2_data[15:5], n38, src2_data[3:0]}), 
        .product({N26, full_mult[45:30], SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14, 
        SYNOPSYS_UNCONNECTED__15, SYNOPSYS_UNCONNECTED__16, 
        SYNOPSYS_UNCONNECTED__17, SYNOPSYS_UNCONNECTED__18, 
        SYNOPSYS_UNCONNECTED__19, SYNOPSYS_UNCONNECTED__20, 
        SYNOPSYS_UNCONNECTED__21, SYNOPSYS_UNCONNECTED__22, 
        SYNOPSYS_UNCONNECTED__23, SYNOPSYS_UNCONNECTED__24, 
        SYNOPSYS_UNCONNECTED__25, SYNOPSYS_UNCONNECTED__26, 
        SYNOPSYS_UNCONNECTED__27, SYNOPSYS_UNCONNECTED__28, 
        SYNOPSYS_UNCONNECTED__29}) );
  INVX4 U3 ( .A(n43), .Y(n42) );
  INVX4 U4 ( .A(n37), .Y(n38) );
  INVX2 U6 ( .A(src2_data[4]), .Y(n37) );
  INVX2 U7 ( .A(n35), .Y(n36) );
  BUFX4 U9 ( .A(src1_data[12]), .Y(n1) );
  BUFX2 U10 ( .A(src2_data[12]), .Y(n2) );
  BUFX2 U11 ( .A(src1_data[2]), .Y(n3) );
  BUFX2 U12 ( .A(src1_data[6]), .Y(n4) );
  BUFX2 U13 ( .A(src1_data[11]), .Y(n5) );
  INVX1 U14 ( .A(src2_data[10]), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n7) );
  BUFX2 U16 ( .A(src2_data[8]), .Y(n8) );
  BUFX2 U17 ( .A(src1_data[7]), .Y(n9) );
  BUFX2 U18 ( .A(src1_data[10]), .Y(n10) );
  BUFX2 U19 ( .A(src1_data[3]), .Y(n11) );
  BUFX2 U20 ( .A(src1_data[14]), .Y(n12) );
  INVX1 U21 ( .A(src2_data[11]), .Y(n13) );
  INVX2 U22 ( .A(n13), .Y(n14) );
  BUFX2 U23 ( .A(src2_data[9]), .Y(n15) );
  BUFX2 U24 ( .A(src1_data[4]), .Y(n16) );
  BUFX2 U25 ( .A(src1_data[13]), .Y(n17) );
  INVX1 U26 ( .A(src2_data[13]), .Y(n18) );
  INVX2 U27 ( .A(n18), .Y(n19) );
  INVX1 U28 ( .A(src2_data[5]), .Y(n20) );
  INVX2 U29 ( .A(n20), .Y(n21) );
  BUFX2 U30 ( .A(src2_data[3]), .Y(n22) );
  BUFX2 U31 ( .A(src2_data[1]), .Y(n23) );
  AND2X1 U32 ( .A(src1_data[9]), .B(n26), .Y(n24) );
  AND2X1 U33 ( .A(n30), .B(full_mult[39]), .Y(n25) );
  NOR2X1 U34 ( .A(n24), .B(n25), .Y(n68) );
  INVX2 U35 ( .A(n84), .Y(n79) );
  AND2X2 U36 ( .A(n48), .B(n47), .Y(n26) );
  AND2X2 U37 ( .A(alu_op[1]), .B(n47), .Y(n29) );
  AND2X2 U38 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n30) );
  INVX2 U39 ( .A(src1_data[1]), .Y(n31) );
  INVX4 U40 ( .A(n31), .Y(n32) );
  INVX1 U41 ( .A(src2_data[0]), .Y(n33) );
  INVX1 U42 ( .A(n33), .Y(n34) );
  INVX1 U43 ( .A(src1_data[15]), .Y(n35) );
  INVX2 U44 ( .A(src1_data[0]), .Y(n43) );
  BUFX2 U45 ( .A(src2_data[15]), .Y(n39) );
  BUFX2 U46 ( .A(src2_data[6]), .Y(n40) );
  BUFX2 U47 ( .A(src2_data[7]), .Y(n41) );
  INVX2 U48 ( .A(large_sum[16]), .Y(n83) );
  XOR2X1 U49 ( .A(n83), .B(large_sum[17]), .Y(n46) );
  INVX2 U50 ( .A(alu_op[1]), .Y(n48) );
  NAND2X1 U51 ( .A(alu_op[0]), .B(n48), .Y(n84) );
  INVX2 U52 ( .A(alu_op[0]), .Y(n47) );
  XOR2X1 U53 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n44) );
  AOI22X1 U54 ( .A(N26), .B(n30), .C(n29), .D(n44), .Y(n45) );
  OAI21X1 U55 ( .A(n46), .B(n84), .C(n45), .Y(overflow) );
  AOI22X1 U56 ( .A(n42), .B(n26), .C(full_mult[30]), .D(n30), .Y(n50) );
  AOI22X1 U57 ( .A(large_dif[0]), .B(n29), .C(large_sum[0]), .D(n79), .Y(n49)
         );
  NAND2X1 U58 ( .A(n50), .B(n49), .Y(result[0]) );
  AOI22X1 U59 ( .A(n32), .B(n26), .C(full_mult[31]), .D(n30), .Y(n52) );
  AOI22X1 U60 ( .A(large_dif[1]), .B(n29), .C(large_sum[1]), .D(n79), .Y(n51)
         );
  NAND2X1 U61 ( .A(n52), .B(n51), .Y(result[1]) );
  AOI22X1 U62 ( .A(n3), .B(n26), .C(full_mult[32]), .D(n30), .Y(n54) );
  AOI22X1 U63 ( .A(large_dif[2]), .B(n29), .C(large_sum[2]), .D(n79), .Y(n53)
         );
  NAND2X1 U64 ( .A(n54), .B(n53), .Y(result[2]) );
  AOI22X1 U65 ( .A(n11), .B(n26), .C(full_mult[33]), .D(n30), .Y(n56) );
  AOI22X1 U66 ( .A(large_dif[3]), .B(n29), .C(large_sum[3]), .D(n79), .Y(n55)
         );
  NAND2X1 U67 ( .A(n56), .B(n55), .Y(result[3]) );
  AOI22X1 U68 ( .A(n16), .B(n26), .C(full_mult[34]), .D(n30), .Y(n58) );
  AOI22X1 U69 ( .A(large_dif[4]), .B(n29), .C(large_sum[4]), .D(n79), .Y(n57)
         );
  NAND2X1 U70 ( .A(n58), .B(n57), .Y(result[4]) );
  AOI22X1 U71 ( .A(src1_data[5]), .B(n26), .C(full_mult[35]), .D(n30), .Y(n60)
         );
  AOI22X1 U72 ( .A(large_dif[5]), .B(n29), .C(large_sum[5]), .D(n79), .Y(n59)
         );
  NAND2X1 U73 ( .A(n60), .B(n59), .Y(result[5]) );
  AOI22X1 U74 ( .A(n4), .B(n26), .C(full_mult[36]), .D(n30), .Y(n62) );
  AOI22X1 U75 ( .A(large_dif[6]), .B(n29), .C(large_sum[6]), .D(n79), .Y(n61)
         );
  NAND2X1 U76 ( .A(n62), .B(n61), .Y(result[6]) );
  AOI22X1 U77 ( .A(n9), .B(n26), .C(full_mult[37]), .D(n30), .Y(n64) );
  AOI22X1 U78 ( .A(large_dif[7]), .B(n29), .C(large_sum[7]), .D(n79), .Y(n63)
         );
  NAND2X1 U79 ( .A(n64), .B(n63), .Y(result[7]) );
  AOI22X1 U80 ( .A(src1_data[8]), .B(n26), .C(full_mult[38]), .D(n30), .Y(n66)
         );
  AOI22X1 U81 ( .A(large_dif[8]), .B(n29), .C(large_sum[8]), .D(n79), .Y(n65)
         );
  NAND2X1 U82 ( .A(n66), .B(n65), .Y(result[8]) );
  AOI22X1 U83 ( .A(large_dif[9]), .B(n29), .C(large_sum[9]), .D(n79), .Y(n67)
         );
  NAND2X1 U84 ( .A(n68), .B(n67), .Y(result[9]) );
  AOI22X1 U85 ( .A(n10), .B(n26), .C(full_mult[40]), .D(n30), .Y(n70) );
  AOI22X1 U86 ( .A(large_dif[10]), .B(n29), .C(large_sum[10]), .D(n79), .Y(n69) );
  NAND2X1 U87 ( .A(n70), .B(n69), .Y(result[10]) );
  AOI22X1 U88 ( .A(n5), .B(n26), .C(full_mult[41]), .D(n30), .Y(n72) );
  AOI22X1 U89 ( .A(large_dif[11]), .B(n29), .C(large_sum[11]), .D(n79), .Y(n71) );
  NAND2X1 U90 ( .A(n71), .B(n72), .Y(result[11]) );
  AOI22X1 U91 ( .A(n1), .B(n26), .C(full_mult[42]), .D(n30), .Y(n74) );
  AOI22X1 U92 ( .A(large_dif[12]), .B(n29), .C(large_sum[12]), .D(n79), .Y(n73) );
  NAND2X1 U93 ( .A(n74), .B(n73), .Y(result[12]) );
  AOI22X1 U94 ( .A(n17), .B(n26), .C(full_mult[43]), .D(n30), .Y(n76) );
  AOI22X1 U95 ( .A(large_dif[13]), .B(n29), .C(large_sum[13]), .D(n79), .Y(n75) );
  NAND2X1 U96 ( .A(n76), .B(n75), .Y(result[13]) );
  AOI22X1 U97 ( .A(n12), .B(n26), .C(full_mult[44]), .D(n30), .Y(n78) );
  AOI22X1 U98 ( .A(large_dif[14]), .B(n29), .C(large_sum[14]), .D(n79), .Y(n77) );
  NAND2X1 U99 ( .A(n78), .B(n77), .Y(result[14]) );
  AOI22X1 U100 ( .A(n36), .B(n26), .C(full_mult[45]), .D(n30), .Y(n81) );
  AOI22X1 U101 ( .A(large_dif[15]), .B(n29), .C(large_sum[15]), .D(n79), .Y(
        n80) );
  NAND2X1 U102 ( .A(n81), .B(n80), .Y(result[15]) );
  AOI22X1 U103 ( .A(src1_data[16]), .B(n26), .C(large_dif[16]), .D(n29), .Y(
        n82) );
  OAI21X1 U104 ( .A(n84), .B(n83), .C(n82), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n34) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n14), .Y(n40) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  INVX1 U10 ( .A(n18), .Y(n32) );
  INVX1 U11 ( .A(n22), .Y(n28) );
  MUX2X1 U12 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U13 ( .A(n5), .Y(n55) );
  MUX2X1 U14 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U15 ( .A(n6), .Y(n54) );
  MUX2X1 U16 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U17 ( .A(n7), .Y(n53) );
  MUX2X1 U18 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U19 ( .A(n8), .Y(n52) );
  MUX2X1 U20 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U21 ( .A(n9), .Y(n50) );
  MUX2X1 U22 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U23 ( .A(n10), .Y(n48) );
  MUX2X1 U24 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U25 ( .A(n11), .Y(n46) );
  MUX2X1 U26 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U27 ( .A(n12), .Y(n44) );
  MUX2X1 U28 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U29 ( .A(n13), .Y(n42) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n22), .Y(n28) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U33 ( .A(n17), .Y(n34) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n22), .Y(n28) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n16), .Y(n36) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n14), .Y(n40) );
  INVX2 U7 ( .A(n1), .Y(n2) );
  INVX2 U8 ( .A(write_enable), .Y(n1) );
  INVX2 U9 ( .A(n4), .Y(n3) );
  INVX2 U10 ( .A(n_reset), .Y(n4) );
  MUX2X1 U11 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U12 ( .A(n5), .Y(n55) );
  MUX2X1 U13 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U14 ( .A(n6), .Y(n54) );
  MUX2X1 U15 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U16 ( .A(n7), .Y(n53) );
  MUX2X1 U17 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U18 ( .A(n8), .Y(n52) );
  MUX2X1 U19 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U20 ( .A(n9), .Y(n50) );
  MUX2X1 U21 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U22 ( .A(n10), .Y(n48) );
  MUX2X1 U23 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U24 ( .A(n11), .Y(n46) );
  MUX2X1 U25 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U26 ( .A(n12), .Y(n44) );
  MUX2X1 U27 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U28 ( .A(n13), .Y(n42) );
  MUX2X1 U29 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U30 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U31 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U32 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U33 ( .A(n17), .Y(n34) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U36 ( .A(n20), .Y(n30) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U10 ( .A(n5), .Y(n55) );
  MUX2X1 U11 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U12 ( .A(n6), .Y(n54) );
  MUX2X1 U13 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U14 ( .A(n7), .Y(n53) );
  MUX2X1 U15 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U16 ( .A(n8), .Y(n52) );
  MUX2X1 U17 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U18 ( .A(n9), .Y(n50) );
  MUX2X1 U19 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U20 ( .A(n10), .Y(n48) );
  MUX2X1 U21 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U22 ( .A(n11), .Y(n46) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U24 ( .A(n12), .Y(n44) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U10 ( .A(n5), .Y(n55) );
  MUX2X1 U11 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U12 ( .A(n6), .Y(n54) );
  MUX2X1 U13 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U14 ( .A(n7), .Y(n53) );
  MUX2X1 U15 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U16 ( .A(n8), .Y(n52) );
  MUX2X1 U17 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U18 ( .A(n9), .Y(n50) );
  MUX2X1 U19 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U20 ( .A(n10), .Y(n48) );
  MUX2X1 U21 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U22 ( .A(n11), .Y(n46) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U24 ( .A(n12), .Y(n44) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U10 ( .A(n5), .Y(n55) );
  MUX2X1 U11 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U12 ( .A(n6), .Y(n54) );
  MUX2X1 U13 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U14 ( .A(n7), .Y(n53) );
  MUX2X1 U15 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U16 ( .A(n8), .Y(n52) );
  MUX2X1 U17 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U18 ( .A(n9), .Y(n50) );
  MUX2X1 U19 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U20 ( .A(n10), .Y(n48) );
  MUX2X1 U21 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U22 ( .A(n11), .Y(n46) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U24 ( .A(n12), .Y(n44) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n14), .Y(n40) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  MUX2X1 U10 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U11 ( .A(n5), .Y(n55) );
  MUX2X1 U12 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U13 ( .A(n6), .Y(n54) );
  MUX2X1 U14 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U15 ( .A(n7), .Y(n53) );
  MUX2X1 U16 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U17 ( .A(n8), .Y(n52) );
  MUX2X1 U18 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U19 ( .A(n9), .Y(n50) );
  MUX2X1 U20 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U21 ( .A(n10), .Y(n48) );
  MUX2X1 U22 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U23 ( .A(n11), .Y(n46) );
  MUX2X1 U24 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U25 ( .A(n12), .Y(n44) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n34) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n14), .Y(n40) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  MUX2X1 U10 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U11 ( .A(n5), .Y(n55) );
  MUX2X1 U12 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U13 ( .A(n6), .Y(n54) );
  MUX2X1 U14 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U15 ( .A(n7), .Y(n53) );
  MUX2X1 U16 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U17 ( .A(n8), .Y(n52) );
  MUX2X1 U18 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U19 ( .A(n9), .Y(n50) );
  MUX2X1 U20 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U21 ( .A(n10), .Y(n48) );
  MUX2X1 U22 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U23 ( .A(n11), .Y(n46) );
  MUX2X1 U24 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U25 ( .A(n12), .Y(n44) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n34) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U10 ( .A(n5), .Y(n55) );
  MUX2X1 U11 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U12 ( .A(n6), .Y(n54) );
  MUX2X1 U13 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U14 ( .A(n7), .Y(n53) );
  MUX2X1 U15 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U16 ( .A(n8), .Y(n52) );
  MUX2X1 U17 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U18 ( .A(n9), .Y(n50) );
  MUX2X1 U19 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U20 ( .A(n10), .Y(n48) );
  MUX2X1 U21 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U22 ( .A(n11), .Y(n46) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U24 ( .A(n12), .Y(n44) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n32) );
  INVX1 U3 ( .A(n16), .Y(n36) );
  INVX1 U4 ( .A(n15), .Y(n38) );
  INVX1 U5 ( .A(n14), .Y(n40) );
  INVX2 U6 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(write_enable), .Y(n1) );
  INVX2 U8 ( .A(n4), .Y(n3) );
  INVX2 U9 ( .A(n_reset), .Y(n4) );
  MUX2X1 U10 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U11 ( .A(n5), .Y(n55) );
  MUX2X1 U12 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U13 ( .A(n6), .Y(n54) );
  MUX2X1 U14 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U15 ( .A(n7), .Y(n53) );
  MUX2X1 U16 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U17 ( .A(n8), .Y(n52) );
  MUX2X1 U18 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U19 ( .A(n9), .Y(n50) );
  MUX2X1 U20 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U21 ( .A(n10), .Y(n48) );
  MUX2X1 U22 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U23 ( .A(n11), .Y(n46) );
  MUX2X1 U24 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U25 ( .A(n12), .Y(n44) );
  MUX2X1 U26 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U27 ( .A(n13), .Y(n42) );
  MUX2X1 U28 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U29 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U30 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n34) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U10 ( .A(n5), .Y(n55) );
  MUX2X1 U11 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U12 ( .A(n6), .Y(n54) );
  MUX2X1 U13 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U14 ( .A(n7), .Y(n53) );
  MUX2X1 U15 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U16 ( .A(n8), .Y(n52) );
  MUX2X1 U17 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U18 ( .A(n9), .Y(n50) );
  MUX2X1 U19 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U20 ( .A(n10), .Y(n48) );
  MUX2X1 U21 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U22 ( .A(n11), .Y(n46) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U24 ( .A(n12), .Y(n44) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U10 ( .A(n5), .Y(n55) );
  MUX2X1 U11 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U12 ( .A(n6), .Y(n54) );
  MUX2X1 U13 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U14 ( .A(n7), .Y(n53) );
  MUX2X1 U15 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U16 ( .A(n8), .Y(n52) );
  MUX2X1 U17 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U18 ( .A(n9), .Y(n50) );
  MUX2X1 U19 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U20 ( .A(n10), .Y(n48) );
  MUX2X1 U21 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U22 ( .A(n11), .Y(n46) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U24 ( .A(n12), .Y(n44) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U10 ( .A(n5), .Y(n55) );
  MUX2X1 U11 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U12 ( .A(n6), .Y(n54) );
  MUX2X1 U13 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U14 ( .A(n7), .Y(n53) );
  MUX2X1 U15 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U16 ( .A(n8), .Y(n52) );
  MUX2X1 U17 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U18 ( .A(n9), .Y(n50) );
  MUX2X1 U19 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U20 ( .A(n10), .Y(n48) );
  MUX2X1 U21 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U22 ( .A(n11), .Y(n46) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U24 ( .A(n12), .Y(n44) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U10 ( .A(n5), .Y(n55) );
  MUX2X1 U11 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U12 ( .A(n6), .Y(n54) );
  MUX2X1 U13 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U14 ( .A(n7), .Y(n53) );
  MUX2X1 U15 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U16 ( .A(n8), .Y(n52) );
  MUX2X1 U17 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U18 ( .A(n9), .Y(n50) );
  MUX2X1 U19 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U20 ( .A(n10), .Y(n48) );
  MUX2X1 U21 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U22 ( .A(n11), .Y(n46) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U24 ( .A(n12), .Y(n44) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U10 ( .A(n5), .Y(n55) );
  MUX2X1 U11 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U12 ( .A(n6), .Y(n54) );
  MUX2X1 U13 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U14 ( .A(n7), .Y(n53) );
  MUX2X1 U15 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U16 ( .A(n8), .Y(n52) );
  MUX2X1 U17 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U18 ( .A(n9), .Y(n50) );
  MUX2X1 U19 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U20 ( .A(n10), .Y(n48) );
  MUX2X1 U21 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U22 ( .A(n11), .Y(n46) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U24 ( .A(n12), .Y(n44) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n16), .Y(n36) );
  INVX1 U3 ( .A(n15), .Y(n38) );
  INVX1 U4 ( .A(n14), .Y(n40) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(write_enable), .Y(n1) );
  INVX2 U7 ( .A(n4), .Y(n3) );
  INVX2 U8 ( .A(n_reset), .Y(n4) );
  MUX2X1 U9 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U10 ( .A(n5), .Y(n55) );
  MUX2X1 U11 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U12 ( .A(n6), .Y(n54) );
  MUX2X1 U13 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U14 ( .A(n7), .Y(n53) );
  MUX2X1 U15 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U16 ( .A(n8), .Y(n52) );
  MUX2X1 U17 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U18 ( .A(n9), .Y(n50) );
  MUX2X1 U19 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U20 ( .A(n10), .Y(n48) );
  MUX2X1 U21 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U22 ( .A(n11), .Y(n46) );
  MUX2X1 U23 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U24 ( .A(n12), .Y(n44) );
  MUX2X1 U25 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U26 ( .A(n13), .Y(n42) );
  MUX2X1 U27 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n34) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n32) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n30) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  INVX2 U54 ( .A(n22), .Y(n28) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, n729, n730, n731,
         \regs_matrix[15][16] , \regs_matrix[15][15] , \regs_matrix[15][14] ,
         \regs_matrix[15][13] , \regs_matrix[15][12] , \regs_matrix[15][11] ,
         \regs_matrix[15][10] , \regs_matrix[15][9] , \regs_matrix[15][8] ,
         \regs_matrix[15][7] , \regs_matrix[15][6] , \regs_matrix[15][5] ,
         \regs_matrix[15][4] , \regs_matrix[15][3] , \regs_matrix[15][2] ,
         \regs_matrix[15][1] , \regs_matrix[15][0] , \regs_matrix[14][16] ,
         \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] ,
         \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] ,
         \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] ,
         \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] ,
         \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] ,
         \regs_matrix[14][0] , \regs_matrix[13][16] , \regs_matrix[13][15] ,
         \regs_matrix[13][14] , \regs_matrix[13][13] , \regs_matrix[13][12] ,
         \regs_matrix[13][11] , \regs_matrix[13][10] , \regs_matrix[13][9] ,
         \regs_matrix[13][8] , \regs_matrix[13][7] , \regs_matrix[13][6] ,
         \regs_matrix[13][5] , \regs_matrix[13][4] , \regs_matrix[13][3] ,
         \regs_matrix[13][2] , \regs_matrix[13][1] , \regs_matrix[13][0] ,
         \regs_matrix[12][16] , \regs_matrix[12][15] , \regs_matrix[12][14] ,
         \regs_matrix[12][13] , \regs_matrix[12][12] , \regs_matrix[12][11] ,
         \regs_matrix[12][10] , \regs_matrix[12][9] , \regs_matrix[12][8] ,
         \regs_matrix[12][7] , \regs_matrix[12][6] , \regs_matrix[12][5] ,
         \regs_matrix[12][4] , \regs_matrix[12][3] , \regs_matrix[12][2] ,
         \regs_matrix[12][1] , \regs_matrix[12][0] , \regs_matrix[11][16] ,
         \regs_matrix[11][15] , \regs_matrix[11][14] , \regs_matrix[11][13] ,
         \regs_matrix[11][12] , \regs_matrix[11][11] , \regs_matrix[11][10] ,
         \regs_matrix[11][9] , \regs_matrix[11][8] , \regs_matrix[11][7] ,
         \regs_matrix[11][6] , \regs_matrix[11][5] , \regs_matrix[11][4] ,
         \regs_matrix[11][3] , \regs_matrix[11][2] , \regs_matrix[11][1] ,
         \regs_matrix[11][0] , \regs_matrix[10][16] , \regs_matrix[10][15] ,
         \regs_matrix[10][14] , \regs_matrix[10][13] , \regs_matrix[10][12] ,
         \regs_matrix[10][11] , \regs_matrix[10][10] , \regs_matrix[10][9] ,
         \regs_matrix[10][8] , \regs_matrix[10][7] , \regs_matrix[10][6] ,
         \regs_matrix[10][5] , \regs_matrix[10][4] , \regs_matrix[10][3] ,
         \regs_matrix[10][2] , \regs_matrix[10][1] , \regs_matrix[10][0] ,
         \regs_matrix[9][16] , \regs_matrix[9][15] , \regs_matrix[9][14] ,
         \regs_matrix[9][13] , \regs_matrix[9][12] , \regs_matrix[9][11] ,
         \regs_matrix[9][10] , \regs_matrix[9][9] , \regs_matrix[9][8] ,
         \regs_matrix[9][7] , \regs_matrix[9][6] , \regs_matrix[9][5] ,
         \regs_matrix[9][4] , \regs_matrix[9][3] , \regs_matrix[9][2] ,
         \regs_matrix[9][1] , \regs_matrix[9][0] , \regs_matrix[8][16] ,
         \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] ,
         \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] ,
         \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] ,
         \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] ,
         \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] ,
         \regs_matrix[8][0] , \regs_matrix[7][16] , \regs_matrix[7][15] ,
         \regs_matrix[7][14] , \regs_matrix[7][13] , \regs_matrix[7][12] ,
         \regs_matrix[7][11] , \regs_matrix[7][10] , \regs_matrix[7][9] ,
         \regs_matrix[7][8] , \regs_matrix[7][7] , \regs_matrix[7][6] ,
         \regs_matrix[7][5] , \regs_matrix[7][4] , \regs_matrix[7][3] ,
         \regs_matrix[7][2] , \regs_matrix[7][1] , \regs_matrix[7][0] ,
         \regs_matrix[6][16] , \regs_matrix[6][15] , \regs_matrix[6][14] ,
         \regs_matrix[6][13] , \regs_matrix[6][12] , \regs_matrix[6][11] ,
         \regs_matrix[6][10] , \regs_matrix[6][9] , \regs_matrix[6][8] ,
         \regs_matrix[6][7] , \regs_matrix[6][6] , \regs_matrix[6][5] ,
         \regs_matrix[6][4] , \regs_matrix[6][3] , \regs_matrix[6][2] ,
         \regs_matrix[6][1] , \regs_matrix[6][0] , \regs_matrix[5][16] ,
         \regs_matrix[5][15] , \regs_matrix[5][14] , \regs_matrix[5][13] ,
         \regs_matrix[5][12] , \regs_matrix[5][11] , \regs_matrix[5][10] ,
         \regs_matrix[5][9] , \regs_matrix[5][8] , \regs_matrix[5][7] ,
         \regs_matrix[5][6] , \regs_matrix[5][5] , \regs_matrix[5][4] ,
         \regs_matrix[5][3] , \regs_matrix[5][2] , \regs_matrix[5][1] ,
         \regs_matrix[5][0] , \regs_matrix[4][16] , \regs_matrix[4][15] ,
         \regs_matrix[4][14] , \regs_matrix[4][13] , \regs_matrix[4][12] ,
         \regs_matrix[4][11] , \regs_matrix[4][10] , \regs_matrix[4][9] ,
         \regs_matrix[4][8] , \regs_matrix[4][7] , \regs_matrix[4][6] ,
         \regs_matrix[4][5] , \regs_matrix[4][4] , \regs_matrix[4][3] ,
         \regs_matrix[4][2] , \regs_matrix[4][1] , \regs_matrix[4][0] ,
         \regs_matrix[3][16] , \regs_matrix[3][15] , \regs_matrix[3][14] ,
         \regs_matrix[3][13] , \regs_matrix[3][12] , \regs_matrix[3][11] ,
         \regs_matrix[3][10] , \regs_matrix[3][9] , \regs_matrix[3][8] ,
         \regs_matrix[3][7] , \regs_matrix[3][6] , \regs_matrix[3][5] ,
         \regs_matrix[3][4] , \regs_matrix[3][3] , \regs_matrix[3][2] ,
         \regs_matrix[3][1] , \regs_matrix[3][0] , \regs_matrix[2][16] ,
         \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] ,
         \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] ,
         \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] ,
         \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] ,
         \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] ,
         \regs_matrix[2][0] , \regs_matrix[1][16] , \regs_matrix[1][15] ,
         \regs_matrix[1][14] , \regs_matrix[1][13] , \regs_matrix[1][12] ,
         \regs_matrix[1][11] , \regs_matrix[1][10] , \regs_matrix[1][9] ,
         \regs_matrix[1][8] , \regs_matrix[1][7] , \regs_matrix[1][6] ,
         \regs_matrix[1][5] , \regs_matrix[1][4] , \regs_matrix[1][3] ,
         \regs_matrix[1][2] , \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n1, n2, n3, n4, n14, n15, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323,
         n324, n325, n326, n327, n328, n329, n330, n331, n332, n333, n334,
         n335, n336, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n356,
         n357, n358, n359, n360, n361, n362, n363, n364, n365, n366, n367,
         n368, n369, n370, n371, n372, n373, n374, n375, n376, n377, n378,
         n379, n380, n381, n382, n383, n384, n385, n386, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n543,
         n544, n545, n546, n547, n548, n549, n550, n551, n552, n553, n554,
         n555, n556, n557, n558, n559, n560, n561, n562, n563, n564, n565,
         n566, n567, n568, n569, n570, n571, n572, n573, n574, n575, n576,
         n577, n578, n579, n580, n581, n582, n583, n584, n585, n586, n587,
         n588, n589, n590, n591, n592, n593, n594, n595, n596, n597, n598,
         n599, n600, n601, n602, n603, n604, n605, n606, n607, n608, n609,
         n610, n611, n612, n613, n614, n615, n616, n617, n618, n619, n620,
         n621, n622, n623, n624, n625, n626, n627, n628, n629, n630, n631,
         n632, n633, n634, n635, n636, n637, n638, n639, n640, n641, n642,
         n643, n644, n645, n646, n647, n648, n649, n650, n651, n652, n653,
         n654, n655, n656, n657, n658, n659, n660, n661, n662, n663, n664,
         n665, n666, n667, n668, n669, n670, n671, n672, n673, n674, n675,
         n676, n677, n678, n679, n680, n681, n682, n683, n684, n685, n686,
         n687, n688, n689, n690, n691, n692, n693, n694, n695, n696, n697,
         n698, n699, n700, n701, n702, n703, n704, n705, n706, n707, n708,
         n709, n710, n711, n712, n713, n714, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n728), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n725), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n727), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n728), .Y(n10) );
  NOR2X1 U29 ( .A(n726), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n725), .B(n727), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n724), 
        .write_enable(write_enables[0]), .new_value({w_data[16], n714, n711, 
        n708, n706, n703, n701, n699, n98, n695, n96, n691, n688, n685, n682, 
        n679, n676}), .current_value({n731, outreg_data[15:0]}) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n717), 
        .write_enable(write_enables[1]), .new_value({w_data[16], n713, n110, 
        n708, n108, n703, n701, n699, n97, n99, n95, n690, n687, n684, n681, 
        n678, n676}), .current_value({\regs_matrix[1][16] , 
        \regs_matrix[1][15] , \regs_matrix[1][14] , \regs_matrix[1][13] , 
        \regs_matrix[1][12] , \regs_matrix[1][11] , \regs_matrix[1][10] , 
        \regs_matrix[1][9] , \regs_matrix[1][8] , \regs_matrix[1][7] , 
        \regs_matrix[1][6] , \regs_matrix[1][5] , \regs_matrix[1][4] , 
        \regs_matrix[1][3] , \regs_matrix[1][2] , \regs_matrix[1][1] , 
        \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n717), 
        .write_enable(write_enables[2]), .new_value({w_data[16], n714, n711, 
        n708, n706, n703, n701, n699, n97, n695, n95, n691, n688, n685, n682, 
        n679, w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n718), 
        .write_enable(write_enables[3]), .new_value({w_data[16], n713, n710, 
        n708, n705, n703, n701, n699, n697, n100, n693, n690, n687, n684, n681, 
        n678, n676}), .current_value({\regs_matrix[3][16] , 
        \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] , 
        \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] , 
        \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] , 
        \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] , 
        \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] , 
        \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n718), 
        .write_enable(write_enables[4]), .new_value({w_data[16], n714, n711, 
        n708, n706, n703, n701, n699, w_data[8], n695, w_data[6], n691, n688, 
        n685, n682, n679, w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n719), 
        .write_enable(write_enables[5]), .new_value({w_data[16], n713, n111, 
        n708, n109, n703, n701, n699, n98, n100, n96, n690, n687, n684, n681, 
        n678, n676}), .current_value({\regs_matrix[5][16] , 
        \regs_matrix[5][15] , \regs_matrix[5][14] , \regs_matrix[5][13] , 
        \regs_matrix[5][12] , \regs_matrix[5][11] , \regs_matrix[5][10] , 
        \regs_matrix[5][9] , \regs_matrix[5][8] , \regs_matrix[5][7] , 
        \regs_matrix[5][6] , \regs_matrix[5][5] , \regs_matrix[5][4] , 
        \regs_matrix[5][3] , \regs_matrix[5][2] , \regs_matrix[5][1] , 
        \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n719), 
        .write_enable(write_enables[6]), .new_value({w_data[16], n714, n711, 
        n708, n706, n703, n701, n699, n697, n695, n693, n691, n688, n685, n682, 
        n679, w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n720), 
        .write_enable(write_enables[7]), .new_value({w_data[16], n713, n110, 
        n708, n108, n703, n701, n699, n97, n99, n95, n690, n687, n684, n681, 
        n678, n676}), .current_value({\regs_matrix[7][16] , 
        \regs_matrix[7][15] , \regs_matrix[7][14] , \regs_matrix[7][13] , 
        \regs_matrix[7][12] , \regs_matrix[7][11] , \regs_matrix[7][10] , 
        \regs_matrix[7][9] , \regs_matrix[7][8] , \regs_matrix[7][7] , 
        \regs_matrix[7][6] , \regs_matrix[7][5] , \regs_matrix[7][4] , 
        \regs_matrix[7][3] , \regs_matrix[7][2] , \regs_matrix[7][1] , 
        \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n720), 
        .write_enable(write_enables[8]), .new_value({w_data[16], n714, n111, 
        n708, n109, n703, n701, n699, n98, n100, n96, n691, n688, n685, n682, 
        n679, w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n721), 
        .write_enable(write_enables[9]), .new_value({w_data[16], n713, n710, 
        n708, n705, n703, n701, n699, n697, n100, n693, n690, n687, n684, n681, 
        n678, n676}), .current_value({\regs_matrix[9][16] , 
        \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] , 
        \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] , 
        \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] , 
        \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] , 
        \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] , 
        \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n721), 
        .write_enable(write_enables[10]), .new_value({w_data[16], n714, n110, 
        n708, n108, n703, n701, n699, n97, n99, n95, n691, n688, n685, n682, 
        n679, w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n722), 
        .write_enable(write_enables[11]), .new_value({w_data[16], n713, n111, 
        n708, n109, n703, n701, n699, n98, n100, n96, n690, n687, n684, n681, 
        n678, n676}), .current_value({\regs_matrix[11][16] , 
        \regs_matrix[11][15] , \regs_matrix[11][14] , \regs_matrix[11][13] , 
        \regs_matrix[11][12] , \regs_matrix[11][11] , \regs_matrix[11][10] , 
        \regs_matrix[11][9] , \regs_matrix[11][8] , \regs_matrix[11][7] , 
        \regs_matrix[11][6] , \regs_matrix[11][5] , \regs_matrix[11][4] , 
        \regs_matrix[11][3] , \regs_matrix[11][2] , \regs_matrix[11][1] , 
        \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n722), 
        .write_enable(write_enables[12]), .new_value({w_data[16], n714, n710, 
        n708, n705, n703, n701, n699, n697, n695, n693, n691, n688, n685, n682, 
        n679, w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n723), 
        .write_enable(write_enables[13]), .new_value({w_data[16], n713, n110, 
        n708, n108, n703, n701, n699, n97, n99, n95, n690, n687, n684, n681, 
        n678, n676}), .current_value({\regs_matrix[13][16] , 
        \regs_matrix[13][15] , \regs_matrix[13][14] , \regs_matrix[13][13] , 
        \regs_matrix[13][12] , \regs_matrix[13][11] , \regs_matrix[13][10] , 
        \regs_matrix[13][9] , \regs_matrix[13][8] , \regs_matrix[13][7] , 
        \regs_matrix[13][6] , \regs_matrix[13][5] , \regs_matrix[13][4] , 
        \regs_matrix[13][3] , \regs_matrix[13][2] , \regs_matrix[13][1] , 
        \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n723), 
        .write_enable(write_enables[14]), .new_value({w_data[16], n714, n111, 
        n708, n109, n703, n701, n699, n98, n100, n96, n691, n688, n685, n682, 
        n679, w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n724), 
        .write_enable(write_enables[15]), .new_value({w_data[16], n713, n710, 
        n708, n705, n703, n701, n699, n697, n99, n693, n690, n687, n684, n681, 
        n678, n676}), .current_value({\regs_matrix[15][16] , 
        \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] , 
        \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] , 
        \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] , 
        \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] , 
        \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] , 
        \regs_matrix[15][0] }) );
  INVX4 U2 ( .A(n86), .Y(n117) );
  INVX4 U3 ( .A(n93), .Y(r1_data[9]) );
  INVX4 U4 ( .A(n665), .Y(n1) );
  BUFX2 U5 ( .A(n389), .Y(n37) );
  BUFX2 U31 ( .A(n389), .Y(n38) );
  BUFX4 U32 ( .A(n661), .Y(n2) );
  BUFX4 U33 ( .A(n661), .Y(n3) );
  INVX2 U34 ( .A(n660), .Y(n661) );
  BUFX4 U35 ( .A(n659), .Y(n4) );
  BUFX4 U36 ( .A(n659), .Y(n14) );
  BUFX4 U37 ( .A(n659), .Y(n15) );
  INVX2 U38 ( .A(n657), .Y(n659) );
  INVX4 U39 ( .A(n131), .Y(n368) );
  INVX4 U40 ( .A(w_data[6]), .Y(n692) );
  INVX4 U41 ( .A(w_data[8]), .Y(n696) );
  INVX4 U42 ( .A(w_data[14]), .Y(n709) );
  INVX4 U43 ( .A(w_data[10]), .Y(n700) );
  INVX4 U44 ( .A(w_data[12]), .Y(n704) );
  INVX4 U45 ( .A(w_data[15]), .Y(n712) );
  INVX4 U46 ( .A(w_data[13]), .Y(n707) );
  AND2X1 U47 ( .A(N11), .B(N10), .Y(n396) );
  INVX4 U48 ( .A(n646), .Y(n83) );
  BUFX4 U49 ( .A(n729), .Y(r2_data[14]) );
  BUFX4 U50 ( .A(n730), .Y(r2_data[2]) );
  INVX8 U51 ( .A(n654), .Y(n655) );
  BUFX4 U52 ( .A(n652), .Y(n654) );
  INVX2 U53 ( .A(n410), .Y(n657) );
  INVX2 U54 ( .A(n411), .Y(n660) );
  INVX2 U55 ( .A(n393), .Y(n392) );
  BUFX2 U56 ( .A(n645), .Y(n646) );
  BUFX2 U57 ( .A(n371), .Y(n372) );
  BUFX2 U58 ( .A(n368), .Y(n369) );
  INVX2 U59 ( .A(N14), .Y(n642) );
  INVX2 U60 ( .A(n132), .Y(n371) );
  INVX4 U61 ( .A(n657), .Y(n658) );
  BUFX2 U62 ( .A(n377), .Y(n106) );
  INVX2 U63 ( .A(n134), .Y(n378) );
  INVX2 U64 ( .A(n39), .Y(n40) );
  INVX2 U65 ( .A(n133), .Y(n374) );
  INVX2 U66 ( .A(n137), .Y(n381) );
  INVX4 U67 ( .A(n380), .Y(n39) );
  INVX2 U68 ( .A(n378), .Y(n380) );
  INVX4 U69 ( .A(n660), .Y(n662) );
  INVX4 U70 ( .A(n39), .Y(n41) );
  BUFX2 U71 ( .A(n377), .Y(n107) );
  INVX2 U72 ( .A(w_data[7]), .Y(n694) );
  NAND2X1 U73 ( .A(n171), .B(n18), .Y(n19) );
  NAND2X1 U74 ( .A(n172), .B(n392), .Y(n20) );
  NAND2X1 U75 ( .A(n19), .B(n20), .Y(n21) );
  INVX1 U76 ( .A(n392), .Y(n18) );
  INVX2 U77 ( .A(n21), .Y(r1_data[3]) );
  INVX2 U78 ( .A(n80), .Y(n22) );
  INVX1 U79 ( .A(n80), .Y(n23) );
  INVX1 U80 ( .A(n80), .Y(n24) );
  INVX1 U81 ( .A(n80), .Y(n25) );
  INVX1 U82 ( .A(n80), .Y(n26) );
  INVX2 U83 ( .A(n80), .Y(n27) );
  INVX1 U84 ( .A(n80), .Y(n28) );
  INVX1 U85 ( .A(n80), .Y(n29) );
  BUFX2 U86 ( .A(n22), .Y(n30) );
  BUFX2 U87 ( .A(n22), .Y(n31) );
  BUFX2 U88 ( .A(n22), .Y(n32) );
  BUFX2 U89 ( .A(n22), .Y(n33) );
  BUFX2 U90 ( .A(n22), .Y(n34) );
  BUFX2 U91 ( .A(n22), .Y(n35) );
  BUFX2 U92 ( .A(n22), .Y(n36) );
  INVX2 U93 ( .A(n81), .Y(n389) );
  INVX4 U94 ( .A(n385), .Y(n387) );
  INVX4 U95 ( .A(n374), .Y(n375) );
  INVX1 U96 ( .A(n371), .Y(n42) );
  INVX1 U97 ( .A(n371), .Y(n43) );
  INVX1 U98 ( .A(n371), .Y(n44) );
  INVX1 U99 ( .A(n371), .Y(n45) );
  INVX1 U100 ( .A(n371), .Y(n46) );
  INVX1 U101 ( .A(n371), .Y(n47) );
  INVX1 U102 ( .A(n372), .Y(n48) );
  INVX1 U103 ( .A(n372), .Y(n49) );
  INVX1 U104 ( .A(n372), .Y(n50) );
  INVX1 U105 ( .A(n372), .Y(n51) );
  INVX1 U106 ( .A(n372), .Y(n52) );
  INVX2 U107 ( .A(n372), .Y(n53) );
  INVX1 U108 ( .A(n373), .Y(n54) );
  INVX1 U109 ( .A(n373), .Y(n55) );
  INVX1 U110 ( .A(n373), .Y(n56) );
  INVX1 U111 ( .A(n373), .Y(n57) );
  INVX1 U112 ( .A(n373), .Y(n58) );
  INVX2 U113 ( .A(n373), .Y(n59) );
  INVX1 U114 ( .A(n132), .Y(n60) );
  BUFX2 U115 ( .A(n371), .Y(n373) );
  INVX1 U116 ( .A(n368), .Y(n61) );
  INVX1 U117 ( .A(n368), .Y(n62) );
  INVX1 U118 ( .A(n368), .Y(n63) );
  INVX1 U119 ( .A(n368), .Y(n64) );
  INVX1 U120 ( .A(n368), .Y(n65) );
  INVX1 U121 ( .A(n368), .Y(n66) );
  INVX1 U122 ( .A(n369), .Y(n67) );
  INVX1 U123 ( .A(n369), .Y(n68) );
  INVX1 U124 ( .A(n369), .Y(n69) );
  INVX1 U125 ( .A(n369), .Y(n70) );
  INVX2 U126 ( .A(n369), .Y(n71) );
  INVX1 U127 ( .A(n370), .Y(n72) );
  INVX1 U128 ( .A(n370), .Y(n73) );
  INVX1 U129 ( .A(n370), .Y(n74) );
  INVX1 U130 ( .A(n370), .Y(n75) );
  INVX1 U131 ( .A(n370), .Y(n76) );
  INVX2 U132 ( .A(n370), .Y(n77) );
  INVX1 U133 ( .A(n131), .Y(n78) );
  BUFX2 U134 ( .A(n368), .Y(n370) );
  INVX2 U135 ( .A(n365), .Y(n394) );
  NAND3X1 U136 ( .A(n395), .B(n364), .C(n363), .Y(n79) );
  INVX2 U137 ( .A(N10), .Y(n365) );
  INVX2 U138 ( .A(N15), .Y(n640) );
  INVX2 U139 ( .A(n393), .Y(n391) );
  AND2X2 U140 ( .A(n396), .B(n364), .Y(n80) );
  AND2X2 U141 ( .A(N12), .B(n396), .Y(n81) );
  INVX4 U142 ( .A(n378), .Y(n379) );
  INVX2 U143 ( .A(n105), .Y(r2_data[5]) );
  AND2X1 U144 ( .A(n640), .B(N14), .Y(n82) );
  INVX2 U145 ( .A(n646), .Y(n651) );
  MUX2X1 U146 ( .B(n562), .A(n561), .S(n674), .Y(r2_data[11]) );
  INVX1 U147 ( .A(n649), .Y(n84) );
  INVX8 U148 ( .A(n648), .Y(n649) );
  BUFX4 U149 ( .A(n645), .Y(n648) );
  INVX4 U150 ( .A(n118), .Y(n102) );
  INVX8 U151 ( .A(n707), .Y(n708) );
  NAND2X1 U152 ( .A(N16), .B(n119), .Y(n85) );
  INVX4 U153 ( .A(n85), .Y(n118) );
  INVX1 U154 ( .A(n365), .Y(n395) );
  INVX2 U155 ( .A(N11), .Y(n363) );
  INVX8 U156 ( .A(n698), .Y(n699) );
  NAND2X1 U157 ( .A(n641), .B(n119), .Y(n86) );
  INVX8 U158 ( .A(n702), .Y(n703) );
  INVX8 U159 ( .A(n700), .Y(n701) );
  INVX4 U160 ( .A(n81), .Y(n390) );
  BUFX2 U161 ( .A(n654), .Y(n87) );
  INVX4 U162 ( .A(n374), .Y(n376) );
  INVX2 U163 ( .A(n374), .Y(n377) );
  INVX4 U164 ( .A(n81), .Y(n388) );
  INVX4 U165 ( .A(n667), .Y(n670) );
  INVX4 U166 ( .A(n667), .Y(n668) );
  NAND2X1 U167 ( .A(n241), .B(n393), .Y(n88) );
  NAND2X1 U168 ( .A(n242), .B(n391), .Y(n89) );
  NAND2X1 U169 ( .A(n88), .B(n89), .Y(n90) );
  INVX4 U170 ( .A(n90), .Y(r1_data[8]) );
  NAND2X1 U171 ( .A(n255), .B(n393), .Y(n91) );
  NAND2X1 U172 ( .A(n256), .B(n392), .Y(n92) );
  NAND2X1 U173 ( .A(n91), .B(n92), .Y(n93) );
  INVX4 U174 ( .A(n665), .Y(n94) );
  INVX4 U175 ( .A(n665), .Y(n666) );
  AND2X2 U176 ( .A(n82), .B(n641), .Y(n665) );
  INVX4 U177 ( .A(N16), .Y(n641) );
  INVX4 U178 ( .A(w_data[9]), .Y(n698) );
  INVX2 U179 ( .A(n692), .Y(n95) );
  INVX2 U180 ( .A(n692), .Y(n96) );
  INVX2 U181 ( .A(n696), .Y(n97) );
  INVX2 U182 ( .A(n696), .Y(n98) );
  INVX2 U183 ( .A(n694), .Y(n99) );
  INVX2 U184 ( .A(n694), .Y(n100) );
  INVX2 U185 ( .A(n118), .Y(n101) );
  INVX2 U186 ( .A(n674), .Y(n673) );
  NAND2X1 U187 ( .A(n674), .B(n477), .Y(n103) );
  NAND2X1 U188 ( .A(n673), .B(n478), .Y(n104) );
  NAND2X1 U189 ( .A(n103), .B(n104), .Y(n105) );
  INVX2 U190 ( .A(n674), .Y(n672) );
  INVX4 U191 ( .A(n414), .Y(n667) );
  INVX2 U192 ( .A(n704), .Y(n108) );
  INVX2 U193 ( .A(n704), .Y(n109) );
  INVX2 U194 ( .A(n709), .Y(n110) );
  INVX2 U195 ( .A(n709), .Y(n111) );
  INVX4 U196 ( .A(w_data[11]), .Y(n702) );
  INVX8 U197 ( .A(n117), .Y(n664) );
  INVX2 U198 ( .A(n118), .Y(n112) );
  INVX2 U199 ( .A(n118), .Y(n113) );
  INVX2 U200 ( .A(n118), .Y(n671) );
  MUX2X1 U201 ( .B(n115), .A(n116), .S(n391), .Y(r1_data[2]) );
  NAND2X1 U202 ( .A(n165), .B(n166), .Y(n115) );
  NAND2X1 U203 ( .A(n159), .B(n160), .Y(n116) );
  INVX2 U204 ( .A(w_data[3]), .Y(n683) );
  INVX2 U205 ( .A(w_data[2]), .Y(n680) );
  INVX2 U206 ( .A(w_data[4]), .Y(n686) );
  INVX2 U207 ( .A(w_data[5]), .Y(n689) );
  INVX2 U208 ( .A(w_data[1]), .Y(n677) );
  INVX2 U209 ( .A(n117), .Y(n663) );
  INVX2 U210 ( .A(N17), .Y(n674) );
  INVX2 U211 ( .A(N13), .Y(n393) );
  INVX2 U212 ( .A(n667), .Y(n669) );
  AND2X2 U213 ( .A(N15), .B(N14), .Y(n119) );
  INVX4 U214 ( .A(n712), .Y(n713) );
  INVX4 U215 ( .A(n712), .Y(n714) );
  INVX2 U216 ( .A(n694), .Y(n695) );
  INVX2 U217 ( .A(n696), .Y(n697) );
  INVX2 U218 ( .A(n692), .Y(n693) );
  INVX2 U219 ( .A(n709), .Y(n711) );
  INVX2 U220 ( .A(n704), .Y(n706) );
  INVX2 U221 ( .A(n709), .Y(n710) );
  INVX2 U222 ( .A(n704), .Y(n705) );
  INVX2 U223 ( .A(n683), .Y(n685) );
  INVX2 U224 ( .A(n680), .Y(n682) );
  INVX2 U225 ( .A(n683), .Y(n684) );
  INVX2 U226 ( .A(n680), .Y(n681) );
  INVX2 U227 ( .A(n686), .Y(n688) );
  INVX2 U228 ( .A(n686), .Y(n687) );
  INVX2 U229 ( .A(n689), .Y(n691) );
  INVX2 U230 ( .A(n689), .Y(n690) );
  INVX2 U231 ( .A(n677), .Y(n679) );
  INVX2 U232 ( .A(n677), .Y(n678) );
  INVX2 U233 ( .A(n675), .Y(n676) );
  INVX2 U234 ( .A(w_data[0]), .Y(n675) );
  INVX2 U235 ( .A(n716), .Y(outreg_data[16]) );
  INVX2 U236 ( .A(n731), .Y(n716) );
  BUFX2 U237 ( .A(n_reset), .Y(n717) );
  BUFX2 U238 ( .A(n_reset), .Y(n718) );
  BUFX2 U239 ( .A(n_reset), .Y(n719) );
  BUFX2 U240 ( .A(n_reset), .Y(n720) );
  BUFX2 U241 ( .A(n_reset), .Y(n721) );
  BUFX2 U242 ( .A(n_reset), .Y(n722) );
  BUFX2 U243 ( .A(n_reset), .Y(n723) );
  BUFX2 U244 ( .A(n_reset), .Y(n724) );
  AOI22X1 U245 ( .A(n123), .B(n122), .C(n121), .D(n120), .Y(n124) );
  INVX2 U246 ( .A(n124), .Y(r1_data[16]) );
  MUX2X1 U247 ( .B(n125), .A(n126), .S(n391), .Y(r1_data[0]) );
  NAND2X1 U248 ( .A(n127), .B(n128), .Y(n126) );
  NOR2X1 U249 ( .A(n129), .B(n130), .Y(n128) );
  OAI22X1 U250 ( .A(\regs_matrix[8][0] ), .B(n65), .C(\regs_matrix[10][0] ), 
        .D(n46), .Y(n130) );
  OAI22X1 U251 ( .A(\regs_matrix[12][0] ), .B(n375), .C(\regs_matrix[14][0] ), 
        .D(n379), .Y(n129) );
  NOR2X1 U252 ( .A(n135), .B(n136), .Y(n127) );
  OAI22X1 U253 ( .A(\regs_matrix[11][0] ), .B(n27), .C(\regs_matrix[9][0] ), 
        .D(n79), .Y(n136) );
  OAI22X1 U254 ( .A(\regs_matrix[13][0] ), .B(n387), .C(\regs_matrix[15][0] ), 
        .D(n390), .Y(n135) );
  NAND2X1 U255 ( .A(n139), .B(n140), .Y(n125) );
  NOR2X1 U256 ( .A(n141), .B(n142), .Y(n140) );
  OAI22X1 U257 ( .A(outreg_data[0]), .B(n66), .C(\regs_matrix[2][0] ), .D(n47), 
        .Y(n142) );
  OAI22X1 U258 ( .A(\regs_matrix[4][0] ), .B(n375), .C(\regs_matrix[6][0] ), 
        .D(n40), .Y(n141) );
  NOR2X1 U259 ( .A(n143), .B(n144), .Y(n139) );
  OAI22X1 U260 ( .A(\regs_matrix[3][0] ), .B(n29), .C(\regs_matrix[1][0] ), 
        .D(n79), .Y(n144) );
  OAI22X1 U261 ( .A(\regs_matrix[5][0] ), .B(n387), .C(\regs_matrix[7][0] ), 
        .D(n388), .Y(n143) );
  MUX2X1 U262 ( .B(n145), .A(n146), .S(n392), .Y(r1_data[1]) );
  NAND2X1 U263 ( .A(n147), .B(n148), .Y(n146) );
  NOR2X1 U264 ( .A(n149), .B(n150), .Y(n148) );
  OAI22X1 U265 ( .A(\regs_matrix[8][1] ), .B(n63), .C(\regs_matrix[10][1] ), 
        .D(n44), .Y(n150) );
  OAI22X1 U266 ( .A(\regs_matrix[12][1] ), .B(n375), .C(\regs_matrix[14][1] ), 
        .D(n40), .Y(n149) );
  NOR2X1 U267 ( .A(n151), .B(n152), .Y(n147) );
  OAI22X1 U268 ( .A(\regs_matrix[11][1] ), .B(n27), .C(\regs_matrix[9][1] ), 
        .D(n79), .Y(n152) );
  OAI22X1 U269 ( .A(\regs_matrix[13][1] ), .B(n386), .C(\regs_matrix[15][1] ), 
        .D(n390), .Y(n151) );
  NAND2X1 U270 ( .A(n153), .B(n154), .Y(n145) );
  NOR2X1 U271 ( .A(n155), .B(n156), .Y(n154) );
  OAI22X1 U272 ( .A(outreg_data[1]), .B(n64), .C(\regs_matrix[2][1] ), .D(n45), 
        .Y(n156) );
  OAI22X1 U273 ( .A(\regs_matrix[4][1] ), .B(n375), .C(\regs_matrix[6][1] ), 
        .D(n40), .Y(n155) );
  NOR2X1 U274 ( .A(n157), .B(n158), .Y(n153) );
  OAI22X1 U275 ( .A(\regs_matrix[3][1] ), .B(n29), .C(\regs_matrix[1][1] ), 
        .D(n79), .Y(n158) );
  OAI22X1 U276 ( .A(\regs_matrix[5][1] ), .B(n386), .C(\regs_matrix[7][1] ), 
        .D(n388), .Y(n157) );
  NOR2X1 U277 ( .A(n161), .B(n162), .Y(n160) );
  OAI22X1 U278 ( .A(\regs_matrix[8][2] ), .B(n61), .C(\regs_matrix[10][2] ), 
        .D(n50), .Y(n162) );
  OAI22X1 U279 ( .A(\regs_matrix[12][2] ), .B(n375), .C(\regs_matrix[14][2] ), 
        .D(n41), .Y(n161) );
  NOR2X1 U280 ( .A(n163), .B(n164), .Y(n159) );
  OAI22X1 U281 ( .A(\regs_matrix[11][2] ), .B(n24), .C(\regs_matrix[9][2] ), 
        .D(n383), .Y(n164) );
  OAI22X1 U282 ( .A(\regs_matrix[13][2] ), .B(n387), .C(\regs_matrix[15][2] ), 
        .D(n388), .Y(n163) );
  NOR2X1 U283 ( .A(n167), .B(n168), .Y(n166) );
  OAI22X1 U284 ( .A(outreg_data[2]), .B(n66), .C(\regs_matrix[2][2] ), .D(n49), 
        .Y(n168) );
  OAI22X1 U285 ( .A(\regs_matrix[4][2] ), .B(n375), .C(\regs_matrix[6][2] ), 
        .D(n41), .Y(n167) );
  NOR2X1 U286 ( .A(n169), .B(n170), .Y(n165) );
  OAI22X1 U287 ( .A(\regs_matrix[3][2] ), .B(n30), .C(\regs_matrix[1][2] ), 
        .D(n384), .Y(n170) );
  OAI22X1 U288 ( .A(\regs_matrix[5][2] ), .B(n387), .C(\regs_matrix[7][2] ), 
        .D(n388), .Y(n169) );
  NAND2X1 U289 ( .A(n173), .B(n174), .Y(n172) );
  NOR2X1 U290 ( .A(n175), .B(n176), .Y(n174) );
  OAI22X1 U291 ( .A(\regs_matrix[8][3] ), .B(n73), .C(\regs_matrix[10][3] ), 
        .D(n53), .Y(n176) );
  OAI22X1 U292 ( .A(\regs_matrix[12][3] ), .B(n375), .C(\regs_matrix[14][3] ), 
        .D(n41), .Y(n175) );
  NOR2X1 U293 ( .A(n177), .B(n178), .Y(n173) );
  OAI22X1 U294 ( .A(\regs_matrix[11][3] ), .B(n34), .C(\regs_matrix[9][3] ), 
        .D(n383), .Y(n178) );
  OAI22X1 U295 ( .A(\regs_matrix[13][3] ), .B(n386), .C(\regs_matrix[15][3] ), 
        .D(n389), .Y(n177) );
  NAND2X1 U296 ( .A(n179), .B(n180), .Y(n171) );
  NOR2X1 U297 ( .A(n181), .B(n182), .Y(n180) );
  OAI22X1 U298 ( .A(outreg_data[3]), .B(n72), .C(\regs_matrix[2][3] ), .D(n51), 
        .Y(n182) );
  OAI22X1 U299 ( .A(\regs_matrix[4][3] ), .B(n375), .C(\regs_matrix[6][3] ), 
        .D(n41), .Y(n181) );
  NOR2X1 U300 ( .A(n184), .B(n183), .Y(n179) );
  OAI22X1 U301 ( .A(\regs_matrix[3][3] ), .B(n30), .C(\regs_matrix[1][3] ), 
        .D(n383), .Y(n184) );
  OAI22X1 U302 ( .A(\regs_matrix[5][3] ), .B(n386), .C(\regs_matrix[7][3] ), 
        .D(n390), .Y(n183) );
  MUX2X1 U303 ( .B(n185), .A(n186), .S(n391), .Y(r1_data[4]) );
  NAND2X1 U304 ( .A(n187), .B(n188), .Y(n186) );
  NOR2X1 U305 ( .A(n189), .B(n190), .Y(n188) );
  OAI22X1 U306 ( .A(\regs_matrix[8][4] ), .B(n61), .C(\regs_matrix[10][4] ), 
        .D(n57), .Y(n190) );
  OAI22X1 U307 ( .A(\regs_matrix[12][4] ), .B(n376), .C(\regs_matrix[14][4] ), 
        .D(n41), .Y(n189) );
  NOR2X1 U308 ( .A(n191), .B(n192), .Y(n187) );
  OAI22X1 U309 ( .A(\regs_matrix[11][4] ), .B(n23), .C(\regs_matrix[9][4] ), 
        .D(n383), .Y(n192) );
  OAI22X1 U310 ( .A(\regs_matrix[13][4] ), .B(n386), .C(\regs_matrix[15][4] ), 
        .D(n388), .Y(n191) );
  NAND2X1 U311 ( .A(n193), .B(n194), .Y(n185) );
  NOR2X1 U312 ( .A(n195), .B(n196), .Y(n194) );
  OAI22X1 U313 ( .A(outreg_data[4]), .B(n75), .C(\regs_matrix[2][4] ), .D(n56), 
        .Y(n196) );
  OAI22X1 U314 ( .A(\regs_matrix[4][4] ), .B(n376), .C(\regs_matrix[6][4] ), 
        .D(n41), .Y(n195) );
  NOR2X1 U315 ( .A(n197), .B(n198), .Y(n193) );
  OAI22X1 U316 ( .A(\regs_matrix[3][4] ), .B(n35), .C(\regs_matrix[1][4] ), 
        .D(n384), .Y(n198) );
  OAI22X1 U317 ( .A(\regs_matrix[5][4] ), .B(n386), .C(\regs_matrix[7][4] ), 
        .D(n390), .Y(n197) );
  MUX2X1 U318 ( .B(n199), .A(n200), .S(n392), .Y(r1_data[5]) );
  NAND2X1 U319 ( .A(n201), .B(n202), .Y(n200) );
  NOR2X1 U320 ( .A(n203), .B(n204), .Y(n202) );
  OAI22X1 U321 ( .A(\regs_matrix[8][5] ), .B(n77), .C(\regs_matrix[10][5] ), 
        .D(n43), .Y(n204) );
  OAI22X1 U322 ( .A(\regs_matrix[12][5] ), .B(n376), .C(\regs_matrix[14][5] ), 
        .D(n41), .Y(n203) );
  NOR2X1 U323 ( .A(n205), .B(n206), .Y(n201) );
  OAI22X1 U324 ( .A(\regs_matrix[11][5] ), .B(n26), .C(\regs_matrix[9][5] ), 
        .D(n383), .Y(n206) );
  OAI22X1 U325 ( .A(\regs_matrix[13][5] ), .B(n386), .C(\regs_matrix[15][5] ), 
        .D(n389), .Y(n205) );
  NAND2X1 U326 ( .A(n207), .B(n208), .Y(n199) );
  NOR2X1 U327 ( .A(n209), .B(n210), .Y(n208) );
  OAI22X1 U328 ( .A(outreg_data[5]), .B(n74), .C(\regs_matrix[2][5] ), .D(n59), 
        .Y(n210) );
  OAI22X1 U329 ( .A(\regs_matrix[4][5] ), .B(n376), .C(\regs_matrix[6][5] ), 
        .D(n41), .Y(n209) );
  NOR2X1 U330 ( .A(n211), .B(n212), .Y(n207) );
  OAI22X1 U331 ( .A(\regs_matrix[3][5] ), .B(n25), .C(\regs_matrix[1][5] ), 
        .D(n382), .Y(n212) );
  OAI22X1 U332 ( .A(\regs_matrix[5][5] ), .B(n386), .C(\regs_matrix[7][5] ), 
        .D(n388), .Y(n211) );
  MUX2X1 U333 ( .B(n213), .A(n214), .S(n391), .Y(r1_data[6]) );
  NAND2X1 U334 ( .A(n215), .B(n216), .Y(n214) );
  NOR2X1 U335 ( .A(n217), .B(n218), .Y(n216) );
  OAI22X1 U336 ( .A(\regs_matrix[8][6] ), .B(n73), .C(\regs_matrix[10][6] ), 
        .D(n53), .Y(n218) );
  OAI22X1 U337 ( .A(\regs_matrix[12][6] ), .B(n376), .C(\regs_matrix[14][6] ), 
        .D(n379), .Y(n217) );
  NOR2X1 U338 ( .A(n219), .B(n220), .Y(n215) );
  OAI22X1 U339 ( .A(\regs_matrix[11][6] ), .B(n33), .C(\regs_matrix[9][6] ), 
        .D(n382), .Y(n220) );
  OAI22X1 U340 ( .A(\regs_matrix[13][6] ), .B(n387), .C(\regs_matrix[15][6] ), 
        .D(n388), .Y(n219) );
  NAND2X1 U341 ( .A(n221), .B(n222), .Y(n213) );
  NOR2X1 U342 ( .A(n223), .B(n224), .Y(n222) );
  OAI22X1 U343 ( .A(outreg_data[6]), .B(n71), .C(\regs_matrix[2][6] ), .D(n51), 
        .Y(n224) );
  OAI22X1 U344 ( .A(\regs_matrix[4][6] ), .B(n376), .C(\regs_matrix[6][6] ), 
        .D(n379), .Y(n223) );
  NOR2X1 U345 ( .A(n225), .B(n226), .Y(n221) );
  OAI22X1 U346 ( .A(\regs_matrix[3][6] ), .B(n32), .C(\regs_matrix[1][6] ), 
        .D(n384), .Y(n226) );
  OAI22X1 U347 ( .A(\regs_matrix[5][6] ), .B(n387), .C(\regs_matrix[7][6] ), 
        .D(n388), .Y(n225) );
  MUX2X1 U348 ( .B(n227), .A(n228), .S(n392), .Y(r1_data[7]) );
  NAND2X1 U349 ( .A(n229), .B(n230), .Y(n228) );
  NOR2X1 U350 ( .A(n231), .B(n232), .Y(n230) );
  OAI22X1 U351 ( .A(\regs_matrix[8][7] ), .B(n64), .C(\regs_matrix[10][7] ), 
        .D(n45), .Y(n232) );
  OAI22X1 U352 ( .A(\regs_matrix[12][7] ), .B(n376), .C(\regs_matrix[14][7] ), 
        .D(n379), .Y(n231) );
  NOR2X1 U353 ( .A(n233), .B(n234), .Y(n229) );
  OAI22X1 U354 ( .A(\regs_matrix[11][7] ), .B(n26), .C(\regs_matrix[9][7] ), 
        .D(n384), .Y(n234) );
  OAI22X1 U355 ( .A(\regs_matrix[13][7] ), .B(n387), .C(\regs_matrix[15][7] ), 
        .D(n388), .Y(n233) );
  NAND2X1 U356 ( .A(n235), .B(n236), .Y(n227) );
  NOR2X1 U357 ( .A(n237), .B(n238), .Y(n236) );
  OAI22X1 U358 ( .A(outreg_data[7]), .B(n68), .C(\regs_matrix[2][7] ), .D(n49), 
        .Y(n238) );
  OAI22X1 U359 ( .A(\regs_matrix[4][7] ), .B(n376), .C(\regs_matrix[6][7] ), 
        .D(n379), .Y(n237) );
  NOR2X1 U360 ( .A(n239), .B(n240), .Y(n235) );
  OAI22X1 U361 ( .A(\regs_matrix[3][7] ), .B(n25), .C(\regs_matrix[1][7] ), 
        .D(n383), .Y(n240) );
  OAI22X1 U362 ( .A(\regs_matrix[5][7] ), .B(n387), .C(\regs_matrix[7][7] ), 
        .D(n389), .Y(n239) );
  NAND2X1 U363 ( .A(n243), .B(n244), .Y(n242) );
  NOR2X1 U364 ( .A(n245), .B(n246), .Y(n244) );
  OAI22X1 U365 ( .A(\regs_matrix[8][8] ), .B(n61), .C(\regs_matrix[10][8] ), 
        .D(n42), .Y(n246) );
  OAI22X1 U366 ( .A(\regs_matrix[12][8] ), .B(n376), .C(\regs_matrix[14][8] ), 
        .D(n379), .Y(n245) );
  NOR2X1 U367 ( .A(n247), .B(n248), .Y(n243) );
  OAI22X1 U368 ( .A(\regs_matrix[11][8] ), .B(n23), .C(\regs_matrix[9][8] ), 
        .D(n382), .Y(n248) );
  OAI22X1 U369 ( .A(\regs_matrix[13][8] ), .B(n387), .C(\regs_matrix[15][8] ), 
        .D(n389), .Y(n247) );
  NAND2X1 U370 ( .A(n249), .B(n250), .Y(n241) );
  NOR2X1 U371 ( .A(n251), .B(n252), .Y(n250) );
  OAI22X1 U372 ( .A(outreg_data[8]), .B(n67), .C(\regs_matrix[2][8] ), .D(n48), 
        .Y(n252) );
  OAI22X1 U373 ( .A(\regs_matrix[4][8] ), .B(n376), .C(\regs_matrix[6][8] ), 
        .D(n379), .Y(n251) );
  NOR2X1 U374 ( .A(n253), .B(n254), .Y(n249) );
  OAI22X1 U375 ( .A(\regs_matrix[3][8] ), .B(n24), .C(\regs_matrix[1][8] ), 
        .D(n383), .Y(n254) );
  OAI22X1 U376 ( .A(\regs_matrix[5][8] ), .B(n387), .C(\regs_matrix[7][8] ), 
        .D(n390), .Y(n253) );
  NAND2X1 U377 ( .A(n257), .B(n258), .Y(n256) );
  NOR2X1 U378 ( .A(n259), .B(n260), .Y(n258) );
  OAI22X1 U379 ( .A(\regs_matrix[8][9] ), .B(n63), .C(\regs_matrix[10][9] ), 
        .D(n44), .Y(n260) );
  OAI22X1 U380 ( .A(\regs_matrix[12][9] ), .B(n376), .C(\regs_matrix[14][9] ), 
        .D(n379), .Y(n259) );
  NOR2X1 U381 ( .A(n261), .B(n262), .Y(n257) );
  OAI22X1 U382 ( .A(\regs_matrix[11][9] ), .B(n25), .C(\regs_matrix[9][9] ), 
        .D(n384), .Y(n262) );
  OAI22X1 U383 ( .A(\regs_matrix[13][9] ), .B(n387), .C(\regs_matrix[15][9] ), 
        .D(n389), .Y(n261) );
  NAND2X1 U384 ( .A(n263), .B(n264), .Y(n255) );
  NOR2X1 U385 ( .A(n265), .B(n266), .Y(n264) );
  OAI22X1 U386 ( .A(outreg_data[9]), .B(n62), .C(\regs_matrix[2][9] ), .D(n43), 
        .Y(n266) );
  OAI22X1 U387 ( .A(\regs_matrix[4][9] ), .B(n376), .C(\regs_matrix[6][9] ), 
        .D(n379), .Y(n265) );
  NOR2X1 U388 ( .A(n267), .B(n268), .Y(n263) );
  OAI22X1 U389 ( .A(\regs_matrix[3][9] ), .B(n26), .C(\regs_matrix[1][9] ), 
        .D(n382), .Y(n268) );
  OAI22X1 U390 ( .A(\regs_matrix[5][9] ), .B(n387), .C(\regs_matrix[7][9] ), 
        .D(n389), .Y(n267) );
  MUX2X1 U391 ( .B(n269), .A(n270), .S(n391), .Y(r1_data[10]) );
  NAND2X1 U392 ( .A(n271), .B(n272), .Y(n270) );
  NOR2X1 U393 ( .A(n273), .B(n274), .Y(n272) );
  OAI22X1 U394 ( .A(\regs_matrix[8][10] ), .B(n70), .C(\regs_matrix[10][10] ), 
        .D(n50), .Y(n274) );
  OAI22X1 U395 ( .A(\regs_matrix[12][10] ), .B(n376), .C(\regs_matrix[14][10] ), .D(n379), .Y(n273) );
  NOR2X1 U396 ( .A(n275), .B(n276), .Y(n271) );
  OAI22X1 U397 ( .A(\regs_matrix[11][10] ), .B(n36), .C(\regs_matrix[9][10] ), 
        .D(n382), .Y(n276) );
  OAI22X1 U398 ( .A(\regs_matrix[13][10] ), .B(n386), .C(\regs_matrix[15][10] ), .D(n390), .Y(n275) );
  NAND2X1 U399 ( .A(n277), .B(n278), .Y(n269) );
  NOR2X1 U400 ( .A(n279), .B(n280), .Y(n278) );
  OAI22X1 U401 ( .A(outreg_data[10]), .B(n71), .C(\regs_matrix[2][10] ), .D(
        n55), .Y(n280) );
  OAI22X1 U402 ( .A(\regs_matrix[4][10] ), .B(n106), .C(\regs_matrix[6][10] ), 
        .D(n379), .Y(n279) );
  NOR2X1 U403 ( .A(n281), .B(n282), .Y(n277) );
  OAI22X1 U404 ( .A(\regs_matrix[3][10] ), .B(n34), .C(\regs_matrix[1][10] ), 
        .D(n384), .Y(n282) );
  OAI22X1 U405 ( .A(\regs_matrix[5][10] ), .B(n386), .C(\regs_matrix[7][10] ), 
        .D(n388), .Y(n281) );
  MUX2X1 U406 ( .B(n283), .A(n284), .S(n392), .Y(r1_data[11]) );
  NAND2X1 U407 ( .A(n285), .B(n286), .Y(n284) );
  NOR2X1 U408 ( .A(n287), .B(n288), .Y(n286) );
  OAI22X1 U409 ( .A(\regs_matrix[8][11] ), .B(n62), .C(\regs_matrix[10][11] ), 
        .D(n42), .Y(n288) );
  OAI22X1 U410 ( .A(\regs_matrix[12][11] ), .B(n107), .C(\regs_matrix[14][11] ), .D(n379), .Y(n287) );
  NOR2X1 U411 ( .A(n289), .B(n290), .Y(n285) );
  OAI22X1 U412 ( .A(\regs_matrix[11][11] ), .B(n24), .C(\regs_matrix[9][11] ), 
        .D(n384), .Y(n290) );
  OAI22X1 U413 ( .A(\regs_matrix[13][11] ), .B(n386), .C(\regs_matrix[15][11] ), .D(n388), .Y(n289) );
  NAND2X1 U414 ( .A(n291), .B(n292), .Y(n283) );
  NOR2X1 U415 ( .A(n293), .B(n294), .Y(n292) );
  OAI22X1 U416 ( .A(outreg_data[11]), .B(n76), .C(\regs_matrix[2][11] ), .D(
        n58), .Y(n294) );
  OAI22X1 U417 ( .A(\regs_matrix[4][11] ), .B(n106), .C(\regs_matrix[6][11] ), 
        .D(n379), .Y(n293) );
  NOR2X1 U418 ( .A(n295), .B(n296), .Y(n291) );
  OAI22X1 U419 ( .A(\regs_matrix[3][11] ), .B(n36), .C(\regs_matrix[1][11] ), 
        .D(n382), .Y(n296) );
  OAI22X1 U420 ( .A(\regs_matrix[5][11] ), .B(n386), .C(\regs_matrix[7][11] ), 
        .D(n390), .Y(n295) );
  MUX2X1 U421 ( .B(n297), .A(n298), .S(n391), .Y(r1_data[12]) );
  NAND2X1 U422 ( .A(n299), .B(n300), .Y(n298) );
  NOR2X1 U423 ( .A(n301), .B(n302), .Y(n300) );
  OAI22X1 U424 ( .A(\regs_matrix[8][12] ), .B(n68), .C(\regs_matrix[10][12] ), 
        .D(n48), .Y(n302) );
  OAI22X1 U425 ( .A(\regs_matrix[12][12] ), .B(n107), .C(\regs_matrix[14][12] ), .D(n379), .Y(n301) );
  NOR2X1 U426 ( .A(n303), .B(n304), .Y(n299) );
  OAI22X1 U427 ( .A(\regs_matrix[11][12] ), .B(n23), .C(\regs_matrix[9][12] ), 
        .D(n382), .Y(n304) );
  OAI22X1 U428 ( .A(\regs_matrix[13][12] ), .B(n387), .C(\regs_matrix[15][12] ), .D(n388), .Y(n303) );
  NAND2X1 U429 ( .A(n305), .B(n306), .Y(n297) );
  NOR2X1 U430 ( .A(n307), .B(n308), .Y(n306) );
  OAI22X1 U431 ( .A(outreg_data[12]), .B(n67), .C(\regs_matrix[2][12] ), .D(
        n46), .Y(n308) );
  OAI22X1 U432 ( .A(\regs_matrix[4][12] ), .B(n106), .C(\regs_matrix[6][12] ), 
        .D(n41), .Y(n307) );
  NOR2X1 U433 ( .A(n309), .B(n310), .Y(n305) );
  OAI22X1 U434 ( .A(\regs_matrix[3][12] ), .B(n28), .C(\regs_matrix[1][12] ), 
        .D(n383), .Y(n310) );
  OAI22X1 U435 ( .A(\regs_matrix[5][12] ), .B(n387), .C(\regs_matrix[7][12] ), 
        .D(n390), .Y(n309) );
  MUX2X1 U436 ( .B(n311), .A(n312), .S(n392), .Y(r1_data[13]) );
  NAND2X1 U437 ( .A(n313), .B(n314), .Y(n312) );
  NOR2X1 U438 ( .A(n315), .B(n316), .Y(n314) );
  OAI22X1 U439 ( .A(\regs_matrix[8][13] ), .B(n72), .C(\regs_matrix[10][13] ), 
        .D(n52), .Y(n316) );
  OAI22X1 U440 ( .A(\regs_matrix[12][13] ), .B(n107), .C(\regs_matrix[14][13] ), .D(n41), .Y(n315) );
  NOR2X1 U441 ( .A(n317), .B(n318), .Y(n313) );
  OAI22X1 U442 ( .A(\regs_matrix[11][13] ), .B(n32), .C(\regs_matrix[9][13] ), 
        .D(n383), .Y(n318) );
  OAI22X1 U443 ( .A(\regs_matrix[13][13] ), .B(n386), .C(\regs_matrix[15][13] ), .D(n389), .Y(n317) );
  NAND2X1 U444 ( .A(n319), .B(n320), .Y(n311) );
  NOR2X1 U445 ( .A(n321), .B(n322), .Y(n320) );
  OAI22X1 U446 ( .A(outreg_data[13]), .B(n69), .C(\regs_matrix[2][13] ), .D(
        n52), .Y(n322) );
  OAI22X1 U447 ( .A(\regs_matrix[4][13] ), .B(n107), .C(\regs_matrix[6][13] ), 
        .D(n41), .Y(n321) );
  NOR2X1 U448 ( .A(n323), .B(n324), .Y(n319) );
  OAI22X1 U449 ( .A(\regs_matrix[3][13] ), .B(n31), .C(\regs_matrix[1][13] ), 
        .D(n384), .Y(n324) );
  OAI22X1 U450 ( .A(\regs_matrix[5][13] ), .B(n386), .C(\regs_matrix[7][13] ), 
        .D(n389), .Y(n323) );
  MUX2X1 U451 ( .B(n325), .A(n326), .S(n391), .Y(r1_data[14]) );
  NAND2X1 U452 ( .A(n327), .B(n328), .Y(n326) );
  NOR2X1 U453 ( .A(n329), .B(n330), .Y(n328) );
  OAI22X1 U454 ( .A(\regs_matrix[8][14] ), .B(n69), .C(\regs_matrix[10][14] ), 
        .D(n55), .Y(n330) );
  OAI22X1 U455 ( .A(\regs_matrix[12][14] ), .B(n106), .C(\regs_matrix[14][14] ), .D(n41), .Y(n329) );
  NOR2X1 U456 ( .A(n331), .B(n332), .Y(n327) );
  OAI22X1 U457 ( .A(\regs_matrix[11][14] ), .B(n28), .C(\regs_matrix[9][14] ), 
        .D(n382), .Y(n332) );
  OAI22X1 U458 ( .A(\regs_matrix[13][14] ), .B(n386), .C(\regs_matrix[15][14] ), .D(n390), .Y(n331) );
  NAND2X1 U459 ( .A(n333), .B(n334), .Y(n325) );
  NOR2X1 U460 ( .A(n335), .B(n336), .Y(n334) );
  OAI22X1 U461 ( .A(outreg_data[14]), .B(n65), .C(\regs_matrix[2][14] ), .D(
        n47), .Y(n336) );
  OAI22X1 U462 ( .A(\regs_matrix[4][14] ), .B(n376), .C(\regs_matrix[6][14] ), 
        .D(n379), .Y(n335) );
  NOR2X1 U463 ( .A(n337), .B(n338), .Y(n333) );
  OAI22X1 U464 ( .A(\regs_matrix[3][14] ), .B(n35), .C(\regs_matrix[1][14] ), 
        .D(n384), .Y(n338) );
  OAI22X1 U465 ( .A(\regs_matrix[5][14] ), .B(n386), .C(\regs_matrix[7][14] ), 
        .D(n389), .Y(n337) );
  MUX2X1 U466 ( .B(n339), .A(n340), .S(n392), .Y(r1_data[15]) );
  NAND2X1 U467 ( .A(n341), .B(n342), .Y(n340) );
  NOR2X1 U468 ( .A(n343), .B(n344), .Y(n342) );
  OAI22X1 U469 ( .A(\regs_matrix[8][15] ), .B(n62), .C(\regs_matrix[10][15] ), 
        .D(n54), .Y(n344) );
  OAI22X1 U470 ( .A(\regs_matrix[12][15] ), .B(n107), .C(\regs_matrix[14][15] ), .D(n379), .Y(n343) );
  NOR2X1 U471 ( .A(n345), .B(n346), .Y(n341) );
  OAI22X1 U472 ( .A(\regs_matrix[11][15] ), .B(n31), .C(\regs_matrix[9][15] ), 
        .D(n383), .Y(n346) );
  OAI22X1 U473 ( .A(\regs_matrix[13][15] ), .B(n386), .C(\regs_matrix[15][15] ), .D(n390), .Y(n345) );
  NAND2X1 U474 ( .A(n347), .B(n348), .Y(n339) );
  NOR2X1 U475 ( .A(n349), .B(n350), .Y(n348) );
  OAI22X1 U476 ( .A(outreg_data[15]), .B(n70), .C(\regs_matrix[2][15] ), .D(
        n54), .Y(n350) );
  OAI22X1 U477 ( .A(\regs_matrix[4][15] ), .B(n376), .C(\regs_matrix[6][15] ), 
        .D(n379), .Y(n349) );
  NOR2X1 U478 ( .A(n351), .B(n352), .Y(n347) );
  OAI22X1 U479 ( .A(\regs_matrix[3][15] ), .B(n33), .C(\regs_matrix[1][15] ), 
        .D(n382), .Y(n352) );
  OAI22X1 U480 ( .A(\regs_matrix[5][15] ), .B(n386), .C(\regs_matrix[7][15] ), 
        .D(n390), .Y(n351) );
  NOR2X1 U481 ( .A(n353), .B(n354), .Y(n120) );
  OAI21X1 U482 ( .A(\regs_matrix[6][16] ), .B(n41), .C(n355), .Y(n354) );
  AOI22X1 U483 ( .A(n60), .B(n356), .C(n78), .D(n716), .Y(n355) );
  INVX2 U484 ( .A(\regs_matrix[2][16] ), .Y(n356) );
  OAI21X1 U485 ( .A(\regs_matrix[4][16] ), .B(n375), .C(n393), .Y(n353) );
  NOR2X1 U486 ( .A(n357), .B(n358), .Y(n121) );
  OAI22X1 U487 ( .A(\regs_matrix[3][16] ), .B(n28), .C(\regs_matrix[1][16] ), 
        .D(n382), .Y(n358) );
  OAI22X1 U488 ( .A(\regs_matrix[5][16] ), .B(n386), .C(\regs_matrix[7][16] ), 
        .D(n38), .Y(n357) );
  NOR2X1 U489 ( .A(n359), .B(n360), .Y(n122) );
  OAI21X1 U490 ( .A(\regs_matrix[12][16] ), .B(n107), .C(n361), .Y(n360) );
  AOI22X1 U491 ( .A(n60), .B(n362), .C(n78), .D(n639), .Y(n361) );
  NAND3X1 U492 ( .A(n363), .B(n364), .C(n365), .Y(n131) );
  INVX2 U493 ( .A(\regs_matrix[10][16] ), .Y(n362) );
  NAND3X1 U494 ( .A(N11), .B(n364), .C(n365), .Y(n132) );
  NAND3X1 U495 ( .A(N12), .B(n363), .C(n365), .Y(n133) );
  OAI22X1 U496 ( .A(\regs_matrix[9][16] ), .B(n384), .C(\regs_matrix[14][16] ), 
        .D(n41), .Y(n359) );
  NAND3X1 U497 ( .A(N12), .B(N11), .C(n365), .Y(n134) );
  NAND3X1 U498 ( .A(n395), .B(n364), .C(n363), .Y(n137) );
  NOR2X1 U499 ( .A(n366), .B(n367), .Y(n123) );
  OAI21X1 U500 ( .A(\regs_matrix[11][16] ), .B(n27), .C(n391), .Y(n367) );
  INVX2 U501 ( .A(N12), .Y(n364) );
  OAI22X1 U502 ( .A(\regs_matrix[15][16] ), .B(n37), .C(\regs_matrix[13][16] ), 
        .D(n386), .Y(n366) );
  NAND3X1 U503 ( .A(N12), .B(n394), .C(n363), .Y(n138) );
  INVX8 U504 ( .A(n385), .Y(n386) );
  INVX4 U505 ( .A(n138), .Y(n385) );
  INVX4 U506 ( .A(n381), .Y(n382) );
  INVX4 U507 ( .A(n381), .Y(n383) );
  INVX4 U508 ( .A(n381), .Y(n384) );
  AOI22X1 U509 ( .A(n400), .B(n399), .C(n398), .D(n397), .Y(n401) );
  INVX2 U510 ( .A(n401), .Y(r2_data[16]) );
  MUX2X1 U511 ( .B(n402), .A(n403), .S(n672), .Y(r2_data[0]) );
  NAND2X1 U512 ( .A(n405), .B(n404), .Y(n403) );
  NOR2X1 U513 ( .A(n407), .B(n406), .Y(n405) );
  OAI22X1 U514 ( .A(\regs_matrix[8][0] ), .B(n649), .C(\regs_matrix[10][0] ), 
        .D(n655), .Y(n407) );
  OAI22X1 U515 ( .A(\regs_matrix[12][0] ), .B(n14), .C(\regs_matrix[14][0] ), 
        .D(n662), .Y(n406) );
  NOR2X1 U516 ( .A(n412), .B(n413), .Y(n404) );
  OAI22X1 U517 ( .A(\regs_matrix[11][0] ), .B(n664), .C(\regs_matrix[9][0] ), 
        .D(n94), .Y(n413) );
  OAI22X1 U518 ( .A(\regs_matrix[13][0] ), .B(n670), .C(\regs_matrix[15][0] ), 
        .D(n102), .Y(n412) );
  NAND2X1 U519 ( .A(n415), .B(n416), .Y(n402) );
  NOR2X1 U520 ( .A(n417), .B(n418), .Y(n416) );
  OAI22X1 U521 ( .A(outreg_data[0]), .B(n649), .C(\regs_matrix[2][0] ), .D(
        n655), .Y(n418) );
  OAI22X1 U522 ( .A(\regs_matrix[4][0] ), .B(n658), .C(\regs_matrix[6][0] ), 
        .D(n2), .Y(n417) );
  NOR2X1 U523 ( .A(n419), .B(n420), .Y(n415) );
  OAI22X1 U524 ( .A(\regs_matrix[3][0] ), .B(n664), .C(\regs_matrix[1][0] ), 
        .D(n1), .Y(n420) );
  OAI22X1 U525 ( .A(\regs_matrix[5][0] ), .B(n670), .C(\regs_matrix[7][0] ), 
        .D(n102), .Y(n419) );
  MUX2X1 U526 ( .B(n421), .A(n422), .S(n673), .Y(r2_data[1]) );
  NAND2X1 U527 ( .A(n423), .B(n424), .Y(n422) );
  NOR2X1 U528 ( .A(n425), .B(n426), .Y(n424) );
  OAI22X1 U529 ( .A(\regs_matrix[8][1] ), .B(n649), .C(\regs_matrix[10][1] ), 
        .D(n655), .Y(n426) );
  OAI22X1 U530 ( .A(\regs_matrix[12][1] ), .B(n658), .C(\regs_matrix[14][1] ), 
        .D(n662), .Y(n425) );
  NOR2X1 U531 ( .A(n427), .B(n428), .Y(n423) );
  OAI22X1 U532 ( .A(\regs_matrix[11][1] ), .B(n664), .C(\regs_matrix[9][1] ), 
        .D(n94), .Y(n428) );
  OAI22X1 U533 ( .A(\regs_matrix[13][1] ), .B(n668), .C(\regs_matrix[15][1] ), 
        .D(n101), .Y(n427) );
  NAND2X1 U534 ( .A(n429), .B(n430), .Y(n421) );
  NOR2X1 U535 ( .A(n431), .B(n432), .Y(n430) );
  OAI22X1 U536 ( .A(outreg_data[1]), .B(n649), .C(\regs_matrix[2][1] ), .D(
        n655), .Y(n432) );
  OAI22X1 U537 ( .A(\regs_matrix[4][1] ), .B(n4), .C(\regs_matrix[6][1] ), .D(
        n662), .Y(n431) );
  NOR2X1 U538 ( .A(n433), .B(n434), .Y(n429) );
  OAI22X1 U539 ( .A(\regs_matrix[3][1] ), .B(n664), .C(\regs_matrix[1][1] ), 
        .D(n1), .Y(n434) );
  OAI22X1 U540 ( .A(\regs_matrix[5][1] ), .B(n668), .C(\regs_matrix[7][1] ), 
        .D(n113), .Y(n433) );
  MUX2X1 U541 ( .B(n435), .A(n436), .S(n672), .Y(n730) );
  NAND2X1 U542 ( .A(n437), .B(n438), .Y(n436) );
  NOR2X1 U543 ( .A(n439), .B(n440), .Y(n438) );
  OAI22X1 U544 ( .A(\regs_matrix[8][2] ), .B(n83), .C(\regs_matrix[10][2] ), 
        .D(n656), .Y(n440) );
  OAI22X1 U545 ( .A(\regs_matrix[12][2] ), .B(n15), .C(\regs_matrix[14][2] ), 
        .D(n3), .Y(n439) );
  NOR2X1 U546 ( .A(n441), .B(n442), .Y(n437) );
  OAI22X1 U547 ( .A(\regs_matrix[11][2] ), .B(n663), .C(\regs_matrix[9][2] ), 
        .D(n94), .Y(n442) );
  OAI22X1 U548 ( .A(\regs_matrix[13][2] ), .B(n670), .C(\regs_matrix[15][2] ), 
        .D(n102), .Y(n441) );
  NAND2X1 U549 ( .A(n443), .B(n444), .Y(n435) );
  NOR2X1 U550 ( .A(n445), .B(n446), .Y(n444) );
  OAI22X1 U551 ( .A(outreg_data[2]), .B(n649), .C(\regs_matrix[2][2] ), .D(
        n656), .Y(n446) );
  OAI22X1 U552 ( .A(\regs_matrix[4][2] ), .B(n658), .C(\regs_matrix[6][2] ), 
        .D(n3), .Y(n445) );
  NOR2X1 U553 ( .A(n447), .B(n448), .Y(n443) );
  OAI22X1 U554 ( .A(\regs_matrix[3][2] ), .B(n664), .C(\regs_matrix[1][2] ), 
        .D(n666), .Y(n448) );
  OAI22X1 U555 ( .A(\regs_matrix[5][2] ), .B(n668), .C(\regs_matrix[7][2] ), 
        .D(n101), .Y(n447) );
  MUX2X1 U556 ( .B(n449), .A(n450), .S(n673), .Y(r2_data[3]) );
  NAND2X1 U557 ( .A(n451), .B(n452), .Y(n450) );
  NOR2X1 U558 ( .A(n453), .B(n454), .Y(n452) );
  OAI22X1 U559 ( .A(\regs_matrix[8][3] ), .B(n649), .C(\regs_matrix[10][3] ), 
        .D(n655), .Y(n454) );
  OAI22X1 U560 ( .A(\regs_matrix[12][3] ), .B(n658), .C(\regs_matrix[14][3] ), 
        .D(n662), .Y(n453) );
  NOR2X1 U561 ( .A(n455), .B(n456), .Y(n451) );
  OAI22X1 U562 ( .A(\regs_matrix[11][3] ), .B(n664), .C(\regs_matrix[9][3] ), 
        .D(n94), .Y(n456) );
  OAI22X1 U563 ( .A(\regs_matrix[13][3] ), .B(n668), .C(\regs_matrix[15][3] ), 
        .D(n113), .Y(n455) );
  NAND2X1 U564 ( .A(n457), .B(n458), .Y(n449) );
  NOR2X1 U565 ( .A(n459), .B(n460), .Y(n458) );
  OAI22X1 U566 ( .A(outreg_data[3]), .B(n649), .C(\regs_matrix[2][3] ), .D(
        n655), .Y(n460) );
  OAI22X1 U567 ( .A(\regs_matrix[4][3] ), .B(n15), .C(\regs_matrix[6][3] ), 
        .D(n662), .Y(n459) );
  NOR2X1 U568 ( .A(n461), .B(n462), .Y(n457) );
  OAI22X1 U569 ( .A(\regs_matrix[3][3] ), .B(n664), .C(\regs_matrix[1][3] ), 
        .D(n666), .Y(n462) );
  OAI22X1 U570 ( .A(\regs_matrix[5][3] ), .B(n670), .C(\regs_matrix[7][3] ), 
        .D(n112), .Y(n461) );
  MUX2X1 U571 ( .B(n463), .A(n464), .S(n672), .Y(r2_data[4]) );
  NAND2X1 U572 ( .A(n466), .B(n465), .Y(n464) );
  NOR2X1 U573 ( .A(n468), .B(n467), .Y(n466) );
  OAI22X1 U574 ( .A(\regs_matrix[8][4] ), .B(n650), .C(\regs_matrix[10][4] ), 
        .D(n656), .Y(n468) );
  OAI22X1 U575 ( .A(\regs_matrix[12][4] ), .B(n658), .C(\regs_matrix[14][4] ), 
        .D(n3), .Y(n467) );
  NOR2X1 U576 ( .A(n469), .B(n470), .Y(n465) );
  OAI22X1 U577 ( .A(\regs_matrix[11][4] ), .B(n664), .C(\regs_matrix[9][4] ), 
        .D(n666), .Y(n470) );
  OAI22X1 U578 ( .A(\regs_matrix[13][4] ), .B(n670), .C(\regs_matrix[15][4] ), 
        .D(n102), .Y(n469) );
  NAND2X1 U579 ( .A(n472), .B(n471), .Y(n463) );
  NOR2X1 U580 ( .A(n473), .B(n474), .Y(n472) );
  OAI22X1 U581 ( .A(outreg_data[4]), .B(n650), .C(\regs_matrix[2][4] ), .D(
        n656), .Y(n474) );
  OAI22X1 U582 ( .A(\regs_matrix[4][4] ), .B(n658), .C(\regs_matrix[6][4] ), 
        .D(n662), .Y(n473) );
  NOR2X1 U583 ( .A(n475), .B(n476), .Y(n471) );
  OAI22X1 U584 ( .A(\regs_matrix[3][4] ), .B(n664), .C(\regs_matrix[1][4] ), 
        .D(n94), .Y(n476) );
  OAI22X1 U585 ( .A(\regs_matrix[5][4] ), .B(n670), .C(\regs_matrix[7][4] ), 
        .D(n102), .Y(n475) );
  NAND2X1 U586 ( .A(n480), .B(n479), .Y(n478) );
  NOR2X1 U587 ( .A(n481), .B(n482), .Y(n480) );
  OAI22X1 U588 ( .A(\regs_matrix[8][5] ), .B(n650), .C(\regs_matrix[10][5] ), 
        .D(n656), .Y(n482) );
  OAI22X1 U589 ( .A(\regs_matrix[12][5] ), .B(n658), .C(\regs_matrix[14][5] ), 
        .D(n662), .Y(n481) );
  NOR2X1 U590 ( .A(n483), .B(n484), .Y(n479) );
  OAI22X1 U591 ( .A(\regs_matrix[11][5] ), .B(n664), .C(\regs_matrix[9][5] ), 
        .D(n666), .Y(n484) );
  OAI22X1 U592 ( .A(\regs_matrix[13][5] ), .B(n668), .C(\regs_matrix[15][5] ), 
        .D(n112), .Y(n483) );
  NAND2X1 U593 ( .A(n486), .B(n485), .Y(n477) );
  NOR2X1 U594 ( .A(n487), .B(n488), .Y(n486) );
  OAI22X1 U595 ( .A(outreg_data[5]), .B(n650), .C(\regs_matrix[2][5] ), .D(
        n656), .Y(n488) );
  OAI22X1 U596 ( .A(\regs_matrix[4][5] ), .B(n658), .C(\regs_matrix[6][5] ), 
        .D(n662), .Y(n487) );
  NOR2X1 U597 ( .A(n489), .B(n490), .Y(n485) );
  OAI22X1 U598 ( .A(\regs_matrix[3][5] ), .B(n664), .C(\regs_matrix[1][5] ), 
        .D(n1), .Y(n490) );
  OAI22X1 U599 ( .A(\regs_matrix[5][5] ), .B(n669), .C(\regs_matrix[7][5] ), 
        .D(n113), .Y(n489) );
  MUX2X1 U600 ( .B(n491), .A(n492), .S(n672), .Y(r2_data[6]) );
  NAND2X1 U601 ( .A(n493), .B(n494), .Y(n492) );
  NOR2X1 U602 ( .A(n495), .B(n496), .Y(n494) );
  OAI22X1 U603 ( .A(\regs_matrix[8][6] ), .B(n650), .C(\regs_matrix[10][6] ), 
        .D(n656), .Y(n496) );
  OAI22X1 U604 ( .A(\regs_matrix[12][6] ), .B(n658), .C(\regs_matrix[14][6] ), 
        .D(n3), .Y(n495) );
  NOR2X1 U605 ( .A(n497), .B(n498), .Y(n493) );
  OAI22X1 U606 ( .A(\regs_matrix[11][6] ), .B(n664), .C(\regs_matrix[9][6] ), 
        .D(n666), .Y(n498) );
  OAI22X1 U607 ( .A(\regs_matrix[13][6] ), .B(n668), .C(\regs_matrix[15][6] ), 
        .D(n101), .Y(n497) );
  NAND2X1 U608 ( .A(n499), .B(n500), .Y(n491) );
  NOR2X1 U609 ( .A(n501), .B(n502), .Y(n500) );
  OAI22X1 U610 ( .A(outreg_data[6]), .B(n650), .C(\regs_matrix[2][6] ), .D(
        n656), .Y(n502) );
  OAI22X1 U611 ( .A(\regs_matrix[4][6] ), .B(n658), .C(\regs_matrix[6][6] ), 
        .D(n662), .Y(n501) );
  NOR2X1 U612 ( .A(n503), .B(n504), .Y(n499) );
  OAI22X1 U613 ( .A(\regs_matrix[3][6] ), .B(n664), .C(\regs_matrix[1][6] ), 
        .D(n1), .Y(n504) );
  OAI22X1 U614 ( .A(\regs_matrix[5][6] ), .B(n668), .C(\regs_matrix[7][6] ), 
        .D(n113), .Y(n503) );
  MUX2X1 U615 ( .B(n505), .A(n506), .S(n673), .Y(r2_data[7]) );
  NAND2X1 U616 ( .A(n508), .B(n507), .Y(n506) );
  NOR2X1 U617 ( .A(n509), .B(n510), .Y(n508) );
  OAI22X1 U618 ( .A(\regs_matrix[8][7] ), .B(n650), .C(\regs_matrix[10][7] ), 
        .D(n656), .Y(n510) );
  OAI22X1 U619 ( .A(\regs_matrix[12][7] ), .B(n658), .C(\regs_matrix[14][7] ), 
        .D(n2), .Y(n509) );
  NOR2X1 U620 ( .A(n511), .B(n512), .Y(n507) );
  OAI22X1 U621 ( .A(\regs_matrix[11][7] ), .B(n664), .C(\regs_matrix[9][7] ), 
        .D(n94), .Y(n512) );
  OAI22X1 U622 ( .A(\regs_matrix[13][7] ), .B(n670), .C(\regs_matrix[15][7] ), 
        .D(n101), .Y(n511) );
  NAND2X1 U623 ( .A(n513), .B(n514), .Y(n505) );
  NOR2X1 U624 ( .A(n515), .B(n516), .Y(n514) );
  OAI22X1 U625 ( .A(outreg_data[7]), .B(n650), .C(\regs_matrix[2][7] ), .D(
        n656), .Y(n516) );
  OAI22X1 U626 ( .A(\regs_matrix[4][7] ), .B(n658), .C(\regs_matrix[6][7] ), 
        .D(n662), .Y(n515) );
  NOR2X1 U627 ( .A(n517), .B(n518), .Y(n513) );
  OAI22X1 U628 ( .A(\regs_matrix[3][7] ), .B(n664), .C(\regs_matrix[1][7] ), 
        .D(n666), .Y(n518) );
  OAI22X1 U629 ( .A(\regs_matrix[5][7] ), .B(n670), .C(\regs_matrix[7][7] ), 
        .D(n112), .Y(n517) );
  MUX2X1 U630 ( .B(n519), .A(n520), .S(n672), .Y(r2_data[8]) );
  NAND2X1 U631 ( .A(n521), .B(n522), .Y(n520) );
  NOR2X1 U632 ( .A(n523), .B(n524), .Y(n522) );
  OAI22X1 U633 ( .A(\regs_matrix[8][8] ), .B(n650), .C(\regs_matrix[10][8] ), 
        .D(n656), .Y(n524) );
  OAI22X1 U634 ( .A(\regs_matrix[12][8] ), .B(n658), .C(\regs_matrix[14][8] ), 
        .D(n3), .Y(n523) );
  NOR2X1 U635 ( .A(n525), .B(n526), .Y(n521) );
  OAI22X1 U636 ( .A(\regs_matrix[11][8] ), .B(n663), .C(\regs_matrix[9][8] ), 
        .D(n94), .Y(n526) );
  OAI22X1 U637 ( .A(\regs_matrix[13][8] ), .B(n670), .C(\regs_matrix[15][8] ), 
        .D(n102), .Y(n525) );
  NAND2X1 U638 ( .A(n528), .B(n527), .Y(n519) );
  NOR2X1 U639 ( .A(n529), .B(n530), .Y(n528) );
  OAI22X1 U640 ( .A(outreg_data[8]), .B(n650), .C(\regs_matrix[2][8] ), .D(
        n656), .Y(n530) );
  OAI22X1 U641 ( .A(\regs_matrix[4][8] ), .B(n658), .C(\regs_matrix[6][8] ), 
        .D(n2), .Y(n529) );
  NOR2X1 U642 ( .A(n531), .B(n532), .Y(n527) );
  OAI22X1 U643 ( .A(\regs_matrix[3][8] ), .B(n663), .C(\regs_matrix[1][8] ), 
        .D(n1), .Y(n532) );
  OAI22X1 U644 ( .A(\regs_matrix[5][8] ), .B(n669), .C(\regs_matrix[7][8] ), 
        .D(n671), .Y(n531) );
  MUX2X1 U645 ( .B(n533), .A(n534), .S(n673), .Y(r2_data[9]) );
  NAND2X1 U646 ( .A(n535), .B(n536), .Y(n534) );
  NOR2X1 U647 ( .A(n538), .B(n537), .Y(n536) );
  OAI22X1 U648 ( .A(\regs_matrix[8][9] ), .B(n650), .C(\regs_matrix[10][9] ), 
        .D(n656), .Y(n538) );
  OAI22X1 U649 ( .A(\regs_matrix[12][9] ), .B(n658), .C(\regs_matrix[14][9] ), 
        .D(n662), .Y(n537) );
  NOR2X1 U650 ( .A(n539), .B(n540), .Y(n535) );
  OAI22X1 U651 ( .A(\regs_matrix[11][9] ), .B(n664), .C(\regs_matrix[9][9] ), 
        .D(n666), .Y(n540) );
  OAI22X1 U652 ( .A(\regs_matrix[13][9] ), .B(n670), .C(\regs_matrix[15][9] ), 
        .D(n102), .Y(n539) );
  NAND2X1 U653 ( .A(n541), .B(n542), .Y(n533) );
  NOR2X1 U654 ( .A(n543), .B(n544), .Y(n542) );
  OAI22X1 U655 ( .A(outreg_data[9]), .B(n649), .C(\regs_matrix[2][9] ), .D(
        n656), .Y(n544) );
  OAI22X1 U656 ( .A(\regs_matrix[4][9] ), .B(n658), .C(\regs_matrix[6][9] ), 
        .D(n662), .Y(n543) );
  NOR2X1 U657 ( .A(n545), .B(n546), .Y(n541) );
  OAI22X1 U658 ( .A(\regs_matrix[3][9] ), .B(n664), .C(\regs_matrix[1][9] ), 
        .D(n1), .Y(n546) );
  OAI22X1 U659 ( .A(\regs_matrix[5][9] ), .B(n668), .C(\regs_matrix[7][9] ), 
        .D(n113), .Y(n545) );
  MUX2X1 U660 ( .B(n547), .A(n548), .S(n672), .Y(r2_data[10]) );
  NAND2X1 U661 ( .A(n549), .B(n550), .Y(n548) );
  NOR2X1 U662 ( .A(n551), .B(n552), .Y(n550) );
  OAI22X1 U663 ( .A(\regs_matrix[8][10] ), .B(n83), .C(\regs_matrix[10][10] ), 
        .D(n655), .Y(n552) );
  OAI22X1 U664 ( .A(\regs_matrix[12][10] ), .B(n658), .C(\regs_matrix[14][10] ), .D(n662), .Y(n551) );
  NOR2X1 U665 ( .A(n553), .B(n554), .Y(n549) );
  OAI22X1 U666 ( .A(\regs_matrix[11][10] ), .B(n664), .C(\regs_matrix[9][10] ), 
        .D(n1), .Y(n554) );
  OAI22X1 U667 ( .A(\regs_matrix[13][10] ), .B(n670), .C(\regs_matrix[15][10] ), .D(n102), .Y(n553) );
  NAND2X1 U668 ( .A(n555), .B(n556), .Y(n547) );
  NOR2X1 U669 ( .A(n557), .B(n558), .Y(n556) );
  OAI22X1 U670 ( .A(outreg_data[10]), .B(n83), .C(\regs_matrix[2][10] ), .D(
        n655), .Y(n558) );
  OAI22X1 U671 ( .A(\regs_matrix[4][10] ), .B(n14), .C(\regs_matrix[6][10] ), 
        .D(n3), .Y(n557) );
  NOR2X1 U672 ( .A(n559), .B(n560), .Y(n555) );
  OAI22X1 U673 ( .A(\regs_matrix[3][10] ), .B(n664), .C(\regs_matrix[1][10] ), 
        .D(n94), .Y(n560) );
  OAI22X1 U674 ( .A(\regs_matrix[5][10] ), .B(n668), .C(\regs_matrix[7][10] ), 
        .D(n112), .Y(n559) );
  NAND2X1 U675 ( .A(n563), .B(n564), .Y(n562) );
  NOR2X1 U676 ( .A(n565), .B(n566), .Y(n564) );
  OAI22X1 U677 ( .A(\regs_matrix[8][11] ), .B(n649), .C(\regs_matrix[10][11] ), 
        .D(n655), .Y(n566) );
  OAI22X1 U678 ( .A(\regs_matrix[12][11] ), .B(n4), .C(\regs_matrix[14][11] ), 
        .D(n2), .Y(n565) );
  NOR2X1 U679 ( .A(n567), .B(n568), .Y(n563) );
  OAI22X1 U680 ( .A(\regs_matrix[11][11] ), .B(n664), .C(\regs_matrix[9][11] ), 
        .D(n666), .Y(n568) );
  OAI22X1 U681 ( .A(\regs_matrix[13][11] ), .B(n669), .C(\regs_matrix[15][11] ), .D(n101), .Y(n567) );
  NAND2X1 U682 ( .A(n569), .B(n570), .Y(n561) );
  NOR2X1 U683 ( .A(n571), .B(n572), .Y(n570) );
  OAI22X1 U684 ( .A(outreg_data[11]), .B(n649), .C(\regs_matrix[2][11] ), .D(
        n655), .Y(n572) );
  OAI22X1 U685 ( .A(\regs_matrix[4][11] ), .B(n4), .C(\regs_matrix[6][11] ), 
        .D(n662), .Y(n571) );
  NOR2X1 U686 ( .A(n573), .B(n574), .Y(n569) );
  OAI22X1 U687 ( .A(\regs_matrix[3][11] ), .B(n664), .C(\regs_matrix[1][11] ), 
        .D(n94), .Y(n574) );
  OAI22X1 U688 ( .A(\regs_matrix[5][11] ), .B(n669), .C(\regs_matrix[7][11] ), 
        .D(n102), .Y(n573) );
  MUX2X1 U689 ( .B(n575), .A(n576), .S(n672), .Y(r2_data[12]) );
  NAND2X1 U690 ( .A(n578), .B(n577), .Y(n576) );
  NOR2X1 U691 ( .A(n579), .B(n580), .Y(n578) );
  OAI22X1 U692 ( .A(\regs_matrix[8][12] ), .B(n651), .C(\regs_matrix[10][12] ), 
        .D(n656), .Y(n580) );
  OAI22X1 U693 ( .A(\regs_matrix[12][12] ), .B(n4), .C(\regs_matrix[14][12] ), 
        .D(n2), .Y(n579) );
  NOR2X1 U694 ( .A(n581), .B(n582), .Y(n577) );
  OAI22X1 U695 ( .A(\regs_matrix[11][12] ), .B(n664), .C(\regs_matrix[9][12] ), 
        .D(n1), .Y(n582) );
  OAI22X1 U696 ( .A(\regs_matrix[13][12] ), .B(n670), .C(\regs_matrix[15][12] ), .D(n671), .Y(n581) );
  NAND2X1 U697 ( .A(n584), .B(n583), .Y(n575) );
  NOR2X1 U698 ( .A(n585), .B(n586), .Y(n584) );
  OAI22X1 U699 ( .A(outreg_data[12]), .B(n651), .C(\regs_matrix[2][12] ), .D(
        n655), .Y(n586) );
  OAI22X1 U700 ( .A(\regs_matrix[4][12] ), .B(n4), .C(\regs_matrix[6][12] ), 
        .D(n2), .Y(n585) );
  NOR2X1 U701 ( .A(n587), .B(n588), .Y(n583) );
  OAI22X1 U702 ( .A(\regs_matrix[3][12] ), .B(n664), .C(\regs_matrix[1][12] ), 
        .D(n94), .Y(n588) );
  OAI22X1 U703 ( .A(\regs_matrix[5][12] ), .B(n670), .C(\regs_matrix[7][12] ), 
        .D(n671), .Y(n587) );
  MUX2X1 U704 ( .B(n589), .A(n590), .S(n673), .Y(r2_data[13]) );
  NAND2X1 U705 ( .A(n591), .B(n592), .Y(n590) );
  NOR2X1 U706 ( .A(n593), .B(n594), .Y(n592) );
  OAI22X1 U707 ( .A(\regs_matrix[8][13] ), .B(n83), .C(\regs_matrix[10][13] ), 
        .D(n655), .Y(n594) );
  OAI22X1 U708 ( .A(\regs_matrix[12][13] ), .B(n14), .C(\regs_matrix[14][13] ), 
        .D(n662), .Y(n593) );
  NOR2X1 U709 ( .A(n595), .B(n596), .Y(n591) );
  OAI22X1 U710 ( .A(\regs_matrix[11][13] ), .B(n663), .C(\regs_matrix[9][13] ), 
        .D(n1), .Y(n596) );
  OAI22X1 U711 ( .A(\regs_matrix[13][13] ), .B(n668), .C(\regs_matrix[15][13] ), .D(n102), .Y(n595) );
  NAND2X1 U712 ( .A(n597), .B(n598), .Y(n589) );
  NOR2X1 U713 ( .A(n599), .B(n600), .Y(n598) );
  OAI22X1 U714 ( .A(outreg_data[13]), .B(n649), .C(\regs_matrix[2][13] ), .D(
        n655), .Y(n600) );
  OAI22X1 U715 ( .A(\regs_matrix[4][13] ), .B(n15), .C(\regs_matrix[6][13] ), 
        .D(n3), .Y(n599) );
  NOR2X1 U716 ( .A(n601), .B(n602), .Y(n597) );
  OAI22X1 U717 ( .A(\regs_matrix[3][13] ), .B(n663), .C(\regs_matrix[1][13] ), 
        .D(n666), .Y(n602) );
  OAI22X1 U718 ( .A(\regs_matrix[5][13] ), .B(n669), .C(\regs_matrix[7][13] ), 
        .D(n113), .Y(n601) );
  MUX2X1 U719 ( .B(n603), .A(n604), .S(n672), .Y(n729) );
  NAND2X1 U720 ( .A(n605), .B(n606), .Y(n604) );
  NOR2X1 U721 ( .A(n607), .B(n608), .Y(n606) );
  OAI22X1 U722 ( .A(\regs_matrix[8][14] ), .B(n83), .C(\regs_matrix[10][14] ), 
        .D(n656), .Y(n608) );
  OAI22X1 U723 ( .A(\regs_matrix[12][14] ), .B(n14), .C(\regs_matrix[14][14] ), 
        .D(n662), .Y(n607) );
  NOR2X1 U724 ( .A(n609), .B(n610), .Y(n605) );
  OAI22X1 U725 ( .A(\regs_matrix[11][14] ), .B(n664), .C(\regs_matrix[9][14] ), 
        .D(n666), .Y(n610) );
  OAI22X1 U726 ( .A(\regs_matrix[13][14] ), .B(n668), .C(\regs_matrix[15][14] ), .D(n102), .Y(n609) );
  NAND2X1 U727 ( .A(n611), .B(n612), .Y(n603) );
  NOR2X1 U728 ( .A(n613), .B(n614), .Y(n612) );
  OAI22X1 U729 ( .A(outreg_data[14]), .B(n83), .C(\regs_matrix[2][14] ), .D(
        n655), .Y(n614) );
  OAI22X1 U730 ( .A(\regs_matrix[4][14] ), .B(n15), .C(\regs_matrix[6][14] ), 
        .D(n3), .Y(n613) );
  NOR2X1 U731 ( .A(n615), .B(n616), .Y(n611) );
  OAI22X1 U732 ( .A(\regs_matrix[3][14] ), .B(n663), .C(\regs_matrix[1][14] ), 
        .D(n94), .Y(n616) );
  OAI22X1 U733 ( .A(\regs_matrix[5][14] ), .B(n670), .C(\regs_matrix[7][14] ), 
        .D(n112), .Y(n615) );
  MUX2X1 U734 ( .B(n617), .A(n618), .S(n673), .Y(r2_data[15]) );
  NAND2X1 U735 ( .A(n619), .B(n620), .Y(n618) );
  NOR2X1 U736 ( .A(n621), .B(n622), .Y(n620) );
  OAI22X1 U737 ( .A(\regs_matrix[8][15] ), .B(n83), .C(\regs_matrix[10][15] ), 
        .D(n655), .Y(n622) );
  OAI22X1 U738 ( .A(\regs_matrix[12][15] ), .B(n15), .C(\regs_matrix[14][15] ), 
        .D(n3), .Y(n621) );
  NOR2X1 U739 ( .A(n623), .B(n624), .Y(n619) );
  OAI22X1 U740 ( .A(\regs_matrix[11][15] ), .B(n664), .C(\regs_matrix[9][15] ), 
        .D(n1), .Y(n624) );
  OAI22X1 U741 ( .A(\regs_matrix[13][15] ), .B(n669), .C(\regs_matrix[15][15] ), .D(n671), .Y(n623) );
  NAND2X1 U742 ( .A(n625), .B(n626), .Y(n617) );
  NOR2X1 U743 ( .A(n627), .B(n628), .Y(n626) );
  OAI22X1 U744 ( .A(outreg_data[15]), .B(n650), .C(\regs_matrix[2][15] ), .D(
        n655), .Y(n628) );
  OAI22X1 U745 ( .A(\regs_matrix[4][15] ), .B(n14), .C(\regs_matrix[6][15] ), 
        .D(n2), .Y(n627) );
  NOR2X1 U746 ( .A(n629), .B(n630), .Y(n625) );
  OAI22X1 U747 ( .A(\regs_matrix[3][15] ), .B(n664), .C(\regs_matrix[1][15] ), 
        .D(n1), .Y(n630) );
  OAI22X1 U748 ( .A(\regs_matrix[5][15] ), .B(n669), .C(\regs_matrix[7][15] ), 
        .D(n671), .Y(n629) );
  NOR2X1 U749 ( .A(n631), .B(n632), .Y(n397) );
  OAI21X1 U750 ( .A(\regs_matrix[6][16] ), .B(n662), .C(n633), .Y(n632) );
  AOI22X1 U751 ( .A(n87), .B(n356), .C(n84), .D(n716), .Y(n633) );
  OAI21X1 U752 ( .A(\regs_matrix[4][16] ), .B(n15), .C(n674), .Y(n631) );
  NOR2X1 U753 ( .A(n634), .B(n635), .Y(n398) );
  OAI22X1 U754 ( .A(\regs_matrix[3][16] ), .B(n664), .C(\regs_matrix[1][16] ), 
        .D(n94), .Y(n635) );
  OAI22X1 U755 ( .A(\regs_matrix[5][16] ), .B(n668), .C(\regs_matrix[7][16] ), 
        .D(n112), .Y(n634) );
  NOR2X1 U756 ( .A(n636), .B(n637), .Y(n399) );
  OAI21X1 U757 ( .A(\regs_matrix[12][16] ), .B(n14), .C(n638), .Y(n637) );
  AOI22X1 U758 ( .A(n87), .B(n362), .C(n84), .D(n639), .Y(n638) );
  INVX2 U759 ( .A(\regs_matrix[8][16] ), .Y(n639) );
  NAND3X1 U760 ( .A(n640), .B(n641), .C(n642), .Y(n408) );
  NAND3X1 U761 ( .A(N15), .B(n642), .C(n641), .Y(n409) );
  NAND3X1 U762 ( .A(N16), .B(n640), .C(n642), .Y(n410) );
  OAI22X1 U763 ( .A(\regs_matrix[9][16] ), .B(n666), .C(\regs_matrix[14][16] ), 
        .D(n3), .Y(n636) );
  NAND3X1 U764 ( .A(N16), .B(N15), .C(n642), .Y(n411) );
  NOR2X1 U765 ( .A(n643), .B(n644), .Y(n400) );
  OAI21X1 U766 ( .A(\regs_matrix[11][16] ), .B(n663), .C(n672), .Y(n644) );
  OAI22X1 U767 ( .A(\regs_matrix[15][16] ), .B(n102), .C(\regs_matrix[13][16] ), .D(n670), .Y(n643) );
  NAND3X1 U768 ( .A(N16), .B(N14), .C(n640), .Y(n414) );
  BUFX4 U769 ( .A(n645), .Y(n647) );
  INVX8 U770 ( .A(n647), .Y(n650) );
  BUFX4 U771 ( .A(n652), .Y(n653) );
  INVX8 U772 ( .A(n653), .Y(n656) );
  INVX2 U773 ( .A(n409), .Y(n652) );
  INVX2 U774 ( .A(n408), .Y(n645) );
  INVX2 U775 ( .A(w_sel[1]), .Y(n725) );
  INVX2 U776 ( .A(w_en), .Y(n726) );
  INVX2 U777 ( .A(w_sel[2]), .Y(n727) );
  INVX2 U778 ( .A(w_sel[3]), .Y(n728) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data({src1_data[16:6], n2, src1_data[4:0]}), .src2_data(
        src2_data), .alu_op(alu_op), .result(alu_result), .overflow(overflow)
         );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  INVX2 U2 ( .A(src1_data[5]), .Y(n1) );
  INVX8 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(w_data_sel[1]), .Y(n38) );
  AND2X2 U5 ( .A(n38), .B(n5), .Y(n3) );
  AND2X2 U6 ( .A(w_data_sel[0]), .B(n38), .Y(n4) );
  AND2X2 U7 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U8 ( .A(alu_result[15]), .Y(n7) );
  INVX2 U9 ( .A(w_data_sel[0]), .Y(n5) );
  AOI22X1 U10 ( .A(ext_data2[15]), .B(n4), .C(ext_data1[15]), .D(n3), .Y(n6)
         );
  OAI21X1 U11 ( .A(n38), .B(n7), .C(n6), .Y(dest_data[15]) );
  INVX2 U12 ( .A(alu_result[14]), .Y(n9) );
  AOI22X1 U13 ( .A(ext_data2[14]), .B(n4), .C(ext_data1[14]), .D(n3), .Y(n8)
         );
  OAI21X1 U14 ( .A(n38), .B(n9), .C(n8), .Y(dest_data[14]) );
  INVX2 U15 ( .A(alu_result[13]), .Y(n11) );
  AOI22X1 U16 ( .A(ext_data2[13]), .B(n4), .C(ext_data1[13]), .D(n3), .Y(n10)
         );
  OAI21X1 U17 ( .A(n38), .B(n11), .C(n10), .Y(dest_data[13]) );
  INVX2 U18 ( .A(alu_result[12]), .Y(n13) );
  AOI22X1 U19 ( .A(ext_data2[12]), .B(n4), .C(ext_data1[12]), .D(n3), .Y(n12)
         );
  OAI21X1 U20 ( .A(n38), .B(n13), .C(n12), .Y(dest_data[12]) );
  INVX2 U21 ( .A(alu_result[11]), .Y(n15) );
  AOI22X1 U22 ( .A(ext_data2[11]), .B(n4), .C(ext_data1[11]), .D(n3), .Y(n14)
         );
  OAI21X1 U23 ( .A(n38), .B(n15), .C(n14), .Y(dest_data[11]) );
  INVX2 U24 ( .A(alu_result[10]), .Y(n17) );
  AOI22X1 U25 ( .A(ext_data2[10]), .B(n4), .C(ext_data1[10]), .D(n3), .Y(n16)
         );
  OAI21X1 U26 ( .A(n38), .B(n17), .C(n16), .Y(dest_data[10]) );
  INVX2 U27 ( .A(alu_result[9]), .Y(n19) );
  AOI22X1 U28 ( .A(ext_data2[9]), .B(n4), .C(ext_data1[9]), .D(n3), .Y(n18) );
  OAI21X1 U29 ( .A(n38), .B(n19), .C(n18), .Y(dest_data[9]) );
  INVX2 U30 ( .A(alu_result[8]), .Y(n21) );
  AOI22X1 U31 ( .A(ext_data2[8]), .B(n4), .C(ext_data1[8]), .D(n3), .Y(n20) );
  OAI21X1 U32 ( .A(n38), .B(n21), .C(n20), .Y(dest_data[8]) );
  INVX2 U33 ( .A(alu_result[7]), .Y(n23) );
  AOI22X1 U34 ( .A(ext_data2[7]), .B(n4), .C(ext_data1[7]), .D(n3), .Y(n22) );
  OAI21X1 U35 ( .A(n38), .B(n23), .C(n22), .Y(dest_data[7]) );
  INVX2 U36 ( .A(alu_result[6]), .Y(n25) );
  AOI22X1 U37 ( .A(ext_data2[6]), .B(n4), .C(ext_data1[6]), .D(n3), .Y(n24) );
  OAI21X1 U38 ( .A(n38), .B(n25), .C(n24), .Y(dest_data[6]) );
  INVX2 U39 ( .A(alu_result[5]), .Y(n27) );
  AOI22X1 U40 ( .A(ext_data2[5]), .B(n4), .C(ext_data1[5]), .D(n3), .Y(n26) );
  OAI21X1 U41 ( .A(n38), .B(n27), .C(n26), .Y(dest_data[5]) );
  INVX2 U42 ( .A(alu_result[4]), .Y(n29) );
  AOI22X1 U43 ( .A(ext_data2[4]), .B(n4), .C(ext_data1[4]), .D(n3), .Y(n28) );
  OAI21X1 U44 ( .A(n38), .B(n29), .C(n28), .Y(dest_data[4]) );
  INVX2 U45 ( .A(alu_result[3]), .Y(n31) );
  AOI22X1 U46 ( .A(ext_data2[3]), .B(n4), .C(ext_data1[3]), .D(n3), .Y(n30) );
  OAI21X1 U47 ( .A(n38), .B(n31), .C(n30), .Y(dest_data[3]) );
  INVX2 U48 ( .A(alu_result[2]), .Y(n33) );
  AOI22X1 U49 ( .A(ext_data2[2]), .B(n4), .C(ext_data1[2]), .D(n3), .Y(n32) );
  OAI21X1 U50 ( .A(n38), .B(n33), .C(n32), .Y(dest_data[2]) );
  INVX2 U51 ( .A(alu_result[1]), .Y(n35) );
  AOI22X1 U52 ( .A(ext_data2[1]), .B(n4), .C(ext_data1[1]), .D(n3), .Y(n34) );
  OAI21X1 U53 ( .A(n38), .B(n35), .C(n34), .Y(dest_data[1]) );
  INVX2 U54 ( .A(alu_result[0]), .Y(n37) );
  AOI22X1 U55 ( .A(ext_data2[0]), .B(n4), .C(ext_data1[0]), .D(n3), .Y(n36) );
  OAI21X1 U56 ( .A(n38), .B(n37), .C(n36), .Y(dest_data[0]) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [10:0] A;
  output [10:0] SUM;

  wire   [10:2] carry;

  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(SUM[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_1 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N15, N16, N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28,
         N29, N30, N31, N32, N33, N34, N35, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n1, n2, n4, n5, n6, n30, n46, n48, n59, n60, n61, n62,
         n63, n64;
  wire   [9:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(next_count[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(next_count[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(next_count[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(next_count[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(next_count[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(next_count[8]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(next_count[9]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[9]) );
  DFFSR rollover_flag_reg ( .D(n4), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  OAI21X1 U3 ( .A(n2), .B(n7), .C(n8), .Y(next_count[9]) );
  NAND2X1 U4 ( .A(n2), .B(N24), .Y(n8) );
  OAI21X1 U5 ( .A(count_enable), .B(n9), .C(n10), .Y(next_count[8]) );
  NAND2X1 U6 ( .A(N23), .B(n2), .Y(n10) );
  OAI21X1 U7 ( .A(n2), .B(n11), .C(n12), .Y(next_count[7]) );
  NAND2X1 U9 ( .A(N22), .B(n2), .Y(n12) );
  OAI21X1 U10 ( .A(count_enable), .B(n13), .C(n14), .Y(next_count[6]) );
  NAND2X1 U11 ( .A(N21), .B(n2), .Y(n14) );
  OAI21X1 U12 ( .A(n2), .B(n15), .C(n16), .Y(next_count[5]) );
  NAND2X1 U13 ( .A(N20), .B(n2), .Y(n16) );
  OAI21X1 U14 ( .A(count_enable), .B(n17), .C(n18), .Y(next_count[4]) );
  NAND2X1 U15 ( .A(N19), .B(count_enable), .Y(n18) );
  OAI21X1 U16 ( .A(n2), .B(n19), .C(n20), .Y(next_count[3]) );
  NAND2X1 U17 ( .A(N18), .B(n2), .Y(n20) );
  OAI21X1 U18 ( .A(count_enable), .B(n21), .C(n22), .Y(next_count[2]) );
  NAND2X1 U19 ( .A(N17), .B(count_enable), .Y(n22) );
  OAI21X1 U20 ( .A(n2), .B(n23), .C(n24), .Y(next_count[1]) );
  NAND2X1 U21 ( .A(N16), .B(n2), .Y(n24) );
  OAI21X1 U22 ( .A(count_enable), .B(n25), .C(n26), .Y(next_count[0]) );
  NAND2X1 U23 ( .A(N15), .B(count_enable), .Y(n26) );
  AOI22X1 U25 ( .A(n28), .B(n29), .C(rollover_flag), .D(n1), .Y(n27) );
  NOR2X1 U27 ( .A(n31), .B(n32), .Y(n29) );
  NAND3X1 U28 ( .A(n33), .B(n34), .C(n35), .Y(n32) );
  XNOR2X1 U29 ( .A(rollover_val[6]), .B(N31), .Y(n35) );
  XNOR2X1 U30 ( .A(rollover_val[2]), .B(N27), .Y(n34) );
  XNOR2X1 U31 ( .A(rollover_val[8]), .B(N33), .Y(n33) );
  NAND3X1 U32 ( .A(n36), .B(n2), .C(n37), .Y(n31) );
  NOR2X1 U33 ( .A(clear), .B(N35), .Y(n37) );
  XNOR2X1 U34 ( .A(rollover_val[9]), .B(N34), .Y(n36) );
  NOR2X1 U35 ( .A(n38), .B(n39), .Y(n28) );
  NAND3X1 U36 ( .A(n40), .B(n41), .C(n42), .Y(n39) );
  XNOR2X1 U37 ( .A(rollover_val[5]), .B(N30), .Y(n42) );
  XNOR2X1 U38 ( .A(rollover_val[3]), .B(N28), .Y(n41) );
  XNOR2X1 U39 ( .A(rollover_val[7]), .B(N32), .Y(n40) );
  NAND3X1 U40 ( .A(n43), .B(n44), .C(n45), .Y(n38) );
  XNOR2X1 U41 ( .A(rollover_val[1]), .B(N26), .Y(n45) );
  XNOR2X1 U42 ( .A(rollover_val[0]), .B(N25), .Y(n44) );
  XNOR2X1 U43 ( .A(rollover_val[4]), .B(N29), .Y(n43) );
  NAND2X1 U45 ( .A(count_out[9]), .B(n64), .Y(n7) );
  NAND2X1 U47 ( .A(count_out[8]), .B(n64), .Y(n9) );
  NAND2X1 U49 ( .A(count_out[7]), .B(n64), .Y(n11) );
  NAND2X1 U51 ( .A(count_out[6]), .B(n64), .Y(n13) );
  NAND2X1 U53 ( .A(count_out[5]), .B(n64), .Y(n15) );
  NAND2X1 U55 ( .A(count_out[4]), .B(n64), .Y(n17) );
  NAND2X1 U57 ( .A(count_out[3]), .B(n64), .Y(n19) );
  NAND2X1 U59 ( .A(count_out[2]), .B(n64), .Y(n21) );
  NAND2X1 U61 ( .A(count_out[1]), .B(n64), .Y(n23) );
  NAND2X1 U63 ( .A(count_out[0]), .B(n64), .Y(n25) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_78 ( .A({1'b0, count_out}), .SUM(
        {N35, N34, N33, N32, N31, N30, N29, N28, N27, N26, N25}) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_1 add_68 ( .A({n63, n62, n61, n60, n59, 
        n48, n46, n30, n6, n5}), .SUM({N24, N23, N22, N21, N20, N19, N18, N17, 
        N16, N15}) );
  INVX2 U24 ( .A(n1), .Y(n2) );
  INVX2 U26 ( .A(count_enable), .Y(n1) );
  INVX2 U44 ( .A(n27), .Y(n4) );
  INVX2 U46 ( .A(n25), .Y(n5) );
  INVX2 U48 ( .A(n23), .Y(n6) );
  INVX2 U50 ( .A(n21), .Y(n30) );
  INVX2 U52 ( .A(n19), .Y(n46) );
  INVX2 U54 ( .A(n17), .Y(n48) );
  INVX2 U56 ( .A(n15), .Y(n59) );
  INVX2 U58 ( .A(n13), .Y(n60) );
  INVX2 U60 ( .A(n11), .Y(n61) );
  INVX2 U62 ( .A(n9), .Y(n62) );
  INVX2 U64 ( .A(n7), .Y(n63) );
  INVX2 U76 ( .A(clear), .Y(n64) );
endmodule


module counter ( clk, n_rst, cnt_up, clear, one_k_samples );
  input clk, n_rst, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 IX ( .clk(clk), .n_rst(n_rst), .clear(1'b0), 
        .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module magnitude_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[15]), .B(A[15]), .Y(SUM[15]) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n33, n34;

  OAI21X1 U18 ( .A(n1), .B(n9), .C(n17), .Y(out[9]) );
  NAND2X1 U19 ( .A(in[16]), .B(N27), .Y(n17) );
  OAI21X1 U20 ( .A(n1), .B(n10), .C(n18), .Y(out[8]) );
  NAND2X1 U21 ( .A(N26), .B(in[16]), .Y(n18) );
  OAI21X1 U22 ( .A(n1), .B(n11), .C(n19), .Y(out[7]) );
  NAND2X1 U23 ( .A(N25), .B(in[16]), .Y(n19) );
  OAI21X1 U24 ( .A(n1), .B(n12), .C(n20), .Y(out[6]) );
  NAND2X1 U25 ( .A(N24), .B(in[16]), .Y(n20) );
  OAI21X1 U26 ( .A(n1), .B(n13), .C(n21), .Y(out[5]) );
  NAND2X1 U27 ( .A(N23), .B(in[16]), .Y(n21) );
  OAI21X1 U28 ( .A(n1), .B(n14), .C(n22), .Y(out[4]) );
  NAND2X1 U29 ( .A(N22), .B(in[16]), .Y(n22) );
  OAI21X1 U30 ( .A(n1), .B(n15), .C(n23), .Y(out[3]) );
  NAND2X1 U31 ( .A(N21), .B(in[16]), .Y(n23) );
  OAI21X1 U32 ( .A(n1), .B(n16), .C(n24), .Y(out[2]) );
  NAND2X1 U33 ( .A(N20), .B(n1), .Y(n24) );
  OAI21X1 U34 ( .A(n1), .B(n33), .C(n25), .Y(out[1]) );
  NAND2X1 U35 ( .A(N19), .B(n1), .Y(n25) );
  OAI21X1 U36 ( .A(n1), .B(n3), .C(n26), .Y(out[15]) );
  NAND2X1 U37 ( .A(N33), .B(in[16]), .Y(n26) );
  OAI21X1 U38 ( .A(n1), .B(n4), .C(n27), .Y(out[14]) );
  NAND2X1 U39 ( .A(N32), .B(n1), .Y(n27) );
  OAI21X1 U40 ( .A(n1), .B(n5), .C(n28), .Y(out[13]) );
  NAND2X1 U41 ( .A(N31), .B(in[16]), .Y(n28) );
  OAI21X1 U42 ( .A(n1), .B(n6), .C(n29), .Y(out[12]) );
  NAND2X1 U43 ( .A(N30), .B(in[16]), .Y(n29) );
  OAI21X1 U44 ( .A(in[16]), .B(n7), .C(n30), .Y(out[11]) );
  NAND2X1 U45 ( .A(N29), .B(in[16]), .Y(n30) );
  OAI21X1 U46 ( .A(in[16]), .B(n8), .C(n31), .Y(out[10]) );
  NAND2X1 U47 ( .A(N28), .B(in[16]), .Y(n31) );
  OAI21X1 U48 ( .A(in[16]), .B(n34), .C(n32), .Y(out[0]) );
  NAND2X1 U49 ( .A(N18), .B(in[16]), .Y(n32) );
  magnitude_DW01_inc_0 add_45 ( .A({n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, 
        n13, n14, n15, n16, n33, n34}), .SUM({N33, N32, N31, N30, N29, N28, 
        N27, N26, N25, N24, N23, N22, N21, N20, N19, N18}) );
  INVX2 U2 ( .A(n2), .Y(n1) );
  INVX2 U3 ( .A(in[16]), .Y(n2) );
  INVX2 U4 ( .A(in[15]), .Y(n3) );
  INVX2 U5 ( .A(in[14]), .Y(n4) );
  INVX2 U6 ( .A(in[13]), .Y(n5) );
  INVX2 U7 ( .A(in[12]), .Y(n6) );
  INVX2 U8 ( .A(in[11]), .Y(n7) );
  INVX2 U9 ( .A(in[10]), .Y(n8) );
  INVX2 U10 ( .A(in[9]), .Y(n9) );
  INVX2 U11 ( .A(in[8]), .Y(n10) );
  INVX2 U12 ( .A(in[7]), .Y(n11) );
  INVX2 U13 ( .A(in[6]), .Y(n12) );
  INVX2 U14 ( .A(in[5]), .Y(n13) );
  INVX2 U15 ( .A(in[4]), .Y(n14) );
  INVX2 U16 ( .A(in[3]), .Y(n15) );
  INVX2 U17 ( .A(in[2]), .Y(n16) );
  INVX2 U50 ( .A(in[1]), .Y(n33) );
  INVX2 U51 ( .A(in[0]), .Y(n34) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, data_ready, 
        load_coeff, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, data_ready, load_coeff;
  output one_k_samples, modwait, err;
  wire   dr, lc, overflow, cnt_up, clear;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] outreg_data;

  sync_1 SYNCHRONIZE_DR ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), 
        .sync_out(dr) );
  sync_0 SYNCHRONIZE_LC ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), 
        .sync_out(lc) );
  controller SYSTEM_CONTROL_UNIT ( .clk(clk), .n_rst(n_reset), .dr(dr), .lc(lc), .overflow(overflow), .cnt_up(cnt_up), .clear(clear), .modwait(modwait), .op(
        op), .src1(src1), .src2(src2), .dest(dest), .err(err) );
  datapath DATAPATH ( .clk(clk), .n_reset(n_reset), .op(op), .src1(src1), 
        .src2(src2), .dest(dest), .ext_data1(sample_data), .ext_data2(
        fir_coefficient), .outreg_data(outreg_data), .overflow(overflow) );
  counter COUNTER ( .clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(clear), 
        .one_k_samples(one_k_samples) );
  magnitude MAGNITUDE ( .in(outreg_data), .out(fir_out) );
endmodule

