-- Corpo do pacote genérico para listas em Ada
with Ada.Text_IO; use Ada.Text_IO;

generic
   type Item_Type is private;
package body Generic_List is
   
   procedure Initialize(L : out List) is
   begin
      L.Size := 0;
   end Initialize;
   
   procedure Add_Item(L : in out List; Item : in Item_Type) is
   begin
      if L.Size < Max_Size then
         L.Size := L.Size + 1;
         L.Items(L.Size) := Item;
      else
         Put_Line("Erro: Lista cheia!");
      end if;
   end Add_Item;
   
   function Length(L : in List) return Natural is
   begin
      return L.Size;
   end Length;
   
   procedure Remove_Item(L : in out List; Index : in Positive) is
   begin
      if Index <= L.Size then
         for I in Index .. L.Size - 1 loop
            L.Items(I) := L.Items(I + 1);
         end loop;
         L.Size := L.Size - 1;
      else
         Put_Line("Erro: Índice fora dos limites!");
      end if;
   end Remove_Item;
   
   function Get_Item(L : in List; Index : in Positive) return Item_Type is
   begin
      if Index <= L.Size then
         return L.Items(Index);
      else
         Put_Line("Erro: Índice fora dos limites!");
         -- Retorna um valor padrão (não é possível em Ada para tipos privados,
         -- então esta implementação teria que ser adaptada na instância do pacote)
         raise Constraint_Error;
      end if;
   end Get_Item;
   
   procedure Clear(L : in out List) is
   begin
      L.Size := 0;
   end Clear;
   
end Generic_List;