extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var midi_player:MidiPlayer
@onready var sprLoading:AnimatedSprite2D = get_node("spriteLoading")

# Called when the node enters the scene tree for the first time.
func _ready():
	#sprLoading.visible = true
	#midi_player =  # get_node("MidiPlayer")
	#midi_player.play()
	#sprLoading.visible = false
	sprLoading.play("default", 1.0, true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
