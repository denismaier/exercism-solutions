local BankAccount = {}

function BankAccount:new(balance)
  local self = setmetatable({}, { __index = BankAccount })
  self._balance = balance or 0
  self._active = true
  return self
end

function BankAccount:close()
    assert(self._active == true, 'already closed')
    self._active = false
end

function BankAccount:deposit(value)
    assert(self._active == true, 'Account inactive')
    assert(value > 0, 'invalid input')
    self._balance = self._balance + value
end

function BankAccount:withdraw(value)
    assert(self._active == true, 'Account inactive')
    assert(value > 0, 'invalid input')
    assert(self._balance - value >= 0, 'invalid input')
    self._balance = self._balance - value
end

function BankAccount:balance()
  return self._balance
end

return BankAccount