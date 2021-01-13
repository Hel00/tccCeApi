-- Tcc - Tiny C Compiler

-- Injects the compiler dll
initTcc()

-- Creates a tcc state, you need this to do anything
local tcc = Tcc:new()

-- Outputs generate code into memory instead of exe or dll
tcc:setOutputType(outputMemory)

-- What do you think this does
tcc:compileString([[
int addInt(int a, int b)
{
  return a + b;
}
]])

-- Writes compiled code at given address
-- in this case main is just 2k
-- uninitialized bytes i allocated
-- somewhere in memory
tcc:relocate(getAddress("main"))

-- `getSymbol` returns address of a given symbol
local addInt = tcc:getSymbol('addInt')

-- Deletes tcc state
tcc:delete()

print("Address of addInt: ", addInt)
print("- - - - - - - - - -")
print( "Return value of addInt: ", executeCodeEx(1, nil, addInt, 1, 2) )
