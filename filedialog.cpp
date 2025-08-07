#define HL_NAME(n) tinyfiledialogs_##n
#include <hl.h>

#include <tinyfiledialogs.h>

HL_PRIM vbyte* HL_NAME(save_file_dialog)(vbyte* title, vbyte* defaultPath, varray* filterPatterns, vbyte* filterDescription) {
    char* path = tinyfd_saveFileDialog((char*)title, (char*)defaultPath, filterPatterns->size, hl_aptr(filterPatterns, char*), (char*)filterDescription);
    return (vbyte*)path;
}
DEFINE_PRIM(_BYTES, save_file_dialog, _BYTES _BYTES _ARR _BYTES);

HL_PRIM vbyte* HL_NAME(open_file_dialog)(vbyte* title, vbyte* defaultPath, varray* filterPatterns, vbyte* filterDescription, bool allowMultiple) {
    char* path = tinyfd_openFileDialog((char*)title, (char*)defaultPath, filterPatterns->size, hl_aptr(filterPatterns, char*), (char*)filterDescription, allowMultiple);
    return (vbyte*)path;
}
DEFINE_PRIM(_BYTES, open_file_dialog, _BYTES _BYTES _ARR _BYTES _BOOL);
