# Tag the player with the necessary tags and remove them too
execute as @s if predicate auto_mlg:mainhand_water if entity @s[x_rotation=80..90] if block ~ ~-5 ~ #auto_mlg:air run tag @s add auto_water_mlg.enable
execute as @s if predicate auto_mlg:mainhand_water unless entity @s[x_rotation=80..90] run tag @s remove auto_water_mlg.enable
execute as @s unless predicate auto_mlg:mainhand_water run tag @s remove auto_water_mlg.enable

# Ensure they don't take damage
execute as @s if predicate auto_mlg:mainhand_water if entity @s[tag=auto_water_mlg.enable,tag=!waterMLGDisable,gamemode=survival] if block ~ ~-1 ~ #auto_mlg:air unless block ~ ~-4 ~ #auto_mlg:air run tp @s ~ ~-1 ~

# Playsound to mimic placing and falling
execute as @s if predicate auto_mlg:mainhand_water if entity @s[tag=auto_water_mlg.enable,tag=!waterMLGDisable,gamemode=survival] unless block ~ ~-1 ~ #auto_mlg:air run playsound item.bucket.empty player @s
execute as @s if predicate auto_mlg:mainhand_water if entity @s[tag=auto_water_mlg.enable,tag=!waterMLGDisable,gamemode=survival] unless block ~ ~-1 ~ #auto_mlg:air run playsound entity.player.splash player @s

# Set the water down
execute as @s if predicate auto_mlg:mainhand_water if entity @s[tag=auto_water_mlg.enable,tag=!waterMLGDisable,gamemode=survival] unless block ~ ~-1 ~ #auto_mlg:air run fill ~ ~ ~ ~ ~ ~ water replace #auto_mlg:air

# Replace water bucket
execute as @s if predicate auto_mlg:mainhand_water if entity @s[tag=auto_water_mlg.enable,tag=!waterMLGDisable,gamemode=survival] unless block ~ ~-1 ~ #auto_mlg:air run item replace entity @s weapon.mainhand with bucket

# Slow falling for higher distances
execute as @s if predicate auto_mlg:mainhand_water if entity @s[tag=auto_water_mlg.enable,tag=!waterMLGDisable,gamemode=survival] if block ~ ~-1 ~ #auto_mlg:air unless block ~ ~-4 ~ #auto_mlg:air run effect give @s slow_falling 1 0 true

