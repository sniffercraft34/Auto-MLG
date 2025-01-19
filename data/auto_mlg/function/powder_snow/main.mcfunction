# Tag the player with the necessary tags and remove them too
execute as @s if predicate auto_mlg:mainhand_powder_snow if entity @s[x_rotation=80..90] if block ~ ~-5 ~ #auto_mlg:air run tag @s add auto_powder_snow_mlg.enable
execute as @s if predicate auto_mlg:mainhand_powder_snow unless entity @s[x_rotation=80..90] run tag @s remove auto_powder_snow_mlg.enable
execute as @s unless predicate auto_mlg:mainhand_powder_snow run tag @s remove auto_powder_snow_mlg.enable

# Ensure they don't take damage
execute as @s if predicate auto_mlg:mainhand_powder_snow if entity @s[tag=auto_powder_snow_mlg.enable,tag=!powderSnowMLGDisable,gamemode=survival] if block ~ ~-1 ~ #auto_mlg:air unless block ~ ~-4 ~ #auto_mlg:air run tp @s ~ ~-1 ~

# Playsound to mimic placing and falling
execute as @s if predicate auto_mlg:mainhand_powder_snow if entity @s[tag=auto_powder_snow_mlg.enable,tag=!powderSnowMLGDisable,gamemode=survival] unless block ~ ~-1 ~ #auto_mlg:air run playsound item.bucket.empty_powder_snow player @s
execute as @s if predicate auto_mlg:mainhand_powder_snow if entity @s[tag=auto_powder_snow_mlg.enable,tag=!powderSnowMLGDisable,gamemode=survival] unless block ~ ~-1 ~ #auto_mlg:air run playsound block.powder_snow.fall player @s

# Set the powder snow down
execute as @s if predicate auto_mlg:mainhand_powder_snow if entity @s[tag=auto_powder_snow_mlg.enable,tag=!powderSnowMLGDisable,gamemode=survival] unless block ~ ~-1 ~ #auto_mlg:air run fill ~ ~ ~ ~ ~ ~ powder_snow replace #auto_mlg:air

# Replace powder snow bucket
execute as @s if predicate auto_mlg:mainhand_powder_snow if entity @s[tag=auto_powder_snow_mlg.enable,tag=!powderSnowMLGDisable,gamemode=survival] unless block ~ ~-1 ~ #auto_mlg:air run item replace entity @s weapon.mainhand with bucket

# Slow falling for higher distances
execute as @s if predicate auto_mlg:mainhand_powder_snow if entity @s[tag=auto_powder_snow_mlg.enable,tag=!powderSnowMLGDisable,gamemode=survival] if block ~ ~-1 ~ #auto_mlg:air unless block ~ ~-4 ~ #auto_mlg:air run effect give @s slow_falling 1 0 true

