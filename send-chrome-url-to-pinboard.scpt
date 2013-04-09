on alfred_script(q)
    -- your Pinboard.in API key, found at:
    -- https://pinboard.in/settings/password
    set apiKey to "USERNAME:KEY"

    tell application "Google Chrome"
        set theURL to URL of active tab of first window
        set theDesc to title of active tab of first window
    end tell

    set shellScript to ("curl -G --data-urlencode \"url=" & theURL & "\" --data-urlencode \"description=" & theDesc & "\" --data-urlencode \"auth_token=" & apiKey & "\" https://api.pinboard.in/v1/posts/add")

    set PnbdResponse to (do shell script shellScript)

    -- theURL gets handed off as {query} to the next step.
    return theURL

end alfred_script
