program LR4;
uses
  SysUtils;

{$APPTYPE CONSOLE}
const n=20;      //number of characters

type
   TMAS=array[1..n] of integer;

procedure intArr( var M:TMAS);   //array definition
 var i:Integer;
  begin
    Randomize;
     for i:=1 to n do
      begin
        M[i]:=Random(5);
       write(M[i]:4);
      end;
      Writeln;
  end;

function Simetria(N,i,j:Integer; A:TMAS):boolean; //determine whether the array is symmetric about its midpoint
 var k,t:Integer;
   begin
     t:=0;
     Simetria:=true; 
     for k:=1 to N div 2 do
      begin
        if A[i+t]<>A[j-t] then
         begin
           Simetria:=False;
           break;
         end;
         t:=t+1;
      end;
   end;



 var  B :TMAS;
     i,j,bord1,bord2,Length,max,k :Integer;

BEGIN
  intArr(B);
  max:=0;
 for i:=1 to n-1 do        //first board
  for j:=n downto i+1 do   //second board
   begin
     length:=j-i+1;
     if length<=max then Break;
     if Simetria(length,i,j,B) then  //change of the maximum polindrome value
      begin
        max:=length;
        bord1:=i;
        bord2:=j;
        break;
      end;
   end;

 writeln('Longest segment');
   for k:=bord1 to bord2 do
     write(B[k],' ');
 writeln;
 writeln('Length ',max);
 readln;
END.
