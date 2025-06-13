@tool
extends Resource
class_name SDDatabase

@export var _data: Array[SDClass]


func _compile_data_dictionary() -> Dictionary:
    var data = {}
    for item in _data:
        var key = str(item._id)
        data.merge({key: item})
    return data


func get_data(data_index: int = -1) -> Array[SDClass]:
    var data: Array[SDClass] = []
    if data_index >= 0 and _data.size() < data_index:
        push_warning("Index out of bounds")
    if data_index >= 0:
        data.append(_data[data_index])
    else:
        data = _data    
    return data
    

func get_data_as_dictionary() -> Dictionary:
    return _compile_data_dictionary()