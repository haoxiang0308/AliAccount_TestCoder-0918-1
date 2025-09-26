// Простой D-триггер с синхронным сбросом
module d_flip_flop (
    input  clk,
    input  rst_n, // Активный низкий уровень сброса
    input  d,
    output reg q
);

    always @(posedge clk) begin
        if (!rst_n) begin
            q <= 1'b0; // Сброс в 0
        end else begin
            q <= d;    // Запоминание значения D
        end
    end

endmodule