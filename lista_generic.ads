-- Pacote genérico para listas em Ada
generic
   type Item_Type is private;
package Generic_List is
   
   -- Tipo para representar uma lista
   type List is limited private;
   
   -- Procedimento para inicializar uma lista
   procedure Initialize(L : out List);
   
   -- Procedimento para adicionar um item à lista
   procedure Add_Item(L : in out List; Item : in Item_Type);
   
   -- Função para obter o tamanho da lista
   function Length(L : in List) return Natural;
   
   -- Procedimento para remover um item da lista
   procedure Remove_Item(L : in out List; Index : in Positive);
   
   -- Função para obter um item da lista
   function Get_Item(L : in List; Index : in Positive) return Item_Type;
   
   -- Procedimento para limpar a lista
   procedure Clear(L : in out List);
   
private
   Max_Size : constant := 100;
   type Item_Array is array (Positive range <>) of Item_Type;
   type List is record
      Items : Item_Array(1..Max_Size);
      Size  : Natural := 0;
   end record;
   
end Generic_List;