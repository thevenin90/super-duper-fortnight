class_name PlayerActor
extends CharacterBody2D
@onready var sprite: AnimatedSprite2D = get_node("CharacterSprite")
#onready var textVel : RichTextLabel = get_node("../velocityText")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
@export var SpeedMax:float = 200.0
@export var SpeedAcc:float = 10.0
@export var SpeedDecel: float = 0.05

#var velX:float = 0.0
#var velY:float = 0.0

var vel:Vector2 = Vector2()

enum Facing {up, down, left, right}
var f = Facing.right
var isJumping = false
var isAttacking = false
var isStartAttack = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play("Standing")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	pass

func get_input(_delta:float ):
	vel = Vector2()
	isStartAttack = false 
	
	#textVel.text += "velocity.x: " + str(velocity.x)
	#textVel.text += "\nabs(velocity.x): " + str(abs(velocity.x))
	#textVel.text += "\ndelta: " + str(delta)
	#textVel.text += "\n(SpeedDecel*delta): " + str((SpeedDecel*delta))
	#textVel.text += "\nabs(velocity.x)/SpeedMax^2: " + str(abs(velocity.x)/(SpeedMax*SpeedMax))
	#textVel.text += "\nabs(velocity.x)-SpeedMax: " + str(abs(velocity.x)-SpeedMax)
	#textVel.text += "\npow(abs(velocity.x),(abs(velocity.x)-SpeedMax)): " + str(pow(abs(velocity.x), (abs(velocity.x)-SpeedMax)))
	
	if Input.is_action_pressed('control_right'):
		#velocity.x += SpeedAcc * delta #1
		vel.x = SpeedMax
		f = Facing.right
		sprite.flip_h = false
		#sprite.rotation = deg2rad(90)
	elif Input.is_action_pressed('control_left'):
		#velocity.x -= SpeedAcc * delta #1
		vel.x = SpeedMax * -1.0
		f = Facing.left
		sprite.flip_h = true
		#sprite.scale.
		#sprite.rotation = deg2rad(270)
	#elif velocity.x == 0:
	#	pass
	#else:
		#velocity.x += abs(velocity.x * velocity.x) - (SpeedDecel * delta) / (1 + velocity.x)
		#velocity.x *= abs(velocity.x) / (abs(velocity.x) + (SpeedDecel*(velocity.x/SpeedMax) ))
	#if velocity.x != 0:
	#	velocity.x *= abs(velocity.x) / (abs(velocity.x) + SpeedDecel + pow(abs(velocity.x), (abs(velocity.x)-SpeedMax) ))
		#velocity.x = velocity.x * (abs(velocity.x) / (abs(velocity.x) + pow(SpeedMax, -1*velocity.x)))
		
	if Input.is_action_pressed('control_down'):
		#velocity.y += SpeedAcc * delta #1
		vel.y = SpeedMax
		#f = Facing.down
		#sprite.rotation = deg2rad(180)
	elif Input.is_action_pressed('control_up'):
		#velocity.y -= SpeedAcc * delta #1
		vel.y = -1.0 * SpeedMax
		#f = Facing.up
		#sprite.rotation = deg2rad(0)
	#else:
	#	velocity.y = abs(velocity.y) / (abs(velocity.y) + (SpeedDecel * delta))
	
	velocity = vel.normalized() * SpeedMax
	var vx = velocity.x
	var vy = velocity.y
	
	
	if Input.is_action_pressed("attack_main"):
		isStartAttack = true


func _physics_process(delta):
	#if  not Global.isPlayerActive:
	#	return
	#textVel.text = ""
	get_input(delta)
	#textVel.text += "\nX: " + str(velocity.x) + "\nY: " + str(velocity.y)
	var v1 = velocity
	move_and_slide()
	var v2 = velocity
	set_animation()
	
func set_animation():
	
	if isStartAttack && !isAttacking:
		isAttacking = true
		if f == Facing.right:
			$AnimationPlayer.play("animAttack")
		else :
			$AnimationPlayer.play("animAttack_L")
	
	if isAttacking:
		return 
	
	var vx = velocity.x
	var vy = velocity.y
	
	if velocity == Vector2(0,0):
		if sprite.animation != "Standing":
			sprite.animation = "Standing"
			#var x = sprite.is_playing()
			
	else:
		if sprite.animation != "Walking":
			sprite.animation = "Walking"
	pass


func _on_CharacterSprite_animation_finished():
	#if $CharacterSprite.animation == "Atacking":
	#	$CharacterSprite.animation == "Standing"
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "animAttack":
		isAttacking = false
	if anim_name == "animAttack_L":
		isAttacking = false
	pass # Replace with function body.
