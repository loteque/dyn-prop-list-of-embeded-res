@tool
extends Node

@export var circle_buildable : SDBuildable:
    set(cb):
        circle_buildable = cb
        notify_property_list_changed()

@export var rectangle_buildable : SDBuildable:
        set(rb):
            rectangle_buildable = rb
            notify_property_list_changed()
	
