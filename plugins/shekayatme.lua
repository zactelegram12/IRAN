local function run(msg, matches)
	local dadgah = get_receiver(msg)
	local user = "user#id"..msg.from.id
	if matches[1] == "shekayatme" and is_dadgah_msg(msg) then
		dadgah_sekayat_user(dadgah, user, ok_cb, true)
	end
end

return {
  description = "Plugin to shekayat yourself.", 
  usage = {
    "!kickme : shekayat yourself from dadgah",
  },
  patterns = {
    "^[!/](shekayatme)$",
  }, 
  run = run,
}
--create by @shahriar65