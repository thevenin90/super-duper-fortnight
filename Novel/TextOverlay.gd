extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
@onready var display = get_node("TextDisplay")

# Called when the node enters the scene tree for the first time.
func _ready():
	display.clear()
	display.text = "asdf"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
