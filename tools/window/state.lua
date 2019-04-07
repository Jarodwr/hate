local StateWindow = extends "tools.window"

function StateWindow:new()
	self.super.new(self)
end

function StateWindow:draw()
	local data = {0.6, 0.1, 1.0, 0.5, 0.92, 0.1, 0.2}
	-- local test = ImVec2(2,2)
	print "TEST"
	-- imgui.PlotHistogram("Histogram", data, #data, 0, nil, 0.0, 1.0, {x = 0, y = 80})

	local stacks = {}
	local maxDepth = 0
	for name, stack in pairs(state._stacks) do
		table.insert(stacks, {name = name, stack = stack})
		maxDepth = #stack > maxDepth and #stack or 0
	end
	imgui.Columns(#stacks, "stacks")

	-- Header Row
	imgui.Separator()
	for _, stackStruct in ipairs(stacks) do
		imgui.Text(stackStruct.name)
		imgui.NextColumn()
	end
	imgui.Separator()

	-- Push/Pop Actions
	for _, stackStruct in ipairs(stacks) do
		imgui.Button "push"
		imgui.Button "pop"
		imgui.NextColumn()
	end
	imgui.Separator()

	-- State stack rows
	for i = maxDepth, 0, -1 do
		for _, stackStruct in ipairs(stacks) do
			local scene = stackStruct.stack[#stackStruct.stack - i]
			if scene then
				imgui.Button(scene:__name())
			end
			imgui.NextColumn()
		end
	end
end

return StateWindow
