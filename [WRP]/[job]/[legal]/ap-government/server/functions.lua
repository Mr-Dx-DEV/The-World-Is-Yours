GetAccountData = function(business)
  if Config.JobManagementScriptName == "qb-banking" then
    if exports["qb-banking"]:GetAccount(business) then
      return exports["qb-banking"]:GetAccountBalance(business)
    else exports["qb-banking"]:CreateJobAccount(business, 0)
      return 0
    end
  else return exports[Config.JobManagementScriptName]:GetAccount(business) end
end

AddAccountMoney = function(business, amount)
  return exports[Config.JobManagementScriptName]:AddMoney(business, amount)
end

RemoveAccountMoney = function(business, amount)
  return exports[Config.JobManagementScriptName]:RemoveMoney(business, amount)
end

BankingTransaction = function(identifier, amount, tax)
  if Config.Banking.okokbanking then
    -- okokBanking transaction event
    TriggerEvent('okokBanking:AddNewTransaction', "Government", "", getName(identifier), identifier, amount, tax.." Tax")
  elseif Config.Banking.snipebanking then
    -- snipe-banking transaction logic
    exports["snipe-banking"]:AddTransaction({
      sender = "Government", -- The sender's name (can be customized)
      receiver = getName(identifier), -- The receiver's name
      account = identifier, -- The account to which the transaction applies
      amount = amount, -- Transaction amount
      description = tax .. " Tax" -- Description of the transaction
    })
  elseif Config.Banking.other then
    -- Add other banking logic here if needed
  end
end
