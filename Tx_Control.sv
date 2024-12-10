`timescale 1ns / 1ps

module Tx_Control(
    input logic clk,
    input logic reset_n,
    input logic startBTNC,
    input logic COUNT,
    output logic TX_load
    );
    
    
typedef enum logic [1:0] {
        IDLE,
        transmit
        
    } state_t;
    
        state_t current_state, next_state;
        
        
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end
    
  
    
    always_comb begin
        case (current_state)
        
        IDLE: begin if(startBTNC ==1) 
                    next_state = transmit;    
                    else 
                    next_state = IDLE;
                end
        transmit: begin  if(~COUNT) 
                    next_state = IDLE;
                   else 
                      next_state = transmit; 
                end 
                
            default: next_state = IDLE;
        endcase
    end
    
    
         always_comb begin
                case (current_state)
                    IDLE: begin
                        TX_load =0;
                    end
                    
                    transmit: begin
                        TX_load=1;
                    end
                    
                    default:  TX_load = 0;
                endcase
            end
            
            
endmodule
    
        
