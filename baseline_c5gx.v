module baseline_c5gx(
      ///////// CLOCK /////////
      input              CLOCK_125_p, ///LVDS

      ///////// HEX2 ///////// 1.2 V ///////
      output      [6:0]  HEX2,

      ///////// HEX3 ///////// 1.2 V ///////
      output      [6:0]  HEX3,			

      ///////// HEX0 /////////
      output      [6:0]  HEX0,

      ///////// HEX1 /////////
      output      [6:0]  HEX1,

      ///////// KEY ///////// 1.2 V ///////
      input       [3:0]  KEY,

      ///////// SW ///////// 1.2 V ///////
      input       [3:0]  SW
);

		reg [6:0] seven_seg_display_0;
		reg [6:0] seven_seg_display_1;
		reg [6:0] seven_seg_display_2;
		reg [6:0] seven_seg_display_3;
		reg [6:0] seven_seg;
		wire [3:0] switch;
		
		assign switch = SW [3:0];
		assign btn0 = !KEY[0];
		assign btn1 = !KEY[1];
		assign btn2 = !KEY[2];
		assign btn3 = !KEY[3];
		assign HEX0[6:0] = seven_seg_display_0;
		assign HEX1[6:0] = seven_seg_display_1;
		assign HEX2[6:0] = seven_seg_display_2;
		assign HEX3[6:0] = seven_seg_display_3;
		
		
		always @(*) begin
			case(switch)
			4'b0000 : seven_seg <= 7'b1000000;	//0
			4'b0001 : seven_seg <= 7'b1111001;	//1
			4'b0010 : seven_seg <= 7'b0100100;	//2
			4'b0011 : seven_seg <= 7'b0110000;	//3
			4'b0100 : seven_seg <= 7'b0011001;	//4
			4'b0101 : seven_seg <= 7'b0010010;	//5
			4'b0110 : seven_seg <= 7'b0000010;	//6
			4'b0111 : seven_seg <= 7'b1111000;	//7
			4'b1000 : seven_seg <= 7'b0000000;	//8
			4'b1001 : seven_seg <= 7'b0010000;	//9
			4'b1010 : seven_seg <= 7'b0001000;	//A
			4'b1011 : seven_seg <= 7'b0110001;	//B
			4'b1100 : seven_seg <= 7'b0110000;	//C
			4'b1101 : seven_seg <= 7'b1000010;	//D
			4'b1110 : seven_seg <= 7'b1100000;	//E
			4'b1111 : seven_seg <= 7'b1110000;	//F
			endcase
		end
		
		//1595
	always @ (posedge CLOCK_125_p) begin
		if(btn0) seven_seg_display_0 <= seven_seg;
		if(btn1) seven_seg_display_1 <= seven_seg;
		if(btn2) seven_seg_display_2 <= seven_seg;
		if(btn3) seven_seg_display_3 <= seven_seg;
		
		
		
/*		case(btn_counter)
		2'b00 : begin 
			seven_seg_display_0 <= seven_seg;
			btn_counter <= btn_counter + 1;
		end
		2'b01 : begin
			seven_seg_display_1 <= seven_seg;
			btn_counter <= btn_counter + 1;
		end
		2'b10 : begin
			seven_seg_display_2 <= seven_seg;
			btn_counter <= btn_counter + 1;
		end
		2'b11 : begin
			seven_seg_display_3 <= seven_seg;
			btn_counter <= btn_counter + 1;
		end
		endcase  */
		//end
	end

endmodule
