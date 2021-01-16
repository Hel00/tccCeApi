# tccCeApi
Tiny C wrapper for cheat engine's lua

### Installation
 1. Download the [Tiny C compiler](http://download.savannah.gnu.org/releases/tinycc/)
 2. Unpack it anywhere
 3. Copy `tccApi.lua` to the autorun folder located in the Cheat Engine root directory
 4. Open `tccApi.lua` and change `"path\\to\\libtcc.dll"` in `autoAssemble("loadLibrary(path\\to\\libtcc.dll)")` to where you extracted Tiny C
example: `autoAssemble("loadLibrary(C:\\tcc\\libtcc.dll)")`
