@tool
class_name Database
extends Resource


@export var _data: Array[StructuredData]


func compile_data() -> Dictionary:
    var data = {}
    for item in _data:
        var key = str(item._id)
        data.merge({key: item})
    return data


func get_data() -> Dictionary:
    return compile_data()