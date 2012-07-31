--[[
  Emails a cowsay.
]]

email = args(1)
cowsay = storage("system", "output")

return
{
  {
    action = "email",
    to = email,
    headers = {
      ['Content-Type'] = "text/html",
    },
    tokens = {
      cowsay = cowsay,
    },
    template = 'cowphone',
  },
  {
    action = "play_phrase",
    phrase = "message_emailed",
  },
  {
    action = "wait",
    milliseconds = 500,
  },
  {
    action = "play_phrase",
    phrase = "goodbye",
  },
}

