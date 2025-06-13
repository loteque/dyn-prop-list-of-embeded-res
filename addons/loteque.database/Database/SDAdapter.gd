@tool
extends Resource
class_name SDAdapter


var _hint_string: String = ""
func compile_hint_string_from_keys(keys) -> String:
    var string = ""
    for k in keys:
        string += k + ","
    return string.substr( 0, string.length() - 1)


var _data: Dictionary
var db: SDDatabase:
    set(d):
        db = d
        if db:
            _data = db.get_data_as_dictionary()
        notify_property_list_changed()


var value_property_list: Array[Dictionary]
var value: SDClass
var key:
    set(v):
        key = v
        notify_property_list_changed()
        value = _data.get(key)


func _set(property: StringName, value: Variant) -> bool:
    var ok = false
    if !value_property_list:
        return ok
    for data_prop in value_property_list:
        if property == data_prop["name"]:
            _data[key][property] = value
            ok = true
    return ok


func _get(property: StringName) -> Variant:
    if !value_property_list:
        return null
    for data_prop in value_property_list:
        if property == data_prop["name"]:
            return _data[key][property]
    return null


func get_data_props_by_key(key: Variant) -> Array[Dictionary]:
    var script := _data[key].get_script() as Script
    var properties: Array[Dictionary] = []
    for property in script.get_script_property_list():
        if property["type"] == TYPE_NIL:
            continue
        property["usage"] = PROPERTY_USAGE_DEFAULT
        properties.append(property)
    return properties


func _get_property_list():
    var properties: Array[Dictionary] = []
    
    if !db:
        return properties

    _hint_string = compile_hint_string_from_keys(_data.keys())
    properties.append({
        "name": "key",
        "type": TYPE_STRING,
        "hint": PROPERTY_HINT_ENUM,
        "hint_string": _hint_string,    
    })

    if !key:
        return properties
    
    value_property_list = get_data_props_by_key(key)
    properties.append_array(value_property_list)    

    return properties
