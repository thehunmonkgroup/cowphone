--[[
  Makes a cowsay from the converted message.
]]

message = storage("speech_to_text", "translation_1")
return_code = storage("system", "return_code")

return
{
  {
    action = "shell_command_with_output",
    command = "cowsay -f " .. profile.cowfile .. " " .. message,
  },
  {
    action = "conditional",
    comparison = "equal",
    value = return_code,
    compare_to = 0,
    if_true = "email_cowsay " .. profile.cowphone_destination_email,
    if_false = "server_error",
  },
}

