# 🌅 neo-rhythm 🌇

**neo-rhythm** can switch the background automatically according to the given **time range**.



## Installation

Using lazy

```lua
{ "TD-Sky/neo-rhythm" }
```



## Examples

### Only switch background

The **time range** indicates the time when the background is *light*.

```lua
{
    "TD-Sky/neo-rhythm",
    opts = {
        range = {
            start = { 7, 0 },
            ending = { 18, 30 },
        }
    },
}
```

The code above means to set the background to *light* at *07:00 ~ 18:30*, and set to *dark* at the other time.

### Switch colorscheme

```lua
{
    "TD-Sky/neo-rhythm",
    opts = {
        range = {
            start = { 7, 0 },
            ending = { 19, 0 },
        },
        day = function()
            require("onedark").setup({
                style = "light",
            })
        end,
        night = "onedark",
    },
}
```

The code above means to set colorscheme with function `day` at *07:00 ~ 19:00*,
and set colorscheme to *onedark* at the other time.

The fields `day` and `night` can be one of the following types:
- `string`: The colorscheme **name**.
- `function`: **How to** set the colorscheme.
- `{ string|function, bg = "light" | "dark" }`: Setting **colorscheme** with **background**.



## Remember neo-rhythm

The name *neo-rhythm* comes from [Biological rhythm](https://en.wikipedia.org/wiki/Biological_rhythm).
