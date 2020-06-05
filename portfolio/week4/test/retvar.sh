#!/bin/bash



Return_variable ()
{
return $1
}

Return_variable2 ()
{
local Ret=$1
let "Ret = Ret - 5"
return $Ret
}

Return_variable 25
Var1=$?
Var2=$? 
echo "Var1 = " $Var1
echo "Var2 = " $Var2

Return_variable2 20
Var3=$?
echo "Can we see the local variable?" $Ret
echo "Var3 =" $Var3
