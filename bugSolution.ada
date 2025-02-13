```ada
function Add_Numbers (A, B : Integer) return Integer is
   Result : Integer;
begin
   if A > 0 and B > Integer'Last - A then
      raise Constraint_Error with "Overflow during addition";
   elsif A < 0 and B < Integer'First - A then
      raise Constraint_Error with "Underflow during addition";
   else
      Result := A + B;
   end if;
   return Result;
end Add_Numbers;

procedure Main is
   X : Integer := 10;
   Y : Integer := Integer'Last - 5;
   Z : Integer;
begin
   begin
      Z := Add_Numbers(X, Y);
      Ada.Text_IO.Put_Line("Sum: " & Integer'Image(Z));
   exception
      when Constraint_Error =>
         Ada.Text_IO.Put_Line("Error: Arithmetic overflow occurred.");
   end;
end Main;
```