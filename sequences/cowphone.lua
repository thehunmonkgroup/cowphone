--[[
  Records a sound file, then converts the speech to text.

  The recording is limited to 10 seconds.
]]

file_to_translate = "cowphone.wav"
status = storage("speech_to_text", "status")

-- Set up initial recording keys.
record_keys = {
  ["0"] = ":break",
  ["1"] = ":break",
  ["2"] = ":break",
  ["3"] = ":break",
  ["4"] = ":break",
  ["5"] = ":break",
  ["6"] = ":break",
  ["7"] = ":break",
  ["8"] = ":break",
  ["9"] = ":break",
  ["*"] = ":break",
  ["#"] = ":break",
}

return
{
  {
    action = "play_phrase",
    phrase = "record_message",
  },
  {
    action = "wait",
    milliseconds = 500,
  },
  {
    action = "record",
    location = profile.temp_recording_dir,
    filename = file_to_translate,
    pre_record_sound = "tone",
    max_length = 10,
    silence_secs = 2,
    keys = record_keys,
  },
  {
    action = "play_phrase",
    phrase = "one_moment_please",
  },
  {
    action = "speech_to_text_from_file",
    filepath = profile.temp_recording_dir .. "/" .. file_to_translate,
  },
  {
    action = "conditional",
    comparison = "equal",
    value = status,
    compare_to = 0,
    if_true = "make_cowsay",
    if_false = "server_error",
  },
}

