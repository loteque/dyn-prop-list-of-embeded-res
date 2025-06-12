@tool
class_name Database
extends Resource


@export var _data: Array[StructuredData]


func compile_data_dictionary() -> Dictionary:
    var data = {}
    for item in _data:
        var key = str(item._id)
        data.merge({key: item})
    return data


func get_data(data_index: int = -1) -> Array[StructuredData]:
    var data
    if data_index >= 0 and _data.size() > data_index:
        data = _data[data_index]
    else:
        data = _data
        
    return data


func get_data_as_dictionary() -> Dictionary:
    return compile_data_dictionary()