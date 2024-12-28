--[[ WebhookURL = "WEBHOOK" -- Webhook to send logs to discord

function beforeBuyMarket(source,market_id,price)
	-- Here you can do any verification when a player is buying a market, like if player has the permission to that or anything else you want to check before buy the market. return true or false
	return false
end

function afterBuyMarket(source,market_id,price)
	-- Here you can run any code right after the player purchase a business
end

function beforeBuyItem(source,market_id,item_id,amount,total_price,metadata)
	-- This function allows you to add checks before a player buys an item from a market. For example, you can verify whether the player has the necessary permissions or licenses to buy the item.
	-- You can also change the item's metadata here. For instance, by removing the comment from the next line, you will add a new metadata to the item called "purchased_at":
	-- metadata.purchased_at = "Owned stores"
	-- This function must return 'true' to allow the purchase, or 'false' to block it, based on your conditions.
	return true
end

function afterBuyItem(source,market_id,item_id,amount,total_price,account)
	-- Here you can run any code just after the player purchased any item, like government taxes or anything else
end

function beforeHireEmployee(source,market_id,employee_id)
	-- Here you can do any verification when a player is being hired to a store by the owner. return true or false
	return true
end

function afterHireEmployee(source,market_id,employee_id)
	-- Here you can run any code right after the a employee was hired
end ]]


WebhookURL = "https://discord.com/api/webhooks/1321836717283479613/n-B8afqXVk7QsXwC9X10tM6fV5h31k7O4f3KI4ZEEazzU5uYLWbZRFXASQpK8lBiTmkZ" -- Webhook to send logs to discord

-- Define the tax percentage for the AP-Government
local AP_GOV_TAX_PERCENTAGE = 10 -- 10% tax

function beforeBuyMarket(source, market_id, price)
    -- Here you can do any verification when a player is buying a market, like if player has the permission to that or anything else you want to check before buy the market. return true or false
    return false
end

function afterBuyMarket(source, market_id, price)
    -- Here you can run any code right after the player purchases a business
end

function beforeBuyItem(source, market_id, item_id, amount, total_price, metadata)
    -- This function allows you to add checks before a player buys an item from a market. For example, you can verify whether the player has the necessary permissions or licenses to buy the item.
    -- You can also change the item's metadata here. For instance, by removing the comment from the next line, you will add a new metadata to the item called "purchased_at":
    -- metadata.purchased_at = "Owned stores"
    -- This function must return 'true' to allow the purchase, or 'false' to block it, based on your conditions.
    return true
end

function afterBuyItem(source, market_id, item_id, amount, total_price, account)
    -- Calculate the tax amount
    local tax = math.floor(total_price * (AP_GOV_TAX_PERCENTAGE / 100))

    -- Deduct the tax from the player's account
    local Player = QBCore.Functions.GetPlayer(source) -- Fetch the player using QBCore
    if Player then
        Player.Functions.RemoveMoney('cash', tax, "AP-Government Tax") -- Deduct the tax from the player's cash

        -- Optionally, add the tax to a government account or log it
        AddToGovernmentAccount(tax) -- Replace this with your tax deposit logic if applicable

        -- Log the tax transaction to Discord
        sendToDiscord("AP-Government Tax System", "Player " .. Player.PlayerData.name .. " paid a tax of $" .. tax .. " for their purchase.", 3066993)

        -- Notify the player about the tax deduction
        TriggerClientEvent('QBCore:Notify', source, "A tax of $" .. tax .. " has been deducted from your purchase.", "success")
    end
end

function beforeHireEmployee(source, market_id, employee_id)
    -- Here you can do any verification when a player is being hired to a store by the owner. return true or false
    return true
end

function afterHireEmployee(source, market_id, employee_id)
    -- Here you can run any code right after an employee was hired
end

-- Function to log messages to Discord
function sendToDiscord(name, message, color)
    if WebhookURL == "WEBHOOK" then return end -- Exit if no valid webhook is set
    PerformHttpRequest(WebhookURL, function(err, text, headers) end, "POST", json.encode({
        username = name,
        embeds = {
            {
                color = color,
                description = message
            }
        }
    }), {['Content-Type'] = 'application/json'})
end

-- Placeholder function for depositing tax into a government account
function AddToGovernmentAccount(amount)
    -- Implement your logic to add the tax amount to a government account
    print("Added $" .. amount .. " to the government account.")
end
