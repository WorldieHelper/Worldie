--[[

    Original Source:

    Taken from ReplicatedStorage.Shared.Gear

    function v1.RandomSelectDye(Num)
        local _RandomColor = Random.new(Num or math.random() * 100000);
        local Int1 = _RandomColor:NextInteger(1, 100) == 100;
        local Int2 = _RandomColor:NextInteger(1, 100) == 100;
        
        if Int1 and Int2 then
            return Color3.fromRGB(0, 0, 0);
        end;
        
        if Int1 then
            return Color3.fromRGB(230, 230, 230);
        end;
        
        if Int2 then
            return Color3.fromRGB(30, 30, 30);
        end;
        
        return Color3.fromHSV(_RandomColor:NextInteger(1, 1000) / 1000, _RandomColor:NextInteger(500, 1000) / 1000, _RandomColor:NextInteger(500, 1000) / 1000);
    end;

]]

--> Add the colors here
local SetColors = {
    "ffffff",
    "ff0000",
    "0000ff",
}

--> Taken straight from the game (Utils) and slightly edited
function RandomSelectDye(Num)
    local _RandomColor = Random.new(Num or math.random() * 100000);
    local Int1 = _RandomColor:NextInteger(1, 100) == 100;
    local Int2 = _RandomColor:NextInteger(1, 100) == 100;
    
    if Int1 and Int2 then
        print("Int1 and Int2 Triggered ;; " .. Color3.fromRGB(0, 0, 0):ToHex())
        return Color3.fromRGB(0, 0, 0):ToHex()
    end;
    
    if Int1 then
        print("Int1 Triggered ;; " .. Color3.fromRGB(230, 230, 230):ToHex())
        return Color3.fromRGB(230, 230, 230):ToHex()
    end;
    
    if Int2 then
        print("Int2 Triggered ;; " .. Color3.fromRGB(30, 30, 30):ToHex())
        return Color3.fromRGB(30, 30, 30):ToHex()
    end;
    
    return Color3.fromHSV(_RandomColor:NextInteger(1, 1000) / 1000, _RandomColor:NextInteger(500, 1000) / 1000, _RandomColor:NextInteger(500, 1000) / 1000):ToHex();
end;

for i=1, 1000 do
    local Color = RandomSelectDye()
    
    if table.find(SetColors, Color) then
        print(Color)
    end
end