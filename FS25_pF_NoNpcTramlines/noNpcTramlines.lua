ClearNpcFieldFruitTypes = {}
ClearNpcFieldFruitTypes._done = false
ClearNpcFieldFruitTypes._waitFrames = 0
ClearNpcFieldFruitTypes.MAX_WAIT_FRAMES = 900

local function log(msg)
    print("ClearNpcFieldFruitTypes: " .. msg)
end

local function clearTable(t)
    local count = 0
    for k, _ in pairs(t) do
        t[k] = nil
        count = count + 1
    end
    return count
end

function ClearNpcFieldFruitTypes:update(dt)
    if self._done then return end
    if g_currentMission == nil or not g_currentMission.isLoaded then return end

    self._waitFrames = self._waitFrames + 1

    local G = FS25_precisionFarming and FS25_precisionFarming._G
    local pf = G and G.g_precisionFarming
    local tramlineMap = pf and pf.tramlineMap
    local npcFT = tramlineMap and tramlineMap.npcFieldFruitTypes

    if type(npcFT) == "table" then
        local before = 0
        for _ in pairs(npcFT) do before = before + 1 end

        local removed = clearTable(npcFT)

        local after = 0
        for _ in pairs(npcFT) do after = after + 1 end

        log(("cleared npcFieldFruitTypes via FS25_precisionFarming._G. before=%d removed=%d after=%d")
            :format(before, removed, after))

        self._done = true
        return
    end

    if self._waitFrames >= self.MAX_WAIT_FRAMES then
        log("timeout: npcFieldFruitTypes not found via FS25_precisionFarming._G.g_precisionFarming.tramlineMap")
        self._done = true
    end
end

addModEventListener(ClearNpcFieldFruitTypes)
