extends Control

@export var button_texture_region : PackedScene
@export var keyboard_texture_dictionary : Dictionary = {"Escape": Rect2(289,136,16,16),
														"F1": Rect2(306,136,16,16),
														"F2": Rect2(323,136,16,16),
														"F3": Rect2(340,136,16,16),
														"F4": Rect2(357,136,16,16),
														"F5": Rect2(374,136,16,16),
														"F6": Rect2(391,136,16,16),
														"F7": Rect2(408,136,16,16),
														"F8": Rect2(425,136,16,16),
														"F9": Rect2(442,136,16,16),
														"F10": Rect2(459,136,16,16),
														"F11": Rect2(476,136,16,16),
														"F12": Rect2(493,136,16,16),
														"Print": Rect2(357,255,32,16),
														"Insert": Rect2(323,255,32,16),
														"Delete": Rect2(357,221,32,16),
														"Kp Multiply": Rect2(527,187,16,16),
														"Kp Divide": Rect2(493,204,16,16),
														"QuoteLeft": Rect2(510,136,16,16),
														"1": Rect2(289,153,16,16),
														"2": Rect2(306,153,16,16),
														"3": Rect2(323,153,16,16),
														"4": Rect2(340,153,16,16),
														"5": Rect2(357,153,16,16),
														"6": Rect2(374,153,16,16),
														"7": Rect2(391,153,16,16),
														"8": Rect2(408,153,16,16),
														"9": Rect2(425,153,16,16),
														"0": Rect2(442,153,16,16),
														"Minus": Rect2(459,153,16,16),
														"Equal": Rect2(493,153,16,16),
														"Backspace": Rect2(544,153,32,16),
														"Kp Add": Rect2(476,153,16,16),
														"Kp Subtract": Rect2(459,153,16,16),
														"NumLock": Rect2(425,221,32,16),
														"Tab": Rect2(323,221,32,16),
														"Q": Rect2(289,170,16,16),
														"W": Rect2(306,170,16,16),
														"E": Rect2(323,170,16,16),
														"R": Rect2(340,170,16,16),
														"T": Rect2(357,170,16,16),
														"Y": Rect2(374,170,16,16),
														"U": Rect2(391,170,16,16),
														"I": Rect2(408,170,16,16),
														"O": Rect2(425,170,16,16),
														"P": Rect2(442,170,16,16),
														"BracketLeft": Rect2(459,170,16,16),
														"BracketRight": Rect2(476,170,16,16),
														"BackSlash": Rect2(527,170,16,16),
														"Kp 7": Rect2(391,153,16,16),
														"Kp 8": Rect2(408,153,16,16),
														"Kp 9": Rect2(425,153,16,16),
														"CapsLock": Rect2(323,238,32,16),
														"A": Rect2(306,187,16,16),
														"S": Rect2(323,187,16,16),
														"D": Rect2(340,187,16,16),
														"F": Rect2(357,187,16,16),
														"G": Rect2(374,187,16,16),
														"H": Rect2(391,187,16,16),
														"J": Rect2(408,187,16,16),
														"K": Rect2(425,187,16,16),
														"L": Rect2(442,187,16,16),
														"Semicolon": Rect2(510,187,16,16),
														"Apostrophe": Rect2(459,187,16,16),
														"Enter": Rect2(544,187,32,16),
														"Kp 4": Rect2(340,153,16,16),
														"Kp 5": Rect2(357,153,16,16),
														"Kp 6": Rect2(374,153,16,16),
														"Shift": Rect2(289,255,32,16),
														"Z": Rect2(323,204,16,16),
														"X": Rect2(340,204,16,16),
														"C": Rect2(357,204,16,16),
														"V": Rect2(374,204,16,16),
														"B": Rect2(391,204,16,16),
														"N": Rect2(408,204,16,16),
														"M": Rect2(425,204,16,16),
														"Comma": Rect2(459,238,16,16),
														"Period": Rect2(459,221,16,16),
														"Slash": Rect2(493,204,16,16),
														"Kp 1": Rect2(289,153,16,16),
														"Kp 2": Rect2(306,153,16,16),
														"Kp 3": Rect2(323,153,16,16),
														"Kp 0": Rect2(442,153,16,16),
														"Kp Period": Rect2(459,221,16,16),
														"Ctrl": Rect2(289,238,32,16),
														"Windows": Rect2(306,204,16,16),
														"Alt": Rect2(289,221,32,16),
														"Space": Rect2(527,238,50,16),
														"Section": Rect2(527,170,16,16),
														"Up": Rect2(510,204,16,16),
														"Down": Rect2(544,204,16,16),
														"Left": Rect2(561,204,16,16),
														"Right": Rect2(527,204,16,16),
														"Left Button": Rect2(153,51,16,16),
														"Right Button": Rect2(170,51,16,16),
														"Kp Enter": Rect2(544,187,32,16)}
@export var xbox_texture_dictionary : Dictionary = {"LS": Rect2(136,221,16,16),
													"RS": Rect2(136,255,16,16),
													"A": Rect2(221,17,16,16),
													"B": Rect2(238,17,16,16),
													"X": Rect2(255,17,16,16),
													"Y": Rect2(272,17,16,16),
													"RT": Rect2(238,289,16,16),
													"LT": Rect2(221,289,16,16),
													"RB": Rect2(170,289,16,16),
													"LB": Rect2(153,289,16,16),
													"Menu": Rect2(85,323,16,16),
													"L3": Rect2(272,221,16,16),
													"R3": Rect2(272,255,16,16),
													"D-Pad Down": Rect2(51,33,16,16),
													"D-Pad Up": Rect2(17,33,16,16),
													"D-Pad Left": Rect2(68,33,16,16),
													"D-Pad Right": Rect2(34,33,16,16),
													"Back": Rect2(68,323,16,16)}
@export var playstation_texture_dictionary : Dictionary =  {"LS": Rect2(136,221,16,16),
															"RS": Rect2(136,255,16,16),
															"Square": Rect2(357,289,16,16),
															"Circle": Rect2(323,289,16,16),
															"X": Rect2(391,289,16,16),
															"Triangle": Rect2(289,289,16,16),
															"R2": Rect2(306,323,16,16),
															"L2": Rect2(289,323,16,16),
															"R1": Rect2(408,323,16,16),
															"L1": Rect2(391,323,16,16),
															"Start": Rect2(357,357,16,16),
															"L3": Rect2(272,221,16,16),
															"R3": Rect2(272,255,16,16),
															"D-Pad Down": Rect2(51,135,16,16),
															"D-Pad Up": Rect2(17,135,16,16),
															"D-Pad Left": Rect2(68,135,16,16),
															"D-Pad Right": Rect2(34,135,16,16),
															"20": Rect2(391,357,16,16),
															"Select": Rect2(340,357,16,16)}

@onready var audio_streamer = $AudioStreamPlayer2D

var controller_name = null
var button_click_sfx = preload("res://assets/sounds/Click sound 1.wav")
var button_hover_sfx = preload("res://assets/sounds/Hover over button sound 1.wav")

func _ready() -> void:
	set_button_textures("keyboard")
	
func focus() -> void:
	$Panel/MarginContainer/Button.grab_focus()
	
func set_button_textures(input_device : String):
	if input_device == "keyboard":
		$Panel/MarginContainer/VBoxContainer2/Move2/Sprite2D.region_rect = keyboard_texture_dictionary.get("A")
		$Panel/MarginContainer/VBoxContainer2/Move2/Sprite2D2.region_rect = keyboard_texture_dictionary.get("D")
		$Panel/MarginContainer/VBoxContainer2/Move2/Sprite2D3.visible = false
		$Panel/MarginContainer/VBoxContainer2/Jump2/Sprite2D3.region_rect = keyboard_texture_dictionary.get("W")
		$Panel/MarginContainer/VBoxContainer2/Jump2/Sprite2D4.visible = true
		$Panel/MarginContainer/VBoxContainer2/Jump2/Sprite2D4.region_rect = keyboard_texture_dictionary.get("Space")
		$Panel/MarginContainer/VBoxContainer2/Teleport2/Sprite2D4.region_rect = keyboard_texture_dictionary.get("Left Button")
	elif controller_name.contains("x") or controller_name.contains("X"):
		$Panel/MarginContainer/VBoxContainer2/Move2/Sprite2D.region_rect = xbox_texture_dictionary.get("D-Pad Left")
		$Panel/MarginContainer/VBoxContainer2/Move2/Sprite2D2.region_rect = xbox_texture_dictionary.get("D-Pad Right")
		$Panel/MarginContainer/VBoxContainer2/Move2/Sprite2D3.visible = true
		$Panel/MarginContainer/VBoxContainer2/Move2/Sprite2D3.region_rect = xbox_texture_dictionary.get("LS")
		$Panel/MarginContainer/VBoxContainer2/Jump2/Sprite2D3.region_rect = xbox_texture_dictionary.get("A")
		$Panel/MarginContainer/VBoxContainer2/Jump2/Sprite2D4.visible = false
		$Panel/MarginContainer/VBoxContainer2/Teleport2/Sprite2D4.region_rect = xbox_texture_dictionary.get("RT")
	elif controller_name.contains("ps") or controller_name.contains("PS"):
		$Panel/MarginContainer/VBoxContainer2/Move2/Sprite2D.region_rect = playstation_texture_dictionary.get("D-Pad Left")
		$Panel/MarginContainer/VBoxContainer2/Move2/Sprite2D2.region_rect = playstation_texture_dictionary.get("D-Pad Right")
		$Panel/MarginContainer/VBoxContainer2/Move2/Sprite2D3.visible = true
		$Panel/MarginContainer/VBoxContainer2/Move2/Sprite2D3.region_rect = playstation_texture_dictionary.get("LS")
		$Panel/MarginContainer/VBoxContainer2/Jump2/Sprite2D3.region_rect = playstation_texture_dictionary.get("X")
		$Panel/MarginContainer/VBoxContainer2/Jump2/Sprite2D4.visible = false
		$Panel/MarginContainer/VBoxContainer2/Teleport2/Sprite2D4.region_rect = playstation_texture_dictionary.get("r2")
	
func _input(event):
	if event is InputEventKey: set_button_textures("keyboard")
				
	elif event is InputEventJoypadButton:
		controller_name = Input.get_joy_name(0)
		set_button_textures("Controller")


func _on_button_pressed() -> void:
	play_button_click_sfx()
	get_parent().focus()
	queue_free()
	
func play_button_click_sfx() -> void:
	audio_streamer.stream = button_click_sfx
	audio_streamer.play()

func _on_entered() -> void:
	audio_streamer.stream = button_hover_sfx
	audio_streamer.play()
