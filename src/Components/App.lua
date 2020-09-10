local Plugin = script:FindFirstAncestor("Plugin")

local Assets = require(Plugin.Assets)
local Roact = require(Plugin.Parent.Roact)
local Theme = require(Plugin.Components.Theme)

local e = Roact.createElement

local App = Roact.Component:extend("App")

function App:init()
    local toolbar = self.props.plugin:CreateToolbar("LAnimator")

    self.toggleButton = toolbar:CreateButton(
        "LAnimator",
        "Open/Close LAnimator",
        Assets.Images.Logo
    )
end

function App:render()
    return
end

return App