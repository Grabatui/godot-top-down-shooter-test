extends CharacterBody2D


const SPEED = 300.0
const ADDITIONAL_BORDER = 10.0


@onready var player_sprite: Sprite2D = $PlayerShip3Blue


var player_size: Vector2
var left_border: float
var right_border: float


func _ready():
	player_size = player_sprite.texture.get_size()
	left_border = (player_size.x / 2) + ADDITIONAL_BORDER
	right_border = (ProjectSettings.get('display/window/size/viewport_width') - (player_size.x / 2)) - ADDITIONAL_BORDER


func _physics_process(_delta):
	var mouse_position: Vector2 = get_global_mouse_position()

	position.x = min(max(left_border, mouse_position.x), right_border)

	move_and_slide()
