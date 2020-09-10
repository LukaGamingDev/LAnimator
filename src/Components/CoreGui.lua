local Plugin = script:FindFirstAncestor("Plugin")

local CoreGui = game:GetService("CoreGui")

local Roact = require(Plugin.Parent.Roact)
local Theme = require(Plugin.Components.Theme)

local e = Roact.createElement

local function CoreGui()
    e(Roact.Portal, {
        target = CoreGui
    })
end