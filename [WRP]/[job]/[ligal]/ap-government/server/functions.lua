--[[ GetAccountData = function(business)
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
    TriggerEvent('okokBanking:AddNewTransaction', "Government", "", getName(identifier), identifier, amount, tax.." Tax")
  elseif Config.Banking.other then
    -- Add event/export here.
  end
end ]]

GetAccountData = function(business)
  if Config.JobManagementScriptName == "qb-banking" then
    if exports["qb-banking"]:GetAccount(business) then
      return exports["qb-banking"]:GetAccountBalance(business)
    else 
      exports["qb-banking"]:CreateJobAccount(business, 0)
      return 0
    end
  elseif Config.JobManagementScriptName == "renewed-banking" then
    local accountMoney = exports["Renewed-Banking"]:getAccountMoney(business)
    return accountMoney or 0 -- Return 0 if the account doesn't exist
  else 
    return exports[Config.JobManagementScriptName]:GetAccount(business) 
  end
end

AddAccountMoney = function(business, amount)
  if Config.JobManagementScriptName == "renewed-banking" then
    local success = exports["Renewed-Banking"]:addAccountMoney(business, amount)
    if success then
      -- Handle the transaction details here, if necessary
      exports['Renewed-Banking']:handleTransaction(business, "Job Account", amount, "Deposit to account", "System", business, "deposit")
    end
    return success
  else
    return exports[Config.JobManagementScriptName]:AddMoney(business, amount)
  end
end

RemoveAccountMoney = function(business, amount)
  if Config.JobManagementScriptName == "renewed-banking" then
    local success = exports["Renewed-Banking"]:removeAccountMoney(business, amount)
    if success then
      -- Handle the transaction details here, if necessary
      exports['Renewed-Banking']:handleTransaction(business, "Job Account", amount, "Withdrawal from account", business, "System", "withdraw")
    end
    return success
  else
    return exports[Config.JobManagementScriptName]:RemoveMoney(business, amount)
  end
end

BankingTransaction = function(identifier, amount, tax)
  if Config.Banking.okokbanking then
    TriggerEvent('okokBanking:AddNewTransaction', "Government", "", getName(identifier), identifier, amount, tax.." Tax")
  elseif Config.Banking.renewedbanking then
    -- Add a new transaction for Renewed-Banking
    exports['Renewed-Banking']:handleTransaction(identifier, "Government Transaction", amount, tax .. " Tax", "Government", identifier, "deposit")
  elseif Config.Banking.other then
    -- Add event/export here.
  end
end
