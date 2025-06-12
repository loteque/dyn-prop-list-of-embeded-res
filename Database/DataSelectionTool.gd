@tool
class_name DataSelectionTool
extends Resource

var _hint_string: String = ""
func compile_hint_string_from_keys(keys) -> String:
    var string = ""
    for k in keys:
        string += k + ","
    return string.substr( 0, string.length() - 1)


var _data: Dictionary
@export var db: Database:
    set(d):
        db = d
        if db:
            _data = db.compile_data()
        notify_property_list_changed()


var value: StructuredData
var key:
    set(v):
        key = v
        notify_property_list_changed()
        value = _data.get(key)


func _get_property_list():
    var properties = []
    
    if db:
        print(_data.get(key))
        _hint_string = compile_hint_string_from_keys(_data.keys())
    else:
        properties.append({})
        return properties


    properties.append({
        "name": "key",
        "type": TYPE_STRING,
        "hint": PROPERTY_HINT_ENUM,
        "hint_string": _hint_string,    
    })
    properties.append({
        "name": "value",
        "type": TYPE_OBJECT,
        "hint": PROPERTY_HINT_RESOURCE_TYPE,
        "hint_string": "StructuredData",
    })

    return properties