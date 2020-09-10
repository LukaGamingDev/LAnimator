local Roact = require(script.Parent.Roact)
local Theme = require(script.Components.Theme)
local App = require(script.Components.App)

local e = Roact.createElement

local app = e(Theme.Provider, {}, {
    e(App, {
        plugin = plugin
    })
})

local tree = Roact.mount(app, nil, "LAnimator GUI")

plugin.Unloading:Connect(function()
    Roact.unmount(tree)
end)