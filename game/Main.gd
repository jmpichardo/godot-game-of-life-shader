extends Control

onready var SimulationTexture : TextureRect = $SimulationViewport/SimulationTexture
onready var SimulationViewport : Viewport = $SimulationViewport
onready var OutputViewport : Viewport = $OutputViewport
onready var RenderTexture : TextureRect = $RenderTexture

var running : bool = false
var texture_updated : bool = false
var imgTex : ImageTexture = ImageTexture.new()


func _process(delta : float) -> void:
	if running and !texture_updated:
		update_texture()
	
	if texture_updated:
		texture_updated = false


func update_texture() -> void:
	var img := OutputViewport.get_texture().get_data()
	imgTex.create_from_image(img)
	SimulationTexture.set_texture(imgTex)


func _input(event : InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == BUTTON_LEFT:
			paint()


func paint() -> void:
	texture_updated = true
	
	var screen_size := get_viewport().get_visible_rect().size
	var viewport_size := OutputViewport.size
	var current_pixel := get_local_mouse_position() * viewport_size / screen_size
	
	var img := SimulationTexture.get_texture().get_data()
	img.lock()
	img.set_pixel(int(current_pixel.x), int(current_pixel.y), Color(1.0, 0.0, 0.0))
	img.set_pixel(int(current_pixel.x) + 1, int(current_pixel.y), Color(1.0, 0.0, 0.0))
	img.set_pixel(int(current_pixel.x), int(current_pixel.y) + 1, Color(1.0, 0.0, 0.0))
	img.set_pixel(int(current_pixel.x) + 1, int(current_pixel.y) + 1, Color(1.0, 0.0, 0.0))
	img.unlock()
	imgTex.create_from_image(img)
	SimulationTexture.set_texture(imgTex)


func _on_ButtonStart_pressed():
	running = true


func _on_ButtonPause_pressed():
	running = false


func _on_ButtonNext_pressed():
	update_texture()
