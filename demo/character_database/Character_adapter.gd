@tool
extends SDAdapter
class_name CharacterAdapter

var db_path: String = "res://demo/character_database/Character_database.tres"

func _init(dbinit: SDDatabase = load(db_path)) -> void:
    self.db = dbinit
    # notify_property_list_changed()