module fsm_lamp(clock,light);

     input clock;
     output reg[2:0] light;
     parameter state0=0,state1=1,state2=2;
     parameter red=3'b100,green=3'b010,yellow=3'b001;
     reg [0:1] state;
     always @(posedge clock or state)
     begin
          case(state)
          state0: 
              begin
                state=state1;
                light<=green;
               end
          state1:
              begin
                state=state2;
                light<=yellow;
              end
          state2:
             begin
                state=state0;
                light<=red;
             end
          default:
              begin
                state=state0;
                light<=red;
              end
         endcase
       end
endmodule