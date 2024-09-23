NetworkService.EventListener('heartbeat', function(eventType, data)
    local destroyWall = Config.DispatchSettings.InvokeWhenDestroyedWall
    local playerEscapedPrison = Config.DispatchSettings.InvokeWhenPlayerEscapePrison

    local prisoner = data.prisoner

    if not prisoner then
        return
    end

    local playerId = prisoner.source

    if not playerId then
        return
    end

    if destroyWall and eventType == HEARTBEAT_EVENTS.PLAYER_DESTROYED_WALL then
        dbg.debug('Calling dispatch since destroyed wall event is called.')
        Dispatch.Breakout(playerId)
        StartPrisonBreakAlarm()
    elseif playerEscapedPrison and eventType == HEARTBEAT_EVENTS.PLAYER_ESCAPE_FROM_PRISON then
        dbg.debug('Calling dispatch since player escaped from prison is called.')
        Dispatch.Breakout(playerId)
        StartPrisonBreakAlarm()
    end
end)