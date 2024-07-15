#> later:api > delay
#--------------------
# -> command: $command
# -> ticks: int
# => selector: $selector = "@s"
# => data: any = {}
# => failsafe: $command = ""
#--------------------
# <- result: TaskId
#--------------------
#> schedules <command> to run AS and AT <selector> after an amount of <ticks>.
#> {later:data -> current.data} will hold <data> when <command> is executed.
#--------------------
#- <selector> is evaluated using the *current* context, not the context when <command> is executed.
#- >result< is the delayed command's assigned TaskId, and is used when cancelling a scheduled command.
#- <ticks> cannot be zero or negative.
#- if <selector> has 0 matches at the time of execution, <failsafe> will run as the server instead.
#--------------------
# 1 - success
# 0 - failure, <ticks> zero or negative.
#--------------------

execute unless data storage later:in delay.selector run data modify storage later:in delay.selector set value "@s"
execute unless data storage later:in delay.data run data modify storage later:in delay.data set value {}
execute unless data storage later:in delay.failsafe run data modify storage later:in delay.failsafe set value ""


execute store result score *delay.ticks -later run data get storage later:in delay.ticks
execute if score *delay.ticks -later matches ..0 run return run function later:_/impl/delay/end

function later:_/impl/delay/do with storage later:in delay

data remove storage later:var delay
data remove storage later:in delay
scoreboard players reset *delay.ticks -later

return 1