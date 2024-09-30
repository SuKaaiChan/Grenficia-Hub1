function LoadSettings()
    if readfile and writefile and isfile and isfolder then
        if not isfolder("Grenficia-Gaming") then
            makefolder("Grenficia-Gaming")
        end
        if not isfolder("Grenficia-Gaming/Blox Fruits/") then
            makefolder("Grenficia-Gaming/Blox Fruits/")
        end
        if not isfile("Grenficia-Gaming/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json") then
            writefile("Grenficia-Gaming/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(_G.Settings))
        else
            local Decode = game:GetService("HttpService"):JSONDecode(readfile("Grenficia-Gaming/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"))
            for i,v in pairs(Decode) do
                _G.Settings[i] = v
            end
        end
    else
        return warn("Status : Undetected Executor")
    end
end

function SaveSettings()
    if readfile and writefile and isfile and isfolder then
        if not isfile("Grenficia-Gaming/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json") then
            LoadSettings()
        else
            local Decode = game:GetService("HttpService"):JSONDecode(readfile("Grenficia-Gaming/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"))
            local Array = {}
            for i,v in pairs(_G.Settings) do
                Array[i] = v
            end
            writefile("Grenficia-Gaming/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(Array))
        end
    else
        return warn("Status : Undetected Executor")
    end
end

LoadSettings()