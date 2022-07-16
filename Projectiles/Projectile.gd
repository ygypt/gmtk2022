extends Entity
class_name Projectile

# A PROJECTILE IS A STRAIGHT UP ENTITY, WITH SOME BONUS STATS LIKE THE DMG IT
# DEALS AND A POINTER TO THE ENTITY THAT SHOT IT

var shooter : Entity

export var dmg := 1
