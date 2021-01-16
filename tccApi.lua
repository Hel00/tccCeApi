function initTcc()
  autoAssemble("loadLibrary(path\\to\\libtcc.dll)")
end

outputMemory     = 1
outputExe        = 2
outputDll        = 3
outputObj        = 4
outputPreprocess = 5

Tcc = {}

-- Creates new tcc state
function Tcc:new()
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.state = executeCodeEx(1, nil, "libtcc.tcc_new")
  return o
end

-- Deletes tcc state
function Tcc:delete()
  executeCodeEx(1, nil, "libtcc.tcc_delete", self.state)
end

-- Compiles C string but doesn't output it anywhere
function Tcc:compileString(buf)
  return executeCodeEx(1, nil, "libtcc.tcc_compile_string", self.state, buf)
end

-- Set where the compiled code will be outputted to
function Tcc:setOutputType(type)
  return executeCodeEx(1, nil, "libtcc.tcc_set_output_type", self.state, type)
end

-- Allocate code to address, works only with `outputMemory`
function Tcc:relocate(ptr)
  return executeCodeEx(1, nil, "libtcc.tcc_relocate", self.state, ptr)
end

-- Returns symbol from compiled c code
function Tcc:getSymbol(name)
  return executeCodeEx(1, nil, "libtcc.tcc_get_symbol", self.state, name)
end

-- Sets flags
function Tcc:setOptions(str)
  return executeCodeEx(1, nil, "libtcc.tcc_set_options", self.state, str)
end

-- Defines symbol
function Tcc:defineSymbol(sym, value)
  executeCodeEx(1, nil, "libtcc.tcc_define_symbol", self.state, sym, value)
end

-- Undefines symbol
function Tcc:undefineSymbol(sym)
  executeCodeEx(1, nil, "libtcc.tcc_undefine_symbol", self.state, sym)
end

-- Sets lib folder path (`-L` flag)
function Tcc:setLibPath(path)
  executeCodeEx(1, nil, "libtcc.tcc_set_lib_path", self.state, path)
end

-- Sets header folder path (`-I` flag)
function Tcc:addIncludePath(pathname)
  executeCodeEx(1, nil, "libtcc.tcc_add_include_path", self.state, pathname)
end

function Tcc:setErrorFunc(opaque, error_func)
  executeCodeEx(1, nil, "libtcc.tcc_set_error_func", self.state, opaque, error_func)
end

function Tcc:addSysincludePath(pathname)
  executeCodeEx(1, nil, "libtcc.tcc_add_sysinclude_path", self.state, pathname)
end

-- Adds file to be compiled
function Tcc:addFile(filename)
  executeCodeEx(1, nil, "libtcc.tcc_add_file", self.state, filename)
end

-- I don't know how this differs from `setLibPath`
function Tcc:addLibraryPath(pathname)
  executeCodeEx(1, nil, "libtcc.tcc_add_library_path", self.state, pathname)
end

-- Link library
function Tcc:addLibrary(libraryname)
  executeCodeEx(1, nil, "libtcc.tcc_add_library", self.state, libraryname)
end

function addSymbol(name, val)
  return executeCodeEx(1, nil, "libtcc.tcc_add_symbol", self.state, name, val)
end

-- File name if using outputExe, outputDll or outputObj
function Tcc:outputFile(filename)
  executeCodeEx(1, nil, "libtcc.tcc_output_file", self.state, filename)
end

function Tcc:run(argc, argv)
  return executeCodeEx(1, nil, "libtcc.tcc_run", self.state, argc, argv)
end
