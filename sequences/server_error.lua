--[[
  General server error handler.
]]

return
{
  {
    action = "play_phrase",
    phrase = "gateway_down",
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

