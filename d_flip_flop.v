// Простой D-триггер с синхронным сбросом
module d_flip_flop (
    input  clk,
    input  rst_n, // Асинхронный сброс, активный уровень - низкий
    input  d,
    output reg q
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 1'b0;
        else
            q <= d;
    end

endmodule