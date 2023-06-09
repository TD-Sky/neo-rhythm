# 🌅 neo-rhythm 🌇

**neo-rhythm** can switch the background automatically according to the given **time range**.



## Installation

Using lazy

```lua
{ "TD-Sky/neo-rhythm" }
```



## Examples

The **time range** indicates the time when the background is *light*.

```lua
{
    "TD-Sky/neo-rhythm",
    opts = {
        start = { 7, 0 },
        ending = { 18, 30 },
    },
}
```

The code above means to set the background to *light* at *07:00 ~ 18:30*, and set to *dark* at the other time.



## Remember neo-rhythm

The name *neo-rhythm* comes from [Biological rhythm](https://en.wikipedia.org/wiki/Biological_rhythm).
