# Usage
The primary usage of Later is through the `later:api/delay` function. \
`later:api/delay` takes the following inputs, stored under the `later:in` storage namespace:
| NBT path | Type | Default value |
|--|--|--|
| `delay.ticks` | int | (none) |
| `delay.command` | string ($command) | (none) |
| `delay.selector` | string ($selector) | "@s" |
| `delay.data` | any | {} |
| `delay.failsafe` | string ($command) | "" |

Running `later:api/delay` will immediately save the entities specified by **\<selector\>** and schedule **\<command\>** to execute AS and AT those same entities after a **\<ticks\>** tick delay. \
**\<data\>** will be stored in `later:data -> current.data` upon delayed execution. \
If an entity was captured by **\<selector\>** when `later:api/delay` was executed, but is not present upon delayed execution, **\<failsafe\>** runs with server/no context instead (for each missing entity). \
Additionally, `later:data -> current.target` will hold the UUID of the intended execution target upon delayed execution (intended for use with **\<failsafe\>**).

`later:api
## Example
> Make players say "I've joined the game!" when they join the game:
*\<your datapack\>/data/onjoin/tags/function/hook/on_join.json*
```json
{
    "values": [
        "mypack:_/my_subscriber"
    ]
}
```
*\<your datapack\>/data/mypack/function/\_/my\_subscriber.mcfunction*
```mcfunction
say I've joined the game!
```

WIP OBV
