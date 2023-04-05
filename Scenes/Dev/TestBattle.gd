extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var leftCombatant:StatBlock = get_node("Combatant1")
onready var rightCombatant:StatBlock = get_node("Combatant2")
onready var leftLblHp = get_node("Combatant1/HitPoints")
onready var rightLblHp = get_node("Combatant2/HitPoints")
onready var txtWindow = get_node("TextWindow/rtlTextBox")

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	var val:int = leftCombatant.HitPoints
	leftLblHp.text = "%d / %d" % [leftCombatant.HitPoints, leftCombatant.HitPointsMax]
	rightLblHp.text = "%d / %d" % [rightCombatant.HitPoints, rightCombatant.HitPointsMax]	
	
	pass

func testAttack():
	rightCombatant.HitPoints -= leftCombatant.Str
	txtWindow.text += "Left Attacks Right for %d \n" % [leftCombatant.Str]
	pass
