local uis = game:GetService("UserInputService")
local hooked = false
local toggle = Enum.KeyCode.U -- Keybind is U Press U To Activate Desync and Turn it off

local function rakhook(packet)
    if packet.PacketId == 0x1B then
        local buf = packet.AsBuffer
        buffer.writeu32(buf, 1, 0xFFFFFFFF)
        packet:SetData(buf)
    end
end

uis.InputBegan:Connect(function(obj)
    if obj.KeyCode ~= toggle then return end

    if hooked then
        raknet.remove_send_hook(rakhook)
    else
        raknet.add_send_hook(rakhook)
    end

    hooked = not hooked
end)