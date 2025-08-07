package tinyfiledialogs;

@:hlNative("tinyfiledialogs")
class FileDialog {
    public static function saveFile(title:String, defaultPath:String, filterPatterns:Array<String>, filterDescription:String):String {
        var patterns = new hl.NativeArray(filterPatterns.length);
        for (i in 0...filterPatterns.length)
            patterns[i] = @:privateAccess filterPatterns[i].toUtf8();

        var path = _saveFileDialog(
            title != null ? @:privateAccess title.toUtf8() : null,
            defaultPath != null ? @:privateAccess defaultPath.toUtf8() : null,
            patterns,
            filterDescription != null ? @:privateAccess filterDescription.toUtf8() : null
        );
        return path != null ? @:privateAccess String.fromUTF8(path) : null;
    }

    public static function openFile(title:String, defaultPath:String, filterPatterns:Array<String>, filterDescription:String, allowMultiple:Bool):String {
        var patterns = new hl.NativeArray(filterPatterns.length);
        for (i in 0...filterPatterns.length)
            patterns[i] = @:privateAccess filterPatterns[i].toUtf8();

        var path = _openFileDialog(
            title != null ? @:privateAccess title.toUtf8() : null,
            defaultPath != null ? @:privateAccess defaultPath.toUtf8() : null,
            patterns,
            filterDescription != null ? @:privateAccess filterDescription.toUtf8() : null,
            allowMultiple
        );
        return path != null ? @:privateAccess String.fromUTF8(path) : null;
    }

    @:hlNative("tinyfiledialogs", "save_file_dialog") static function _saveFileDialog(title:hl.Bytes, defaultPath:hl.Bytes, filterPatterns:hl.NativeArray<hl.Bytes>, filterDescription:hl.Bytes):hl.Bytes return null;
    @:hlNative("tinyfiledialogs", "open_file_dialog") static function _openFileDialog(title:hl.Bytes, defaultPath:hl.Bytes, filterPatterns:hl.NativeArray<hl.Bytes>, filterDescription:hl.Bytes, allowMultiple:Bool):hl.Bytes return null;
}