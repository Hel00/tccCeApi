initTcc()

local tcc = Tcc:new()

tcc:setOutputType(outputMemory)

-- You need to add kernel32 and user32
-- for MessageBox to work
tcc:addLibrary("kernel32")
tcc:addLibrary("user32")

tcc:compileString([[
#include<windows.h>

int main()
{
  MessageBox(0, "Message", "Window Title", 1);
  return 0;
}
]])

-- Run passes argv and argc to main
-- pass 0, 0 if you don't wanna pass
-- anything to main
tcc:run(0, 0)

tcc:delete()
