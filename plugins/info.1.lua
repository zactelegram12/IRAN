local function callback_res(extra, success, result)
 info = "full name: "..result.print_name.."\n"
 .."firstname: "..(result.first_name or "").."\n"
 .."lastname: "..(result.last_name or "").."\n"
 .."username: "..(result.username or "").."\n"
 .."tele. id: "..result.id.."\n"
 send_large_msg(org_chat_id, info)
end
 
local function callback_reply(extra, success, result)
 if result.media then
  if result.media.type == "document" then
   msg_type = "document"
  elseif result.media.type == "photo" then
   msg_type = "photo"
  elseif result.media.type == "video" then
   msg_type = "video"
  elseif result.media.type == "audio" then
   msg_type = "audio"
  end
 elseif result.text then
  msg_type = "text"
 end
 if is_sudo(result) then
  rank = "sudo"
 elseif is_admin(result) then
  rank = "admin"
 elseif is_momod(result) then
  rank = "moderator"
 else
  rank = "member"
 end
 info = "full name: "..result.from.print_name.."\n"
 .."firstname: "..(result.from.first_name or "").."\n"
 .."lastname: "..(result.from.last_name or "").."\n"
 .."username: "..(result.from.username or "").."\n"
 .."tele. id: "..result.from.id.."\n\n"
 .."ranking: "..rank.."\n\n"
 .."msg type: "..msg_type.."\n\n"
 .."group name: "..result.to.print_name.."\n"
 .."group id: "..result.to.id
 send_large_msg(org_chat_id, info)
end

local function run(msg, matches)
 org_chat_id = "chat#id"..msg.to.id
 if #matches == 3 then
  return res_user(matches[3], callback_res, cbres_extra)
 elseif #matches == 1 then
  if not msg.reply_id then
   if is_sudo(msg) then
    rank = "sudo"
   elseif is_admin(msg) then
    rank = "admin"
   elseif is_momod(msg) then
    rank = "moderator"
   else
    rank = "member"
   end
   info = "full name: "..msg.from.print_name.."\n"
   .."firstname: "..(msg.from.first_name or "").."\n"
   .."lastname: "..(msg.from.last_name or "").."\n"
   .."username: "..(msg.from.username or "").."\n"
   .."tele. id: "..msg.from.id.."\n\n"
   .."ranking: "..rank.."\n\n"
   .."group name: "..msg.to.print_name.."\n"
   .."group id: "..msg.to.id
   return info
  else
   return get_message(msg.reply_id, callback_reply, false)
  end
 else
  return "bad command!"
 end
end

return {
 description = "User Infomation",
 usage = {
  "!info : your information",
  "!info [reply] : target information",
  "!info [@username] : target username information",
 },
 patterns = {
  "^[!/](info) (@)(.+)$",
  "^[!/](info) (.+)$",
  "^[!/](info)$",
 },
 run = run,
}