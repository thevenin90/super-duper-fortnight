extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var mySprite:Sprite = get_node("sprPot01")
onready var potBroken = preload("res://Sprites/Items/TEST Pot Broken.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_areaPot01_body_entered(body):
	print (body.name)
	print (body.layers)
	if body.layers & 2 > 0:
		print ("damage")
		mySprite.texture = potBroken
	#if body.name == "kinSword"
	
	pass # Replace with function body.
