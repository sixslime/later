#> later:_/impl/delay/do
#--------------------
# @api
#--------------------

scoreboard players operation *delay.ticks -later += *time --later
$execute store result storage later:var delay.task.time int 1 run schedule function later:_/check $(ticks)t append

data modify storage later:var delay.task.command set from storage later:in delay.command
data modify storage later:var delay.task.data set from storage later:in delay.data
data modify storage later:var delay.task.failsafe set from storage later:in delay.failsafe

$execute as $(selector) run data modify storage later:var delay.task.targets append from entity @s UUID 

execute store result storage later:var delay.task.task_id int 1 run scoreboard players get *max_id --later
data modify storage later:out delay.result set from storage later:var delay.task.task_id
scoreboard players add *max_id --later 1

data modify storage later:data tasks append from storage later:var delay.task