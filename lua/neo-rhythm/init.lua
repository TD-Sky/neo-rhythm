---@class HourMin
---@field [1] number The inclusive start of range
---@field [2] number The exclusive end of range

---@class Range<T>: { [string]: T }
---@field start type The inclusive start of range
---@field ending type The exclusive end of range

---@class BgColorScheme
---@field [1]? string | fun() The colorscheme
---@field bg "light" | "dark" The background of colorscheme

---@alias ColorScheme string | fun() | BgColorScheme

---@class Config
---@field range Range<HourMin> The time range of day mode
---@field day? ColorScheme The colorscheme at day
---@field night? ColorScheme The colorscheme at night

local M = {}

---@param hm HourMin
---@return boolean
local function validate_hour_min(hm)
    return 0 <= hm[1] and hm[1] < 24 and 0 <= hm[2] and hm[2] < 60
end

---@param hm HourMin
---@return number
local function hm_to_number(hm)
    return hm[1] * 100 + hm[2]
end

---@param cls string | fun()
local function set_colorscheme(cls)
    local cls_t = type(cls)

    if cls_t == "string" then
        vim.cmd.colorscheme(cls)
    elseif cls_t == "function" then
        cls()
    else
        error("type error: not `string | func()`")
    end
end

---@param bg string
---@param cls ColorScheme | nil
local function set_appearance(bg, cls)
    if cls ~= nil then
        if type(cls) == "table" then
            vim.o.background = cls.bg
            if cls[1] ~= nil then
                set_colorscheme(cls[1])
            end
        else
            vim.o.background = bg
            set_colorscheme(cls --[[@as string | fun()]])
        end
    else
        vim.o.background = bg
    end
end

---@param opts Config
function M.setup(opts)
    local range = opts.range

    if not validate_hour_min(range.start) or not validate_hour_min(range.ending) then
        return
    end

    local now = tonumber(os.date("%H%M"))
    if hm_to_number(range.start) <= now and now < hm_to_number(range.ending) then
        set_appearance("light", opts.day)
    else
        set_appearance("dark", opts.night)
    end
end

return M
