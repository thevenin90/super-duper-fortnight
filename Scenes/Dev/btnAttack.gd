extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var nodeMaster = get_node("..")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "_button_pressed")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _button_pressed():
	nodeMaster.testAttack()
	pass
