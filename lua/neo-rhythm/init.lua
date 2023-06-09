---@class HourMin: { [integer]: number }

---@class Range<T>: { [string]: T }
---@field start type The inclusive start of range
---@field ending type The exclusive end of range

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

---@param opts Range<HourMin>
function M.setup(opts)
    if not validate_hour_min(opts.start) or not validate_hour_min(opts.ending) then
        return
    end

    local now = tonumber(os.date("%H%M"))

    if hm_to_number(opts.start) <= now and now < hm_to_number(opts.ending) then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end

return M
