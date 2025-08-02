extends Node2D

const TELEPORTER_ACTIVATE = preload("res://assets/Sprites/Teleporter/TeleporterActivate.png")
const TELEPORTER_IDLE = preload("res://assets/Sprites/Teleporter/TeleporterIdle.png")

@onready var portal_base: Sprite2D = $PortalBase
