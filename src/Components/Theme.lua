local Plugin = script:FindFirstAncestor("Plugin")
local Roact = require(Plugin.Parent.Roact)

local studio = settings().Studio

local function getThemeColors(theme)
    theme = theme or studio.Theme
    local colors = {}
    for _, color in ipairs(Enum.StudioStyleGuideColor:GetEnumItems()) do
        for _, modifier in ipairs(Enum.StudioStyleGuideModifier:GetEnumItems()) do
            local modifierName = modifier.Name
            if modifierName == "Default" then
                modifierName = ""
            end
            colors[color.Name .. modifierName] = theme:GetColor(color, modifier)
        end
    end
    return colors
end

local Context = Roact.createContext()
local ThemeProvider = Roact.Component:extend("ThemeProvider")

function ThemeProvider:updateTheme()
    self:setState({
        theme = getThemeColors(studio.Theme)
    })
end

function ThemeProvider:init()
	self:updateTheme()
end

function ThemeProvider:render()
	return Roact.createElement(Context.Provider, {
		value = self.state.theme,
	}, self.props[Roact.Children])
end

function ThemeProvider:didMount()
	self.Connection = studio.ThemeChanged:Connect(function()
		self:updateTheme()
	end)
end

function ThemeProvider:willUnmount()
	self.Connection:Disconnect()
end

local function with(callback)
	return Roact.createElement(Context.Consumer, {
		render = callback,
	})
end

return {
    Provider = ThemeProvider,
    Consumer = Context.Consumer,
    with = with
}