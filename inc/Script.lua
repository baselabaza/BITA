--[[

]]

function download_to_file(url, file_name)
  -- print to server
  -- print("url to download: "..url)
  -- uncomment if needed
  local respbody = {}
  local options = {
    url = url,
    sink = ltn12.sink.table(respbody),
    redirect = true
  }

  -- nil, code, headers, status
  local response = nil

  if url:starts('https') then
    options.redirect = false
    response = {https.request(options)}
  else
    response = {http.request(options)}
  end

  local code = response[2]
  local headers = response[3]
  local status = response[4]

  if code ~= 200 then return nil end

  file_name = file_name or get_http_file_name(url, headers)

  local file_path = "data/"..file_name
  -- print("Saved to: "..file_path)
	-- uncomment if needed
  file = io.open(file_path, "w+")
  file:write(table.concat(respbody))
  file:close()

  return file_path
end
function run_command(str)
  local cmd = io.popen(str)
  local result = cmd:read('*all')
  cmd:close()
  return result
end
function string:isempty()
  return self == nil or self == ''
end

-- Returns true if the string is blank
function string:isblank()
  self = self:trim()
  return self:isempty()
end

-- DEPRECATED!!!!!
function string.starts(String, Start)
  -- print("string.starts(String, Start) is DEPRECATED use string:starts(text) instead")
  -- uncomment if needed
  return Start == string.sub(String,1,string.len(Start))
end

-- Returns true if String starts with Start
function string:starts(text)
  return text == string.sub(self,1,string.len(text))
end

local getUser = function(user_id,cb)
tdcli_function({ID = "GetUser",user_id_ = user_id},cb,nil)
end

Bot_Api = 'https://api.telegram.org/bot'.. Token
function send_inline(chat_id,text,keyboard,markdown)
local url = Bot_Api
if keyboard then
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=html&reply_markup='..URL.escape(json:encode(keyboard))
else
url = url .. '/sendMessage?chat_id=' ..chat_id.. '&text='..URL.escape(text)..'&parse_mode=HTML'
end
if markdown == 'md' or markdown == 'markdown' then
url = url..'&parse_mode=Markdown'
elseif markdown == 'html' then
url = url..'&parse_mode=HTML'
end
return https.request(url)
end








function lock_photos(msg)
if not msg.Director then 
return "ٴ𐄬 *│* هذا الامر يخص {المدير,المنشئ,المطور} فقط  \n"
end
redis:set(bita.."getidstatus"..msg.chat_id_, "Simple")
return  "ٴ𐄬 ** أهلا عزيزي "..msg.TheRankCmd.."\nٴ𐄬 ** تم تعطيل الايدي بالصوره  \n" 
end 
function unlock_photos(msg)
if not msg.Director then
return "ٴ𐄬 ** هذا الامر يخص {المدير,المنشئ,المطور} فقط  \n"
end
redis:set(bita.."getidstatus"..msg.chat_id_, "Photo")
return  "ٴ𐄬 ** أهلا عزيزي "..msg.TheRankCmd.."\nٴ𐄬 ** تم تفعيل الايدي بالصوره \n" 
end
function cmds_on(msg)
if not msg.Creator then return "ٴ𐄬 ** هذا الامر يخص {المنشئ,المطور} فقط  \n"
end
redis:set(bita..'lock:kara:'..msg.chat_id_,'on')
return "ٴ𐄬 ** أهلا عزيزي "..msg.TheRankCmd.."\nٴ𐄬 ** تم تعطيل الرفع في المجموعه \n"
end
function cmds_off(msg)
if not msg.Creator then return "ٴ𐄬 ** هذا الامر يخص {المنشئ,المطور} فقط  \n"
end
redis:set(bita..'lock:kara:'..msg.chat_id_,'off')
return "ٴ𐄬 ** أهلا عزيزي "..msg.TheRankCmd.."\nٴ𐄬 ** تم تفعيل الرفع في المجموعه \n"
end

function lockjoin(msg)
if not msg.Admin then return "ٴ𐄬 *│* هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n"
end
redis:set(bita..'lock:join:'..msg.chat_id_,true)
return "*ٴ𐄬 ** أهلا عزيزي *"..msg.TheRankCmd.."*\nٴ𐄬 ** تم قفل الدخول بالرابط \n*" 

end
function unlockjoin(msg)
if not msg.Admin then return "ٴ𐄬 ** هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n"
end
redis:del(bita..'lock:join:'..msg.chat_id_)
return "*ٴ𐄬 ** أهلا عزيزي *"..msg.TheRankCmd.."*\nٴ𐄬 ** تم فتح الدخول بالرابط \n*" 
end


local function ibita(msg,MsgText)

Channel = redis:get(bita..'setch') or katrenno
--JoinChannel
function is_JoinChannel(msg)
if redis:get(bita..'joinchnl') then
local url  = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..msg.sender_user_id_)
if res ~= 200 then
end
Joinchanel = json:decode(url)
if not GeneralBanned((msg.adduser or msg.sender_user_id_)) and (not Joinchanel.ok or Joinchanel.result.status == "left" or Joinchanel.result.status == "kicked") and not msg.SudoUser then
function name(arg,data)
bd = 'ٴ𐄬 اسمك  ('..(data.first_name_ or '')..')\nٴ𐄬 معرفك (@'..(data.username_ or '')..')\n\nٴ𐄬 اشترك بالقناه اولا \nٴ𐄬 ثم ارجع استخدم الامر.'
local keyboard = {}
keyboard.inline_keyboard = {{
{text = 'اشترك بالقناه .',url='https://telegram.me/'..Channel}}}   
send_inline(msg.chat_id_,bd,keyboard,'html')
end
getUser(msg.sender_user_id_,name)
else
return true
end
else
return true
end
end
if msg.type ~= 'pv' then

if MsgText[1] == "تفعيل" and not MsgText[2] then
redis:set(bita.."getidstatus"..msg.chat_id_, "Photo")
redis:set(bita..'lock:kara:'..msg.chat_id_,'off')
return modadd(msg)  
end

if MsgText[1] == "تعطيل" and not MsgText[2] then
return modrem(msg) 
end






if MsgText[1] == "تفعيل الايدي بالصوره" and not MsgText[2] then
return unlock_photos(msg)  
end
if MsgText[1] == "تعطيل الايدي بالصوره" and not MsgText[2] then
return lock_photos(msg) 
end
if MsgText[1] == "تعطيل الرفع" and not MsgText[2] then
return cmds_on(msg)  
end
if MsgText[1] == "تفعيل الرفع" and not MsgText[2] then
return cmds_off(msg) 
end

if MsgText[1] == "قفل الدخول بالرابط" and not MsgText[2] then
return lockjoin(msg)  
end
if MsgText[1] == "فتح الدخول بالرابط" and not MsgText[2] then
return unlockjoin(msg) 
end

end


if msg.type ~= 'pv' and msg.GroupActive then 

if MsgText[1] == 'شحن' and MsgText[2] then
if not msg.SudoUser then return "♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(bita..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(bita..'CheckExpire::'..msg.chat_id_) then 
redis:set(bita..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... 👍🏿\n🕵🏼️‍♀️│في مجموعه  » »  '..redis:get(bita..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│عزيزي المطور ✋🏿\n👨🏻‍🔧│شحن الاشتراك يكون ما بين يوم الى 1000 يوم فقط 🍃')
end 
return false
end

if MsgText[1] == 'الاشتراك' and MsgText[2] then 
if not msg.SudoUser then return "♦️*│*هذا الامر يخص {المطور} فقط  \n💥" end
if MsgText[2] == '1' then
redis:setex(bita..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(bita..'CheckExpire::'..msg.chat_id_) then 
redis:set(bita..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `30 يوم`  *(شهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك  👍🏿\n📆│ الاشتراك » `30 يوم`  *(شهر)*')
end
if MsgText[2] == '2' then
redis:setex(bita..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(bita..'CheckExpire::'..msg.chat_id_) then 
redis:set(bita..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `90 يوم`  *(3 اشهر)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `90 يوم`  *(3 اشهر)*')
end
if MsgText[2] == '3' then
redis:set(bita..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(bita..'CheckExpire::'..msg.chat_id_) then 
redis:set(bita..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `مفتوح`  *(مدى الحياة)*')
sendMsg(SUDO_ID,0,'💂🏻‍♀️│تم تفعيل الاشتراك   👍🏿\n📆│ الاشتراك » `مفتوح`  *(مدى الحياة)*')
end 
return false
end


if MsgText[1] == 'الاشتراك' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "♦️*│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n💥" end
local check_time = redis:ttl(bita..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*مـفـتـوح *🎖\n✓' end
year = math.floor(check_time / 31536000)
byear = check_time % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if tonumber(check_time) > 1 and check_time < 60 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..sec..'* ثانيه'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '💳│`باقي من الاشتراك ` » » '..min..' *دقيقه و * *'..sec..'* ثانيه'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 31536000 then
remained_expire = '💳│`باقي من الاشتراك ` » » * \n 📆│ '..year..'* سنه و *'..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه' end
return remained_expire
end


if MsgText[1] == "المجموعه" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(bita..'group:name'..msg.chat_id_) or '')
redis:set(bita..'linkGroup'..msg.chat_id_,(data.invite_link_ or ""))
return sendMsg(msg.chat_id_,msg.id_,
"ٴ𐄬 ❪ مـعـلومـات الـمـجـموعـه ❫\n\n"
.."*ٴ𐄬 * عدد الأعضاء ⇜ ❪ *"..data.member_count_.."* ❫"
.."\n*ٴ𐄬 * عدد المحظورين ⇜ ❪ *"..data.kicked_count_.."* ❫"
.."\n*ٴ𐄬 * عدد المشرفين ⇜ ❪ *"..data.administrator_count_.."* ❫"
.."\n*ٴ𐄬 * ايدي المجموعه ⇜ ❪"..msg.chat_id_.."❫"
.."\n\nٴ𐄬 اسم المجموعه ⇜ ❪  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  ❫\n"
)
end,nil) 
return false
end

if MsgText[1] == "التفاعل" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="active"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="active"})
end  
return false
end

if MsgText[1] == "منع" then 
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return AddFilter(msg, MsgText[2]) 
end

if MsgText[1] == "الغاء منع" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return RemFilter(msg, MsgText[2]) 
end

if MsgText[1] == "قائمه المنع" then 
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return FilterXList(msg) 
end

if MsgText[1] == "الحمايه" then 
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return settingsall(msg) 
end

if MsgText[1] == "الاعدادات" then 
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return settings(msg) 
end

if MsgText[1] == "الوسائط" then 
if not msg.Admin then return "ٴ𐄬 *│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return media(msg) 
end

if MsgText[1] == "الادمنيه" then 
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return GetListAdmin(msg) 
end

if MsgText[1] == "تاك" then
if not msg.Admin then return "ٴ𐄬 ** هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = 100
},function(ta,taha)
local t = "\n| قائمة الاعضاء \n⬝⬝⬝⬝⬝⬝⬝⬝⬝⬝⬝⬝⬝⬝⬝⬝⬝\n"
x = 0
local list = taha.members_
for k, v in pairs(list) do
x = x + 1
t = t..""..x.." - {["..v.user_id_.."](tg://user?id="..v.user_id_..")} \n"
end
send_msg(msg.chat_id_,t,msg.id_)
end,nil)
end

if (MsgText[1] == "تاك مذدوج" and is_JoinChannel(msg)) then 
if not msg.Admin then return "ٴ𐄬 ** هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "تاك للكل" then 
if not msg.Admin then return "ٴ𐄬 ** هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return ownerlist(msg) .. GetListAdmin(msg) .. whitelist(msg)
end

if MsgText[1] == "المنشئ الاساسي" then 
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return MONSHA_BOT(msg) 
end

if MsgText[1] == "المدراء" then 
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return ownerlist(msg) 
end

if MsgText[1] == "المنشى الاساسي" then 
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return Hussainlist(msg) 
end

if MsgText[1] == "المميزين" then 
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return whitelist(msg) 
end


if MsgText[1] == "صلاحياته" then 
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
if MsgText[1] == "صلاحياتي" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
end
if MsgText[1] == "صلاحياته" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if tonumber(msg.reply_to_message_id_) == 0 then 
local username = MsgText[2]
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 المعرف غير صحيح \n')   
end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 هاذا معرف قناة \n')   
end      
Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
if MsgText[1] == "فحص البوت" then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='.. bita..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end 
return sendMsg(msg.chat_id_,msg.id_,'\nٴ𐄬 ًاهلا عزيزي البوت هنا ادمن بالقروب \nٴ𐄬 وصلاحياته هي ↓ \nٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬\nٴ𐄬 تغير معلومات المجموعه ↞ ❪ '..info..' ❫\nٴ𐄬 حذف الرسائل ↞ ❪ '..delete..' ❫\nٴ𐄬 حظر المستخدمين ↞ ❪ '..restrict..' ❫\nٴ𐄬 دعوة مستخدمين ↞ ❪ '..invite..' ❫\nٴ𐄬 تثبيت الرسائل ↞ ❪ '..pin..' ❫\nٴ𐄬 اضافة مشرفين جدد ↞ ❪ '..promote..' ❫\n\nٴ𐄬 ملاحضه » علامة ❪  ꪜ ❫ تعني لديه الصلاحية وعلامة ❪ ✘ ❫ تعني ليس ليديه الصلاحيه')   
end
end
end

if MsgText[1] == "تثبيت" and msg.reply_id then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(bita..'lock_pin'..msg.chat_id_) then
return "لا يمكنك التثبيت الامر مقفول من قبل الاداره ."
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(bita..":MsgIDPin:"..msg.chat_id_,msg.reply_id)
return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 **ً أهلا عزيزي "..msg.TheRankCmd.." \nٴ𐄬 ** تم تثبيت الرساله \n✓")
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** ًعذرا لا يمكنني التثبيت .\nٴ𐄬 ** لست مشرف او لا املك صلاحيه التثبيت \n')    
end
end,nil)
end
return false
end

if MsgText[1] == "الغاء التثبيت" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not msg.Director and redis:get(bita..'lock_pin'..msg.chat_id_) then
return "لا يمكنك الغاء التثبيت الامر مقفول من قبل الاداره"
else
local GroupID = msg.chat_id_:gsub('-100','')
tdcli_function({ID="UnpinChannelMessage",channel_id_ = GroupID},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 **ًأهلا عزيزي "..msg.TheRankCmd.."  \nٴ𐄬 ** تم الغاء تثبيت الرساله \n")    
elseif data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 **ٴ𐄬 عذراً لا يمكنني الغاء التثبيت .\nٴ𐄬 ** لست مشرف او لا املك صلاحيه التثبيت \n')    
elseif data.ID == "Error" and data.code_ == 400 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** ًعذرا عزيزي '..msg.TheRankCmd..' .\nٴ𐄬 ** لا توجد رساله مثبته لاقوم بازالتها \n')    
end
end,nil)
end
return false
end


if MsgText[1] == "تقييد" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="tqeed"}) 
end 
return false
end

if MsgText[1] == "فك التقييد" or MsgText[1] == "فك تقييد" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="fktqeed"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="fktqeed"}) 
end 
return false
end


if MsgText[1] == "رفع مميز" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then
if redis:get(bita..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(bita..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(bita..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setwhitelist"})
end
end
if redis:get(bita..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 ** أهلا عزيزي "..msg.TheRankCmd.."\nٴ𐄬 ** الرفع معطل \n")
end
return false
end


if MsgText[1] == "تنزيل مميز" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remwhitelist"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remwhitelist"})
end 
return false
end


if (MsgText[1] == "رفع المدير"  or MsgText[1] == "رفع مدير" ) then
if not msg.Creator then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
if not MsgText[2] and msg.reply_id then
if redis:get(bita..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setowner"})
end
end
if redis:get(bita..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setowner"})
end
end
if redis:get(bita..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setowner"})
end
end
if redis:get(bita..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 ** أهلاً عزيزي "..msg.TheRankCmd.."\nٴ𐄬 ** الرفع معطل \n")
end
return false
end


if (MsgText[1] == "تنزيل المدير" or MsgText[1] == "تنزيل مدير" ) then
if not msg.Creator then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remowner"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remowner"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remowner"})
end 
return false
end


if (MsgText[1] == "رفع منشى اساسي" or MsgText[1] == "رفع منشئ اساسي") then
if not msg.SudoUser then return "ٴ𐄬 **هذا الامر يخص {المطور,المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setkara"}) 
return false
end 
end

if (MsgText[1] == "تنزيل منشى اساسي" or MsgText[1] == "تنزيل منشئ اساسي") then
if not msg.SudoUser then return "ٴ𐄬 **هذا الامر يخص {المطور,المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remkara"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remkara"}) 
return false
end 
end


if (MsgText[1] == "رفع منشى" or MsgText[1] == "رفع منشئ") then
if not msg.Kara then return "ٴ𐄬 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="setmnsha"})
end  
return false
end


if (MsgText[1] == "تنزيل منشى" or MsgText[1] == "تنزيل منشئ" ) then
if not msg.Kara then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشى الاساسي فقط} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmnsha"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="remmnsha"})
end 
return false
end


if MsgText[1] == "رفع ادمن" then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not MsgText[2] and msg.reply_id then
if redis:get(bita..'lock:kara:'..msg.chat_id_) == 'off' then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="promote"})
end
end
if redis:get(bita..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="promote"})
end
end
if redis:get(bita..'lock:kara:'..msg.chat_id_) == 'off' then
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="promote"})
end
end
if redis:get(bita..'lock:kara:'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 ** أهلا عزيزي "..msg.TheRankCmd.."\nٴ𐄬 ** الرفع معطل \n")
end
return false
end



if MsgText[1] == "تنزيل ادمن" then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="demote"})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="demote"})
end 
return false
end



if MsgText[1] == "تنزيل الكل" then
if not msg.Creator then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end

local Admins = redis:scard(bita..'admins:'..msg.chat_id_)
redis:del(bita..'admins:'..msg.chat_id_)
local NumMDER = redis:scard(bita..'owners:'..msg.chat_id_)
redis:del(bita..'owners:'..msg.chat_id_)
local MMEZEN = redis:scard(bita..'whitelist:'..msg.chat_id_)
redis:del(bita..'whitelist:'..msg.chat_id_)

return "ٴ𐄬 أهلاً عزيزي "..msg.TheRankCmd.." ↓\nٴ𐄬 تم تنزيل ❴ "..Admins.." ❵ من الادمنيه\nٴ𐄬 تم تنزيل ❴ "..NumMDER.." ❵ من المدراء\nٴ𐄬 تم تنزيل ❴ "..MMEZEN.." ❵ من المميزين\n\nٴ𐄬 تم تـنـزيـل الـكـل بـنـجـاح\n" 
end


--{ Commands For locks }

if MsgText[1] == "قفل" then

if MsgText[2] == "الكل"		 then return lock_All(msg) end
if MsgText[2] == "الوسائط" 	 then return lock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 	 then return tqeed_photo(msg) end
if MsgText[2] == "الفيديو بالتقييد"  then return tqeed_video(msg) end
if MsgText[2] == "المتحركه بالتقييد" then return tqeed_gif(msg) end
if MsgText[2] == "التوجيه بالتقييد"  then return tqeed_fwd(msg) end
if MsgText[2] == "الروابط بالتقييد"  then return tqeed_link(msg) end
if MsgText[2] == "الدردشه"    	     then return mute_text(msg) end
if MsgText[2] == "المتحركه" 		 then return mute_gif(msg) end
if MsgText[2] == "الصور" 			 then return mute_photo(msg) end
if MsgText[2] == "الفيديو"			 then return mute_video(msg) end
if MsgText[2] == "البصمات" 		then  return mute_audio(msg) end
if MsgText[2] == "الصوت" 		then return mute_voice(msg) end
if MsgText[2] == "الملصقات" 	then return mute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return mute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return mute_forward(msg) end
if MsgText[2] == "الموقع"	 	then return mute_location(msg) end
if MsgText[2] == "الملفات" 		then return mute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return mute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return mute_inline(msg) end
if MsgText[2] == "الكيبورد" 	then return mute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return lock_link(msg) end
if MsgText[2] == "التاك" 		then return lock_tag(msg) end
if MsgText[2] == "المعرفات" 	then return lock_username(msg) end
if MsgText[2] == "التعديل" 		then return lock_edit(msg) end
if MsgText[2] == "الكلايش" 		then return lock_spam(msg) end
if MsgText[2] == "التكرار" 		then return lock_flood(msg) end
if MsgText[2] == "البوتات" 		then return lock_bots(msg) end
if MsgText[2] == "البوتات بالطرد" 	then return lock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return lock_markdown(msg) end
if MsgText[2] == "الويب" 		then return lock_webpage(msg) end 
if MsgText[2] == "التثبيت" 		then return lock_pin(msg) end 
end

--{ Commands For Unlocks }
if MsgText[1] == "فتح" 		then 
if MsgText[2] == "الكل" then return Unlock_All(msg) end
if MsgText[2] == "الوسائط" then return Unlock_Media(msg) end
if MsgText[2] == "الصور بالتقييد" 		then return fktqeed_photo(msg) 	end
if MsgText[2] == "الفيديو بالتقييد" 	then return fktqeed_video(msg) 	end
if MsgText[2] == "المتحركه بالتقييد" 	then return fktqeed_gif(msg) 	end
if MsgText[2] == "التوجيه بالتقييد" 	then return fktqeed_fwd(msg) 	end
if MsgText[2] == "الروابط بالتقييد" 	then return fktqeed_link(msg) 	end
if MsgText[2] == "المتحركه" 	then return unmute_gif(msg) 	end
if MsgText[2] == "الدردشه" 		then return unmute_text(msg) 	end
if MsgText[2] == "الصور" 		then return unmute_photo(msg) 	end
if MsgText[2] == "الفيديو" 		then return unmute_video(msg) 	end
if MsgText[2] == "البصمات" 		then return unmute_audio(msg) 	end
if MsgText[2] == "الصوت" 		then return unmute_voice(msg) 	end
if MsgText[2] == "الملصقات" 	then return unmute_sticker(msg) end
if MsgText[2] == "الجهات" 		then return unmute_contact(msg) end
if MsgText[2] == "التوجيه" 		then return unmute_forward(msg) end
if MsgText[2] == "الموقع" 		then return unmute_location(msg) end
if MsgText[2] == "الملفات" 		then return unmute_document(msg) end
if MsgText[2] == "الاشعارات" 	then return unmute_tgservice(msg) end
if MsgText[2] == "الانلاين" 		then return unmute_inline(msg) 	end
if MsgText[2] == "الكيبورد" 	then return unmute_keyboard(msg) end
if MsgText[2] == "الروابط" 		then return unlock_link(msg) 	end
if MsgText[2] == "التاك" 		then return unlock_tag(msg) 	end
if MsgText[2] == "المعرفات" 	then return unlock_username(msg) end
if MsgText[2] == "التعديل" 		then return unlock_edit(msg) 	end
if MsgText[2] == "الكلايش" 		then return unlock_spam(msg) 	end
if MsgText[2] == "التكرار" 		then return unlock_flood(msg) 	end
if MsgText[2] == "البوتات" 		then return unlock_bots(msg) 	end
if MsgText[2] == "البوتات بالطرد" 	then return unlock_bots_by_kick(msg) end
if MsgText[2] == "الماركدوان" 	then return unlock_markdown(msg) end
if MsgText[2] == "الويب" 		then return unlock_webpage(msg) 	end
if MsgText[2] == "التثبيت" 		then return unlock_pin(msg) end 
end
 
if MsgText[1] == "انشاء رابط" then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(bita..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(bita..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(bita..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 **تم انشاء رابط جديد \nٴ𐄬 ["..LinkGp.."]\nٴ𐄬 لعرض الرابط ارسل { الرابط } \n")
else
return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 لا يمكنني انشاء رابط للمجموعه .\nٴ𐄬 لانني لست مشرف في المجموعه \n")
end
else
return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 لقد قمت بانشاء الرابط سابقا .\nٴ𐄬 ارسل { الرابط } لرؤيه الرابط  \n")
end
return false
end 

if MsgText[1] == "ضع رابط" then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:setex(bita..'linkGroup'..msg.sender_user_id_,300,true)
return 'ٴ𐄬 عزيزي قم برسال الرابط الجديد ...🍂'
end

if MsgText[1] == "الرابط" then
if not redis:get(bita..'linkGroup'..msg.chat_id_) then 
return "ٴ𐄬 ** اوه لا يوجد رابط .\nٴ𐄬 **لانشاء رابط ارسل { `انشاء رابط` }\n" 
end
local GroupName = redis:get(bita..'group:name'..msg.chat_id_)
local GroupLink = redis:get(bita..'linkGroup'..msg.chat_id_)
local LinkG = "["..GroupName.."]("..GroupLink..")"
return 
sendMsgg(msg.chat_id_,msg.id_,LinkG)
end
  

if MsgText[1] == "الرابط خاص" then
if not msg.Admin then return "ٴ𐄬 *│*هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local GroupLink = redis:get(bita..'linkGroup'..msg.chat_id_)
if not GroupLink then return "ٴ𐄬 ** اوه لا يوجد هنا رابط\nٴ𐄬 *رجائا اكتب [ضع رابط]*" end
local Text = "ٴ𐄬 رابـط الـمـجـمـوعه ٴ𐄬 \n"..Flter_Markdown(redis:get(bita..'group:name'..msg.chat_id_)).." :\n\n["..GroupLink.."]\n"
local info, res = https.request(ApiToken..'/sendMessage?chat_id='..msg.sender_user_id_..'&text='..URL.escape(Text)..'&disable_web_page_preview=true&parse_mode=Markdown')
if res == 403 then
return "ٴ𐄬 **عذرا عزيزي \nٴ𐄬 لم استطيع ارسالك الرابط لانك قمت بحظر البوت\n!"
elseif res == 400 then
return "ٴ𐄬 **عذرا عزيزي \nٴ𐄬 لم استطيع ارسالك الرابط يجب عليك مراسله البوت اولا \n!"
end
if res == 200 then 
return "ٴ𐄬 **أهلاً عزيزي "..msg.TheRankCmd.."  \nٴ𐄬 تم ارسال الرابط خاص لك ."
end
end


if MsgText[1] == "ضع القوانين" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:setex(bita..'rulse:witting'..msg.sender_user_id_,300,true)
return 'ٴ𐄬 حسننا عزيزي  .\nٴ𐄬 الان ارسل القوانين  للمجموعه .'
end

if MsgText[1] == "القوانين" then
if not redis:get(bita..'rulse:msg'..msg.chat_id_) then 
return "ٴ𐄬 **مرحباً عزيري القوانين كلاتي .\nٴ𐄬 ممنوع نشر الروابط \nٴ𐄬 ممنوع التكلم او نشر صور اباحيه \nٴ𐄬 ممنوع  اعاده توجيه\nٴ𐄬 ممنوع التكلم بالسياسة \nٴ𐄬 الرجاء احترام المدراء والادمنيه\n"
else 
return "*ٴ𐄬 القوانين :*\n"..redis:get(bita..'rulse:msg'..msg.chat_id_) 
end 
end


if MsgText[1] == "ضع تكرار" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "ٴ𐄬 ** حدود التكرار ,  يجب ان تكون ما بين  *[2-50]*" 
end
redis:set(bita..'flood'..msg.chat_id_,MsgText[2]) 
return "ٴ𐄬 ** تم وضع التكرار » { *"..MsgText[2].."* }"
end



if MsgText[1] == "مسح" then
if not MsgText[2] and msg.reply_id then 
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if 500 < tonumber(MsgText[2]) then return "ٴ𐄬 ** حدود المسح ,  يجب ان تكون ما بين  *[2-100]*" end
local DelMsg = MsgText[2] + 1
GetHistory(msg.chat_id_,DelMsg,function(arg,data)
All_Msgs = {}
for k, v in pairs(data.messages_) do
if k ~= 0 then
if k == 1 then
All_Msgs[0] = v.id_
else
table.insert(All_Msgs,v.id_)
end  
end 
end 
if tonumber(DelMsg) == data.total_count_ then
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*ٴ𐄬 * تـم مسح ←  { *"..MsgText[2].."* } من الرسائل  \n")
end,nil))
else
pcall(tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"*ٴ𐄬 * تـم مسح ←  { *"..MsgText[2].."* } من الرسائل  \n")
end,nil))
end
end)
return false
end

if MsgText[2] == "الادمنيه" then 
if not msg.Director then return "ٴ𐄬 *هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end

local Admins = redis:scard(bita..'admins:'..msg.chat_id_)
if Admins ==0 then  
return "ٴ𐄬 ** اوه هنالك خطأ .\nٴ𐄬 عذراً لا يوجد ادمنيه ليتم مسحهم ." 
end
redis:del(bita..'admins:'..msg.chat_id_)
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."   \nٴ𐄬 تم مسح {"..Admins.."} من الادمنيه في البوت \n"
end


if MsgText[2] == "قائمه المنع" then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local Mn3Word = redis:scard(bita..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "ٴ𐄬 ** عذراً لا توجد كلمات ممنوعه ليتم حذفها" 
end
redis:del(bita..':Filter_Word:'..msg.chat_id_)
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."   \nٴ𐄬 تم مسح {*"..Mn3Word.."*} كلمات من المنع"
end


if MsgText[2] == "القوانين" then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(bita..'rulse:msg'..msg.chat_id_) then 
return "ٴ𐄬 عذراً لا يوجد قوانين ليتم مسحه \n!" 
end
redis:del(bita..'rulse:msg'..msg.chat_id_)
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."   \nٴ𐄬 تم حذف القوانين بنجاح"
end


if MsgText[2] == "الترحيب"  then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(bita..'welcome:msg'..msg.chat_id_) then 
return "ٴ𐄬 ** اوه هنالك خطأ .\nٴ𐄬 عذراً لا يوجد ترحيب ليتم مسحه ." 
end
redis:del(bita..'welcome:msg'..msg.chat_id_)
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."   \nٴ𐄬 تم حذف الترحيب بنجاح \n"
end


if MsgText[2] == "الاساسيين" then
if not msg.SudoUser then return "ٴ𐄬 **هذا الامر يخص {المطور} فقط  \n" end
local NumMnsha = redis:scard(bita..':Hussain:'..msg.chat_id_)
if NumMnsha ==0 then 
return "ٴ𐄬 عذراً لا يوجد منشى اساسي \n!" 
end
redis:del(bita..':Hussain:'..msg.chat_id_)
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."   \nٴ𐄬  تم مسح {* "..NumMnsha.." *} المنشى الاساسي \n✓"
end


if MsgText[2] == "المنشئيين" then
if not msg.SudoUser then return "ٴ𐄬 **هذا الامر يخص {المطور} فقط  \n" end
local NumMnsha = redis:scard(bita..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "ٴ𐄬 عذراً لا يوجد منشئيين ليتم مسحهم \n!" 
end
redis:del(bita..':MONSHA_BOT:'..msg.chat_id_)
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."   \nٴ𐄬 تم مسح {* "..NumMnsha.." *} من المنشئيين\n"
end


if MsgText[2] == "المدراء" then
if not msg.Creator then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local NumMDER = redis:scard(bita..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "ٴ𐄬 عذراً لا يوجد مدراء ليتم مسحهم \n!" 
end
redis:del(bita..'owners:'..msg.chat_id_)
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."   \nٴ𐄬 تم مسح {* "..NumMDER.." *} من المدراء  \n"
end

if MsgText[2] == 'المحظورين' then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end

local list = redis:smembers(bita..'banned:'..msg.chat_id_)
if #list == 0 then return "*ٴ𐄬 لا يوجد مستخدمين محظورين  *" end
message = 'ٴ𐄬 ** قائمه الاعضاء المحظورين :\n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(bita..'banned:'..msg.chat_id_)
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."   \nٴ𐄬  تم مسح {* "..#list.." *} من المحظورين  \n"
end

if MsgText[2] == 'المكتومين' then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local MKTOMEN = redis:scard(bita..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "ٴ𐄬 ** لا يوجد مستخدمين مكتومين في المجموعه " 
end
redis:del(bita..'is_silent_users:'..msg.chat_id_)
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."   \nٴ𐄬 تم مسح {* "..MKTOMEN.." *} من المكتومين  \n"
end

if MsgText[2] == 'المميزين' then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local MMEZEN = redis:scard(bita..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "*ٴ𐄬 *لا يوجد مستخدمين مميزين في المجموعه " 
end
redis:del(bita..'whitelist:'..msg.chat_id_)
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."   \nٴ𐄬 تم مسح {* "..MMEZEN.." *} من المميزين  \n"
end


if MsgText[2] == 'الرابط' then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(bita..'linkGroup'..msg.chat_id_) then
return "*ٴ𐄬 *لا يوجد رابط مضاف اصلا " 
end
redis:del(bita..'linkGroup'..msg.chat_id_)
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."   \nٴ𐄬 تم مسح رابط المجموعه \n"
end


end 
--End del 


if MsgText[1] == "ضع اسم" then
if not msg.Creator then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
redis:setex(bita..'name:witting'..msg.sender_user_id_,300,true)
return "ٴ𐄬 حسننا عزيزي  .\nٴ𐄬 الان ارسل الاسم  للمجموعه .\n"
end


if MsgText[1] == "مسح الصوره" then
if not msg.Creator then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
https.request(ApiToken.."/deleteChatPhoto?chat_id="..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم مسح الصوره المجموعه .\n')
end


if MsgText[1] == "ضع صوره" then
if not msg.Creator then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then 
photo_id = data.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = data.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = GetInputFile(photo_id)},
function(arg,data)
if data.ID == "Ok" then
--return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم تغيير صوره المجموعه ⠀\n')
elseif  data.code_ == 3 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ليس لدي صلاحيه تغيير الصوره \nٴ𐄬 يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n')
end
end, nil)
end

end ,nil)
return false
else 
redis:setex(bita..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return 'ٴ𐄬 حسننا عزيزي .\nٴ𐄬 الان قم بارسال الصوره\n' 
end 
end


if MsgText[1] == "ضع وصف" then 
if not msg.Creator then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
redis:setex(bita..'about:witting'..msg.sender_user_id_,300,true) 
return "ٴ𐄬 حسننا عزيزي .\nٴ𐄬 الان ارسل الوصف  للمجموعه\n" 
end


if MsgText[1] == "طرد البوتات" then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID="ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 لا يـوجـد بـوتـات في الـمـجـمـوعـه .") 
else
local NumBot = 0
local NumBotAdmin = 0
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then
kick_user(v.user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
NumBot = NumBot + 1
else
NumBotAdmin = NumBotAdmin + 1
end
local TotalBots = NumBot + NumBotAdmin  
if TotalBots  == Total - 1 then
local TextR  = "ٴ𐄬 عـدد الـبـوتات ٴ𐄬⊱ {* "..(Total - 1).." *} ⊰ٴ𐄬\n\n"
if NumBot == 0 then 
TextR = TextR.."ٴ𐄬 لا يـمـكـن طردهم لانـهـم مشـرفـين .\n"
else
if NumBotAdmin >= 1 then
TextR = TextR.."ٴ𐄬 لم يتم طـرد {* "..NumBotAdmin.." *} بوت لأنهم مـشـرفين."
else
TextR = TextR.."ٴ𐄬 تم طـرد كــل البوتات بنجاح .\n"
end
end
return sendMsg(msg.chat_id_,msg.id_,TextR) 
end
end)
end
end
end

end,nil)

return false
end


if MsgText[1] == "كشف البوتات" then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = 'ٴ𐄬 قـائمه البوتات الـحالية\n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "» *♚*"
else
BotAdmin = ""
end

NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

ٴ𐄬 لديك {]]..total..[[} بوتات
ٴ𐄬 ملاحظة : الـ ♚ تعنـي ان البوت مشرف في المجموعـة.]]
sendMsg(msg.chat_id_,msg.id_,AllBots) 
end

end,nil)
end

end,nil)
return false
end


if MsgText[1] == 'طرد المحذوفين' then
if not msg.Creator then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 جارٍ البحث عن الحسابات المحذوفة ...')
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100','')
,offset_ = 0,limit_ = 200},function(arg,data)
if data.total_count_ and data.total_count_ <= 200 then
Total = data.total_count_ or 0
else
Total = 200
end
local NumMem = 0
local NumMemDone = 0
for k, v in pairs(data.members_) do 
GetUserID(v.user_id_,function(arg,datax)
if datax.type_.ID == "UserTypeDeleted" then 
NumMemDone = NumMemDone + 1
kick_user(v.user_id_,msg.chat_id_,function(arg,data)  
redis:srem(bita..':MONSHA_BOT:'..msg.chat_id_,v.user_id_)
redis:srem(bita..'whitelist:'..msg.chat_id_,v.user_id_)
redis:srem(bita..'owners:'..msg.chat_id_,v.user_id_)
redis:srem(bita..'admins:'..msg.chat_id_,v.user_id_)
end)
end
NumMem = NumMem + 1
if NumMem == Total then
if NumMemDone >= 1 then
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 تم طـرد {* "..NumMemDone.." *} من الحسابات المحذوفه‏‏ .")
else
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 لا يوجد حسابات محذوفه في المجموعه .')
end
end
end,nil)
end
end,nil)
return false
end  

if MsgText[1] == "ايدي" or MsgText[1]:lower() == "id" then
if not MsgText[2] and not msg.reply_id then

if redis:get(bita..'lock_id'..msg.chat_id_) then 
local msgs = redis:get(bita..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserNameID = "@"..data.username_.."" else UserNameID = "" end
local points = redis:get(bita..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
nko = points
else
nko = '0'
end
local rfih = (redis:get(bita..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local NumGha = (redis:get(bita..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local Namei = FlterName(data.first_name_..' '..(data.last_name_ or ""),20)
GetPhotoUser(msg.sender_user_id_,function(arg, data)
if redis:get(bita.."getidstatus"..msg.chat_id_) == "Photo" then
	if data.photos_[0] then 
		ali = {'شهل صورة😍😌','لا قيمه للقمر امام وجهك🌚🥀','خليني احبك🙈❤️','ببكن خاص 🌚😹','نكبل 🙈♥','منور اليوم 😻','فديت الحلو🌚😹','شهل عسل ،₍🍯😻⁾ ','كلي يا حلو منين الله جابك🙈❤️','يهلا بلعافيه😍','مارتاحلك😐','تحبني؟🙈',
		}
		ssssys = ali[math.random(#ali)]
		if not redis:get("KLISH:ID") then
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,'𐄬 NAME 𖦹   '..Namei..'     \n𐄬 USE 𖥳 '..UserNameID..' .\n𐄬 MSG 𖦹 '..msgs..' .\n𐄬 STA 𖥳 '..msg.TheRank..' .\n𐄬 iD 𖦹 '..msg.sender_user_id_..' .',dl_cb,nil)
		else
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendPhoto(msg.chat_id_,msg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,"🎇│"..ssssys.."\n"..Text.."",dl_cb,nil)
		end
	else
		if not redis:get("KLISH:ID") then
		sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 لا يمكنني عرض صورتك لانك قمت بحظر البوت او انك لاتملك صوره في بروفيلك ...!\n𐄬 NAME 𖦹   '..Namei..'     \n𐄬 USE 𖥳 '..UserNameID..' .\n𐄬 MSG 𖦹 '..msgs..' .\n𐄬 STA 𖥳 '..msg.TheRank..' .\n𐄬 iD 𖦹 '..msg.sender_user_id_..' .')
		else
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Text))
		end
	end
else
	if redis:get("KLISH:ID") then
		Text = redis:get("KLISH:ID")
		Text = Text:gsub('IDGET',msg.sender_user_id_)
		Text = Text:gsub('USERGET',UserNameID)
		Text = Text:gsub('RTBGET',msg.TheRank)
		Text = Text:gsub('TFGET',Get_Ttl(msgs))
		Text = Text:gsub('MSGGET',msgs)
		Text = Text:gsub('edited',rfih)
		Text = Text:gsub('adduser',NumGha)
		Text = Text:gsub('User_Points',nko)
		sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Text))
		else
		sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 الايدي بالصوره معطل\n𐄬 NAME 𖦹   '..Namei..' .\n𐄬 USE 𖥳 '..UserNameID..' .\n𐄬 MSG 𖦹 '..msgs..' .\n𐄬 STA 𖥳 '..msg.TheRank..' .\n𐄬 iD 𖦹 '..msg.sender_user_id_..' .')
		end
end

end) 
end ,nil)
end
return false

end

if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="iduser"})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="iduser"})
return false
end 
return false
end

if MsgText[1] == "الرتبه" and not MsgText[2] and msg.reply_id then 
return GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="rtba"})
end


if MsgText[1]== 'رسائلي' or MsgText[1] == 'رسايلي' or MsgText[1] == 'احصائياتي'  then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(bita..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(bita..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(bita..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(bita..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(bita..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(bita..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(bita..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(bita..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(bita..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info =  " \nٴ𐄬 ( الاحـصـائـيـات الـرسـائـلك )\n \n"
.."ٴ𐄬 الـرسـائـل ( "..msgs.." )\n"
.."ٴ𐄬 الـجـهـات ( "..NumGha.." )\n"
.."ٴ𐄬 الـصـور ( "..photo.." )\n"
.."ٴ𐄬 الـمـتـحـركـه ( "..animation.." )\n"
.."ٴ𐄬 الـمـلـصـقات ( "..sticker.." )\n"
.."ٴ𐄬 الـبـصـمـات ( "..voice.." )\n"
.."ٴ𐄬 الـصـوت ( "..audio.." )\n"
.."ٴ𐄬 الـفـيـديـو ( "..video.." )\n"
.."ٴ𐄬 الـتـعـديـل ( "..edited.." )\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'رسائلي'  then
local msgs = redis:get(bita..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if rfih == 0 then  return "ٴ𐄬 **عذرا لا يوجد رسائل لك في البوت  ." end
redis:del(bita..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_)
return "ٴ𐄬 **تم مسح {* "..msgs.." *} من رسائلك .\n"
end

if MsgText[1]== 'جهاتي' then
return 'ٴ𐄬 **  عدد جهاتك المضافة‏‏ ⇜ ❪ '..(redis:get(bita..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ❫ \n.'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'جهاتي'  then
local adduser = redis:get(bita..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if adduser == 0 then  return "ٴ𐄬 **عذرا ليس لديك جهات لكي يتم مسحها" end
redis:del(bita..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) 
return "ٴ𐄬 **تم مسح {* "..adduser.." *} من جهاتك\n✓"
end

if MsgText[1]== 'اسمي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local FlterName = FlterName(data.first_name_..'\n\n-اسمك الثاني ⇜ '..(data.last_name_ or ""),90)
local Get_info = "-اسمك الاول ⇜  "..FlterName.." \n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == 'مسح' and MsgText[2] == 'نقاطي'  then
local points = redis:get(bita..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
if points == 0 then  return "ٴ𐄬 **عذرا ليس لديك نقاط لكِ يتم مسحها" end
redis:del(bita..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
return "ٴ𐄬 **تم مسح {* "..points.." *} من نقاطك\n"
end

if MsgText[1] == 'معلوماتي' or MsgText[1] == 'موقعي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(bita..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(bita..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(bita..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(bita..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(bita..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(bita..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(bita..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(bita..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(bita..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="ٴ𐄬 اهلاً بك في معلوماتك . \n"
.."ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬\n"
.."ٴ𐄬 الأسم ( "..FlterName(data.first_name_..' '..(data.last_name_ or ""),25).." )\n"
.."ٴ𐄬 المعرف ( "..ResolveUser(data).." )\n"
.."ٴ𐄬 الأيدي ( `"..msg.sender_user_id_.."` )\n"
.."ٴ𐄬 رتبتك ( "..msg.TheRank.." )\n"
.."ٴ𐄬 ـ ( `"..msg.chat_id_.."` )\n"
.."ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬\n"
.." ٴ𐄬 الأحصائيات الرسائل .\n"
.."ٴ𐄬 الرسائل ( `"..msgs.."` )\n"
.."ٴ𐄬 الجهات ( `"..NumGha.."` )\n"
.."ٴ𐄬 الصور ( `"..photo.."` )\n"
.."ٴ𐄬 المتحركه ( `"..animation.."` )\n"
.."ٴ𐄬 الملصقات ( `"..sticker.."` )\n"
.."ٴ𐄬 البصمات ( `"..voice.."` )\n"
.."ٴ𐄬 الصوت ( `"..audio.."` )\n"
.."ٴ𐄬 الفيديو ( `"..video.."` )\n"
.."ٴ𐄬 التعديل (`"..edited.."` )\n"
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "مسح معلوماتي" then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:del(bita..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:del(bita..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:del(bita..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:del(bita..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:del(bita..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:del(bita..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:del(bita..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:del(bita..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:del(bita..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info ="ٴ𐄬 أهلاً عزيزي تم مسح جميع معلوماتك "
return sendMsg(msg.chat_id_,msg.id_,Get_info)    
end,nil)
return false
end

if MsgText[1] == "تفعيل" then

if MsgText[2] == "الردود" 	then return unlock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return unlock_brod(msg) end
if MsgText[2] == "الايدي" 	then return unlock_ID(msg) end
if MsgText[2] == "االترحيب" 	then return unlock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return unlock_waring(msg) end 
end




if MsgText[1] == "تعطيل" then

if MsgText[2] == "الردود" 	then return lock_replay(msg) end
if MsgText[2] == "الاذاعه" 	then return lock_brod(msg) end
if MsgText[2] == "الايدي" 	then return lock_ID(msg) end
if MsgText[2] == "االترحيب" 	then return lock_Welcome(msg) end
if MsgText[2] == "التحذير" 	then return lock_waring(msg) end
end


if MsgText[1] == "ضع الترحيب" then 
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:set(bita..'welcom:witting'..msg.sender_user_id_,true) 
return "ٴ𐄬 حسننا عزيزي .\nٴ𐄬 ارسل كليشه الترحيب الان\n\nٴ𐄬 ملاحظه تستطيع اضافه دوال للترحيب مثلا :\nٴ𐄬 أظهار قوانين المجموعه  » *{القوانين}*  \nٴ𐄬  أظهار الاسم العضو » *{الاسم}*\nٴ𐄬 أظهار المعرف العضو » *{المعرف}*\nٴ𐄬 أظهار اسم المجموعه » *{المجموعه}*" 
end


if MsgText[1] == "الترحيب" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if redis:get(bita..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(bita..'welcome:msg'..msg.chat_id_))
else 
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."  \nٴ𐄬 نورت المجموعه \n" 
end 
end


if MsgText[1] == "كشف"  then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="whois"})
return false
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="whois"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="whois"}) 
return false
end 
end


if MsgText[1] == "طرد" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="kick"})  
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="kick"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="kick"}) 
return false
end 
end


if MsgText[1] == "حظر" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="ban"}) 
return false
end 
end


if (MsgText[1] == "الغاء الحظر" or MsgText[1] == "الغاء حظر") and msg.Admin then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="uban"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unban"})
return false
end 
end


if MsgText[1] == "كتم" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="silent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="silent"}) 
return false
end 
end


if MsgText[1] == "الغاء الكتم" or MsgText[1] == "الغاء كتم" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unsilent"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unktm"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unsilent"}) 
return false
end 
end

if MsgText[1] == "المكتومين" then 
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return MuteUser_list(msg) 
end

if MsgText[1] == "المحظورين" then 
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return GetListBanned(msg) 
end

if MsgText[1] == "رفع الادمنيه" then
if not msg.Creator then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ} فقط  \n" end
return set_admins(msg) 
end

end -- end of insert group 


if MsgText[1] == 'مسح' and MsgText[2] == 'المطورين'  then
if not msg.SudoBase then return"ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
local mtwren = redis:scard(bita..':SUDO_BOT:')
if mtwren == 0 then  return "ٴ𐄬 ** عذراً لا يوجد مطورين في البوت ." end
redis:del(bita..':SUDO_BOT:') 
return "ٴ𐄬 ** تم مسح {* "..mtwren.." *} من المطورين .\n"
end

if MsgText[1] == 'مسح' and MsgText[2] == "قائمه العام"  then
if not msg.SudoBase then return"ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
local addbannds = redis:scard(bita..'gban_users')
if addbannds ==0 then 
return "*ٴ𐄬 قائمة الحظر فارغه .*" 
end
redis:del(bita..'gban_users') 
return "ٴ𐄬 ** تـم مـسـح { *"..addbannds.." *} من قائمه العام\n" 
end 

if msg.SudoBase then

if MsgText[1] == "رفع مطور" then
if not msg.SudoBase then return "ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="up_sudo"}) 
return false
end 
end

if MsgText[1] == "تنزيل مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudo"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="dn_sudo"}) 
return false
end 
end

if MsgText[1] == "تنظيف المجموعات" or MsgText[1] == "تنظيف المجموعات 🗑" then
local groups = redis:smembers(bita..'group:ids')
local GroupsIsFound = 0
for i = 1, #groups do 
GroupTitle(groups[i],function(arg,data)
if data.code_ and data.code_ == 400 then
rem_data_group(groups[i])
print(" Del Group From list ")
else
print(" Name Group : "..data.title_)
GroupsIsFound = GroupsIsFound + 1
end
print(GroupsIsFound..' : '..#groups..' : '..i)
if #groups == i then
local GroupDel = #groups - GroupsIsFound 
if GroupDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** جـيـد , لا توجد مجموعات وهميه \n')
else
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** عدد المجموعات ٴ𐄬⊱ { *'..#groups..'*  } ⊰ٴ𐄬\nٴ𐄬 ** تـم تنظيف  ٴ𐄬⊱ { *'..GroupDel..'*  } ⊰ٴ𐄬 مجموعه \nٴ𐄬 ** اصبح العدد الحقيقي الان ٴ𐄬⊱ { *'..GroupsIsFound..'*  } ⊰ٴ𐄬 مجموعه')
end
end
end)
end
return false
end
if MsgText[1] == "تنظيف المشتركين" or MsgText[1] == "تنظيف المشتركين 🗑" then
local pv = redis:smembers(bita..'users')
local NumPvDel = 0
for i = 1, #pv do
GroupTitle(pv[i],function(arg,data)
sendChatAction(pv[i],"Typing",function(arg,data)
if data.ID and data.ID == "Ok"  then
print("Sender Ok")
else
print("Failed Sender Nsot Ok")
redis:srem(bita..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
if NumPvDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 جـيـد , لا يوجد مشتركين وهمي')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** عدد المشتركين ٴ𐄬⊱ { *'..#pv..'*  } ⊰ٴ𐄬\nٴ𐄬 ** تـم تنظيف  ٴ𐄬⊱ { *'..NumPvDel..'*  } ⊰ٴ𐄬 مشترك \nٴ𐄬 ** اصبح العدد الحقيقي الان ٴ𐄬⊱ { *'..SenderOk..'*  } ⊰ٴ𐄬 من المشتركين') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "ضع صوره للترحيب" or MsgText[1]=="ضع صوره للترحيب 🌄" then
redis:setex(bita..'welcom_ph:witting'..msg.sender_user_id_,300,true) 
return'ٴ𐄬 حسننا عزيزي .\nٴ𐄬 الان قم بارسال الصوره للترحيب \n' 
end

if MsgText[1] == "تعطيل" and MsgText[2] == "البوت خدمي" then
return lock_service(msg) 
end

if MsgText[1] == "تفعيل" and MsgText[2] == "البوت خدمي" then 
return unlock_service(msg) 
end

if MsgText[1] == "صوره الترحيب" then
local Photo_Weloame = redis:get(bita..':WELCOME_BOT')
if Photo_Weloame then
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[ٴ𐄬 اهلا انا بوت]]..redis:get(bita..':NameBot:')..[[ .
ٴ𐄬 اختصاصي حماية‌‏ المجموعات
ٴ𐄬 مـن السبام والتوجيه‌‏ والتكرار والخ...

ٴ𐄬 مـعـرف الـمـطـور  » ]]..SUDO_USER:gsub([[\_]],'_')..[[ .
]])

return false
else
return "ٴ𐄬 لا توجد صوره مضافه للترحيب في البوت \nٴ𐄬 لاضافه صوره الترحيب ارسل `ضع صوره للترحيب`"
end
end

if MsgText[1] == "ضع كليشه المطور" then 
redis:setex(bita..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return 'ٴ𐄬 حسننا عزيزي .\nٴ𐄬 الان قم بارسال الكليشه \n' 
end

if MsgText[1] == "ضع شرط التفعيل" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(bita..':addnumberusers',MsgText[2]) 
return 'ٴ𐄬 ** تم وضـع شـرط التفعيل البوت اذا كانت المجموعه‏‏ اكثر مـن *【'..MsgText[2]..'】* عضـو  .\n' 
end

if MsgText[1] == "شرط التفعيل" then 
return'ٴ𐄬 ** شـرط التفعيل البوت اذا كانت المجموعه‏‏ اكثر مـن *【'..redis:get(bita..':addnumberusers')..'】* عضـو .\n' 
end 
end

if MsgText[1] == 'المجموعات' or MsgText[1] == "المجموعات 🌋" then
if not msg.SudoUser then return "ٴ𐄬 **هذا الامر يخص {المطور} فقط  \n" end
return 'ٴ𐄬 ** عدد المجموعات المفعلة » `'..redis:scard(bita..'group:ids')..'`  ➼' 
end



if MsgText[1] == "المشتركين" or MsgText[1] == "المشتركين Ⓜ" then
if not msg.SudoUser then return "ٴ𐄬 **هذا الامر يخص {المطور} فقط  \n" end
return 'ٴ𐄬 **عدد المشتركين في البوت : `'..redis:scard(bita..'users')..'` \n'
end

if MsgText[1] == 'قائمه المجموعات' then 
if not msg.SudoBase then return "ٴ𐄬 **هذا الامر يخص {المطور} فقط  \n" end
return chat_list(msg) 
end

if MsgText[1] == 'تعطيل' and MsgText[2] and MsgText[2]:match("-100(%d+)") then
if not msg.SudoUser then return "ٴ𐄬 **هذا الامر يخص {المطور} فقط  \n" end
if redis:sismember(bita..'group:ids',MsgText[2]) then
local name_gp = redis:get(bita..'group:name'..MsgText[2])
sendMsg(MsgText[2],0,'ٴ𐄬 ** تم تعطيل المجموعه بأمر من المطور  \nٴ𐄬 ** سوف اغادر ...\n✘')
rem_data_group(MsgText[2])
StatusLeft(MsgText[2],our_id)
return 'ٴ𐄬 ** تم تعطيل المجموعه ومغادرتها \nٴ𐄬 ** المجموعة » ['..name_gp..']\nٴ𐄬 ** الايدي » ( *'..MsgText[2]..'* )\n'
else 
return 'ٴ𐄬 ** لا توجد مجموعه مفعله بهذا الايدي .\n ' 
end 
end 

if MsgText[1] == 'المطور' then
return redis:get(bita..":TEXT_SUDO") or 'ٴ𐄬 لا توجد كليشه المطور .\nٴ𐄬 يمكنك اضافه كليشه من خلال الامر\n       " `ضع كليشه المطور` " \n'
end

if MsgText[1] == "اذاعه بالتثبيت" then
if not msg.SudoUser then return"*¦* هذا الامر يخص {المطور} فقط  \n " end
if not msg.SudoBase and not redis:get(bita..'lock_brod') then return "*¦* الاذاعه مقفوله من قبل المطور الاساسي  " end
redis:setex(bita..':prod_pin:'..msg.chat_id_..msg.sender_user_id_,300, true) 
return "¦ حسننا الان ارسل رساله ليتم اذاعتها بالتثبيت  \n " 
end


if MsgText[1] == "اذاعه عام بالتوجيه" or MsgText[1] == "اذاعه عام بالتوجيه 📣" then
if not msg.SudoUser then return"ٴ𐄬 **هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(bita..'lock_brod') then 
return "ٴ𐄬 ** الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(bita..'fwd:'..msg.sender_user_id_,300, true) 
return "ٴ𐄬 حسننا الان ارسل التوجيه للاذاعه \n" 
end

if MsgText[1] == "اذاعه عام" or MsgText[1] == "اذاعه عام 📢" then		
if not msg.SudoUser then return"ٴ𐄬 **هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(bita..'lock_brod') then 
return "ٴ𐄬 ** الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(bita..'fwd:all'..msg.sender_user_id_,300, true) 
return "ٴ𐄬 حسننا الان ارسل الكليشه للاذاعه عام \n" 
end

if MsgText[1] == "اذاعه خاص" or MsgText[1] == "اذاعه خاص 🗣" then		
if not msg.SudoUser then return "ٴ𐄬 **هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(bita..'lock_brod') then 
return "ٴ𐄬 ** الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(bita..'fwd:pv'..msg.sender_user_id_,300, true) 
return "ٴ𐄬 حسننا الان ارسل الكليشه للاذاعه خاص \n"
end

if MsgText[1] == "اذاعه" or MsgText[1] == "اذاعه 🗣" then		
if not msg.SudoUser then return"ٴ𐄬 **هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(bita..'lock_brod') then 
return "ٴ𐄬 ** الاذاعه مقفوله من قبل المطور الاساسي  ." 
end
redis:setex(bita..'fwd:groups'..msg.sender_user_id_,300, true) 
return "ٴ𐄬 حسننا الان ارسل الكليشه للاذاعه للمجموعات \n" 
end

if MsgText[1] == "المطورين" or MsgText[1] == "المطورين 🔥" then
if not msg.SudoUser then return"ٴ𐄬 **هذا الامر يخص {المطور} فقط  \nٴ𐄬 " end
return sudolist(msg) 
end
 
if MsgText[1] == "قائمه العام" or MsgText[1]=="قائمه العام 📜" then 
if not msg.SudoUser then return"ٴ𐄬 **هذا الامر يخص {المطور} فقط  \n" end
return GetListGeneralBanned(msg) 
end

if MsgText[1] == "تعطيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل ✖️") then 
if not msg.SudoBase then return"ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
return lock_twasel(msg) 
end

if MsgText[1] == "تفعيل" and (MsgText[2] == "التواصل" or MsgText[2]=="التواصل 🔛") then 
if not msg.SudoBase then return"ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
return unlock_twasel(msg) 
end

if MsgText[1] == "حظر عام" then
if not msg.SudoBase then 
return "ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" 
end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="banall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="bandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="banall"}) 
return false
end 
end

if MsgText[1] == "الغاء العام" or MsgText[1] == "الغاء عام" then
if not msg.SudoBase then return"ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,action_by_reply,{msg=msg,cmd="unbanall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unbandall"}) 
return false
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],action_by_username,{msg=msg,cmd="unbanall"}) 
return false
end 
end 

if MsgText[1] == "رتبتي" then return 'ٴ𐄬 ** رتبتك ←  ( '..msg.TheRank..' )\n' end

----------------- استقبال الرسائل ---------------
if MsgText[1] == "الغاء الامر ✖️" or MsgText[1] == "الغاء" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:del(bita..'welcom:witting'..msg.sender_user_id_,
bita..'rulse:witting'..msg.sender_user_id_,
bita..'rulse:witting'..msg.sender_user_id_,
bita..'name:witting'..msg.sender_user_id_,
bita..'about:witting'..msg.sender_user_id_,
bita..'fwd:all'..msg.sender_user_id_,
bita..'fwd:pv'..msg.sender_user_id_,
bita..'fwd:groups'..msg.sender_user_id_,
bita..'namebot:witting'..msg.sender_user_id_,
bita..'addrd_all:'..msg.sender_user_id_,
bita..'delrd:'..msg.sender_user_id_,
bita..":Witting_KleshaID"..msg.chat_id_..msg.sender_user_id_,
bita..':prod_pin:'..msg.chat_id_..msg.sender_user_id_,
bita..'addrd:'..msg.sender_user_id_,
bita..'delrdall:'..msg.sender_user_id_,
bita..":ForceSub:"..msg.sender_user_id_,
bita..'text_sudo:witting'..msg.sender_user_id_,
bita..'addrd:'..msg.chat_id_..msg.sender_user_id_,
bita..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return 'ٴ𐄬 ** تم إلغاء الأمر بنجاح .  \n'
end  


if (MsgText[1] ==  'تحديث السورس'  or MsgText[1] ==  'تحديث السورس 🔂' ) then
if not msg.SudoBase then return "*│*هذا الامر يخص {المطور الاساسي} فقط  \n" end
local GetVerison = https.request( 'https://raw.githubusercontent.com/baselabaza/BITAFILE/master/GetVersion.txt' ) or 0
print(GetVerison.." > "..version)
if GetVerison > version then
UpdateSourceStart = true
sendMsg(msg.chat_id_,msg.id_,' *╿* يوجد تحديث جديد الان \n*╽* جاري تنزيل وتثبيت التحديث  ...' )
redis:set(bita..":VERSION",GetVerison)
return false
else
return "╿الاصدار الحالي : *v"..version.."* \n*╽* لديـك احدث اصدار \n"
end
return false
end

if MsgText[1] == 'اصدار السورس' or MsgText[1] == 'الاصدار' then
return 'ٴ𐄬 اصدار سورس بيتٲ : *v'..version..'* \n'
end



if MsgText[1] == 'نسخه احتياطيه للمجموعات' then
if not msg.SudoBase then return"ٴ𐄬 *│*هذا الامر يخص {المطور الاساسي} فقط  \n" end
return buck_up_groups(msg)
end 

if MsgText[1] == 'رفع نسخه الاحتياطيه' then
if not msg.SudoBase then return "ٴ𐄬 *│*هذا الامر يخص {المطور الاساسي} فقط  \n" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessageDocument' then
local file_name = data.content_.document_.file_name_
if file_name:match('.json')then
if file_name:match('@[%a%d_]+.json') then
if file_name:lower():match('@[%a%d_]+') == Bot_User:lower() then 
io.popen("rm -f ../.telegram-cli/data/document/*")
local file_id = data.content_.document_.document_.id_ 
tdcli_function({ID = "DownloadFile",file_id_ = file_id},function(arg, data) 
if data.ID == "Ok" then
Uploaded_Groups_Ok = true
Uploaded_Groups_CH = msg.chat_id_
Uploaded_Groups_MS = msg.id_
print(Uploaded_Groups_CH)
print(Uploaded_Groups_MS)
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** جارٍ رفع النسخه انتظر قليلا ... \n')
end
end,nil)
else 
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 ** عذراً النسخه الاحتياطيه هذا ليست للبوت » ["..Bot_User.."]  \n")
end
else 
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** عذراً اسم الملف غير مدعوم للنظام او لا يتوافق مع سورس بيتٲ يرجاء جلب الملف الاصلي الذي قمت بسحبه وبدون تعديل ع الاسم\n')
end  
else
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** عذراً الملف ليس بصيغه Json !?\n')
end 
else
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** عذراً هذا ليس ملف النسحه الاحتياطيه للمجموعات\n')
end 
end,nil)
else 
return "ٴ𐄬 ** ارسل ملف النسخه الاحتياطيه اولا\nٴ𐄬 ** ثم قم بالرد على الملف وارسل \" `رفع نسخه الاحتياطيه` \" "
end 
return false
end

if (MsgText[1]=="تيست" or MsgText[1]=="test") then 
if not msg.SudoBase then return"ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
return "ٴ𐄬 البوت شـغــال ." 
end

if (MsgText[1]== "ايدي" or MsgText[1]=="ايديي🆔") and msg.type == "pv" then return  "\nٴ𐄬 اهلاً عزيزي المطور ايديك :\n\nٴ𐄬 "..msg.sender_user_id_.."\n"  end

if MsgText[1]== "قناة السورس" and msg.type == "pv" then
local inline = {{{text="-قنآهہ‏‏ آلسـورس اضـغـط هـنـآ ",url="https://t.me/baselabaza"}}}
send_key(msg.sender_user_id_,'   [قناة سورس : بيتٲ](https://t.me/baselabaza)' ,nil,inline,msg.id_)
return false
end

if (MsgText[1]== "الاحصائيات 💥" or MsgText[1]=="الاحصائيات") then
if not msg.SudoBase then return"ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
return 'ٴ𐄬 الاحصائيات . \n\nٴ𐄬 **عدد المجموعات المفعله : '..redis:scard(bita..'group:ids')..'\nٴ𐄬 **عدد المشتركين في البوت : '..redis:scard(bita..'users')..'\n'
end
---------------[End Function data] -----------------------
if MsgText[1]=="اضف رد عام" or MsgText[1]=="اضف رد عام ➕" then
if not msg.SudoBase then return"ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(bita..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,300,true)
redis:del(bita..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
return "ٴ𐄬 حسننا الان ارسل كلمة الرد العام .\n"
end


if MsgText[1]== 'مسح' and MsgText[2]== 'الردود' then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local names 	= redis:exists(bita..'replay:'..msg.chat_id_)
local photo 	= redis:exists(bita..'replay_photo:group:'..msg.chat_id_)
local voice 	= redis:exists(bita..'replay_voice:group:'..msg.chat_id_)
local imation   = redis:exists(bita..'replay_animation:group:'..msg.chat_id_)
local audio	 	= redis:exists(bita..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:exists(bita..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:exists(bita..'replay_video:group:'..msg.chat_id_)
if names or photo or voice or imation or audio or sticker or video then
redis:del(bita..'replay:'..msg.chat_id_,bita..'replay_photo:group:'..msg.chat_id_,bita..'replay_voice:group:'..msg.chat_id_,
bita..'replay_animation:group:'..msg.chat_id_,bita..'replay_audio:group:'..msg.chat_id_,bita..'replay_sticker:group:'..msg.chat_id_,bita..'replay_video:group:'..msg.chat_id_)
return "ٴ𐄬 تم مسح كل الردود ."
else
return 'ٴ𐄬 ** لا يوجد ردود ليتم مسحها \n'
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود العامه' then
if not msg.SudoBase then return"ٴ𐄬 للمطورين فقط ." end
local names 	= redis:exists(bita..'replay:all')
local photo 	= redis:exists(bita..'replay_photo:group:')
local voice 	= redis:exists(bita..'replay_voice:group:')
local imation 	= redis:exists(bita..'replay_animation:group:')
local audio 	= redis:exists(bita..'replay_audio:group:')
local sticker 	= redis:exists(bita..'replay_sticker:group:')
local video 	= redis:exists(bita..'replay_video:group:')
if names or photo or voice or imation or audio or sticker or video then
redis:del(bita..'replay:all',bita..'replay_photo:group:',bita..'replay_voice:group:',bita..'replay_animation:group:',bita..'replay_audio:group:',bita..'replay_sticker:group:',bita..'replay_video:group:')
return "ٴ𐄬 تم مسح كل الردود العامه ."
else
return "ٴ𐄬 لا يوجد ردود عامه ليتم مسحها ."
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد عام' then
if not msg.SudoBase then return"ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:set(bita..'delrdall:'..msg.sender_user_id_,true) 
return "ٴ𐄬 حسننا عزيزي  .\nٴ𐄬 الان ارسل الرد لمسحها من  المجموعات ."
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد' then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:set(bita..'delrd:'..msg.sender_user_id_,true)
return "ٴ𐄬 حسننا عزيزي  .\nٴ𐄬 الان ارسل الرد لمسحها من  للمجموعه ."
end

if MsgText[1]== 'الردود' then
if not msg.Director then return "ٴ𐄬 *│*هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local names  	= redis:hkeys(bita..'replay:'..msg.chat_id_)
local photo 	= redis:hkeys(bita..'replay_photo:group:'..msg.chat_id_)
local voice  	= redis:hkeys(bita..'replay_voice:group:'..msg.chat_id_)
local imation 	= redis:hkeys(bita..'replay_animation:group:'..msg.chat_id_)
local audio 	= redis:hkeys(bita..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:hkeys(bita..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:hkeys(bita..'replay_video:group:'..msg.chat_id_)
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return 'ٴ𐄬 **لا يوجد ردود مضافه حاليا \n' 
end
local ii = 1
local message = 'ٴ𐄬 **ردود البوت في المجموعه  :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره ) \n' 	 ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص ) \n'  	 ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..  voice[i]..' *}_*( بصمه ) \n' 	 ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه ) \n' ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه ) \n'  ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق ) \n' 	 ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو ) \n' ii = ii + 1 end
return message..'\n➖➖➖'
end

if MsgText[1]== 'الردود العامه' or MsgText[1]=='الردود العامه 🗨' then
if not msg.SudoBase then return "ٴ𐄬 للمطور فقط ." end
local names 	= redis:hkeys(bita..'replay:all')
local photo 	= redis:hkeys(bita..'replay_photo:group:')
local voice 	= redis:hkeys(bita..'replay_voice:group:')
local imation 	= redis:hkeys(bita..'replay_animation:group:')
local audio 	= redis:hkeys(bita..'replay_audio:group:')
local sticker 	= redis:hkeys(bita..'replay_sticker:group:')
local video 	= redis:hkeys(bita..'replay_video:group:')
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 then 
return 'ٴ𐄬 **لا يوجد ردود مضافه حاليا \n' 
end
local ii = 1
local message = 'ٴ𐄬 **الردود العامه في البوت :   :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *}_*( صوره ) \n' 	ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *}_*( نص ) \n'  	ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..	voice[i]..' *}_*( بصمه ) \n' 	ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *}_*( متحركه ) \n'ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *}_*( صوتيه ) \n' ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *}_*( ملصق ) \n' 	ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *}_*( فيديو ) \n'ii = ii + 1 end
return message..'\n➖➖➖'
end


if MsgText[1]=="اضف رد" and msg.GroupActive then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:setex(bita..'addrd:'..msg.chat_id_..msg.sender_user_id_,300,true) 
redis:del(bita..'replay1'..msg.chat_id_..msg.sender_user_id_)
return "ٴ𐄬 حسننا , الان ارسل كلمه الرد \n"
end

if MsgText[1] == "ضع اسم للبوت" or MsgText[1]== 'ضع اسم للبوت ©' then
if not msg.SudoBase then return"ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(bita..'namebot:witting'..msg.sender_user_id_,300,true)
return"ٴ𐄬 حسننا عزيزي .\nٴ𐄬 الان ارسل الاسم  للبوت ."
end



if MsgText[1] == 'server' then
if not msg.SudoUser then return "ٴ𐄬 للمطور فقط." end
return io.popen([[

linux_version=`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '📟 ❪ Seystem ❫\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*ٴ𐄬 ❪ Memory ❫\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*ٴ𐄬 ❪ HardDisk ❫\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*ٴ𐄬 ❪ Processor ❫\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*ٴ𐄬 ❪ Server[_]Login ❫\n*»» '`whoami`'*'
echo '*------------------------------\n*ٴ𐄬 ❪ Uptime ❫  \n*»» '"$uptime"'*'
]]):read('*all')
end


if MsgText[1] == 'السيرفر' then
if not msg.SudoUser then return "ٴ𐄬 للمطور فقط." end
return io.popen([[

linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo ' ( نظام التشغيل )\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*ٴ𐄬 ( الذاكره العشوائيه )\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*ٴ𐄬 ( وحـده الـتـخـزيـن )\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*ٴ𐄬 ( الـمــعــالــج )\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*ٴ𐄬 ❪ الــدخــول ❫\n*»» '`whoami`'*'
echo '*------------------------------\n*ٴ𐄬( مـده تـشغيـل الـسـيـرفـر )  \n*»» '"$uptime"'*'
]]):read('*all')
end


if msg.type == 'channel' and msg.GroupActive then
if MsgText[1] == "الاوامر" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \nٴ𐄬 " end
return [[
↤︎ ‌‌‏الاوامر ↓
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 م1 ↤︎ اوامر الاداره‌‏
ٴ𐄬 م2 ↤︎ اوامر اعدادات المجموعه‌‏
ٴ𐄬 م3 ↤︎ اوامر الحماية‌‏
ٴ𐄬 م4 ↤︎ اوامر الخدمه 
ٴ𐄬 م5 ↤︎ اوامر التسليه
ٴ𐄬 م6 ↤︎ اوامر التعطيل و التفعل
ٴ𐄬 م7 ↤︎ اوامر الوضع للمجموعه
ٴ𐄬 م المطور ↤︎  اوامر المطور
ٴ𐄬 اوامر الرد ↤︎ الاظافة‌‏ رد معين
ٴ𐄬 الوسائط ↤︎ لمعرفه الاعدادات 
ٴ𐄬 الاعدادات ↤︎ عدادات المجموعه
ٴ𐄬 سورس ↤︎ سورس البوت
ٴ𐄬 المطور ↤︎ مطور البوت
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
 ‏‎‏ٴ𐄬 معـرف المـطور ↤︎{ ]]..SUDO_USER..[[ } ✓ ]]
end
if MsgText[1]== 'م1' then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \nٴ𐄬 " end
local text =[[     
❬اوامر الرفع والتنزيل❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 رفع › تنزيل ❬المدير❭
ٴ𐄬 رفع › تنزيل ❬ادمن❭ 
ٴ𐄬 رفع › تنزيل ❬مميز❭ 
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
❬اوامر المسح❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 مسح الادمنـيـه › ❬لمسح الادمنيه❭
ٴ𐄬 مسح المميزين › ❬لمسح المميزين❭
ٴ𐄬 مسح المــــدراء › ❬لمسح المدراء❭
ٴ𐄬 مسح المنشئيين › ❬لمسح المنشئيين❭
ٴ𐄬 مسح الاساسيين › ❬لمسح المنشئيين الاساسيين❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
❬اوامر الحظر والطرد والتقييد❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 حظر ❬بالرد › بالمعرف❭ لحظر العضو
ٴ𐄬 الغاء الحظر ❬بالرد › بالمعرف❭ لالغاء الحظر 
ٴ𐄬 طرد ❬بالرد › بالمعرف❭ لطرد العضو
ٴ𐄬 كتم ❬بالرد › بالمعرف❭ لكتم العضو 
ٴ𐄬 الغاء الكتم ❬بالرد›بالمعرف❭لالغاء الكتم 
ٴ𐄬 تقييد ❬بالرد › بالمعرف❭ لتقييد العضو
ٴ𐄬 فك التقييد ❬بالرد › بالمعرف❭ لالغاء تقييد العضو
ٴ𐄬 منع + الكلمه › لمنع كلمه داخل المجموعه
ٴ𐄬 الغاء منع › لالغاء منع الكلمه
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 ** معـرف المـطور↤︎ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م2' then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \nٴ𐄬 " end
local text = [[
❬اوامر الاعدادات❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 الـرابـط › لعرض ❬الرابط❭  
ٴ𐄬 انشاء رابط › لستخراج ❬الرابط❭  
ٴ𐄬 الادمنيه › لعرض ❬الادمنيه❭
ٴ𐄬 القوانين › لعرض ❬القوانين❭ 
ٴ𐄬 الوسائط › لعرض اعدادات ❬الميديا❭ 
ٴ𐄬 الحمايـه › لعرض كل ❬الاعدادات❭  
ٴ𐄬 المــدراء › لعرض ❬الاداريين❭ 
ٴ𐄬 المكتومين › لعـرض ❬المكتومين❭ 
ٴ𐄬 المحظورين › لعرض ❬المحظورين❭
ٴ𐄬 الاعدادات › لعرض اعدادات❬المجموعه❭ 
ٴ𐄬 المجموعه › لعرض معلومات❬المجموعه❭
ٴ𐄬 تغير امر + الامر › لتغير❬اوامر البوت❭
ٴ𐄬 مسح امر + الامر › لمسح❬الامر المضاف❭
ٴ𐄬 قائمـه الاوامر › لمعرفه❬الاوامرالمضافه❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 ** معـرف المـطور↤︎ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م3' then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \nٴ𐄬 " end
local text = [[
❬اوامر حمايـه المجموعه❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 قفل › فتح ❬الكـــل❭
ٴ𐄬 قفل › فتح ❬التـاك❭
ٴ𐄬 قفل › فتح ❬الفيـديـــو❭
ٴ𐄬 قفل › فتح ❬الصــــــــور❭
ٴ𐄬 قفل › فتح ❬الملصقات❭
ٴ𐄬 قفل › فتح ❬المتحركه❭
ٴ𐄬 قفل › فتح ❬البصمــات❭
ٴ𐄬 قفل › فتح ❬الدردشـــه❭
ٴ𐄬 قفل › فتح ❬الــروابـــط❭
ٴ𐄬 قفل › فتح ❬البـــوتــات❭
ٴ𐄬 قفل › فتح ❬التعــديــل❭
ٴ𐄬 قفل › فتح ❬المعرفــات❭
ٴ𐄬 قفل › فتح ❬الكـــلايـش❭
ٴ𐄬 قفل › فتح ❬التـــكـــــرار❭
ٴ𐄬 قفل › فتح ❬الجــهـــــات❭
ٴ𐄬 قفل › فتح ❬الانـــلايــن❭
ٴ𐄬 قفل › فتح ❬التوجيــــه❭
ٴ𐄬 قفل › فتح ❬الدخول بالرابط❭
ٴ𐄬 قفل › فتح ❬البوتات بالطرد❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
❬القفل بالتقييـد❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 قفل › فتح ❬الــصــــــور بالتقييـد❭
ٴ𐄬 قفل › فتح ❬الــروابــط بالتقييـد❭
ٴ𐄬 قفل › فتح ❬المتحركه بالتقييـد❭
ٴ𐄬 قفل › فتح ❬الفيـــديــو بالتقييد❭
ٴ𐄬 قفل › فتح ❬التوجيــه بالتقييــد❭ 
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 ** معـرف المـطور ↤︎ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م4' then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير,المطور} فقط  \nٴ𐄬 " end
local text = [[
❬اوامر الخدمــه❭ 
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 ايـــدي › لعرض صورتك -:- معلوماتك
ٴ𐄬 ايديـي › لعرض ايديك 
ٴ𐄬 ايدي بالرد › لعرض ايدي الشخص
ٴ𐄬 الرابط › لستخراج رابط المجموعه
ٴ𐄬 جهاتي › لمعرفه عدد جهاتك
ٴ𐄬 الالعاب › لعرض العاب البوت
ٴ𐄬 نقاطي › لمعرفه عدد نقاطك
ٴ𐄬 بيع نقاطي + العدد › لبيع نقاطك
ٴ𐄬 معلوماتي › لعرض معلوماتك
ٴ𐄬 السورس › لعرض سورس البوت
ٴ𐄬 الرتبه بالرد › لمعرفه رتبه الشخص
ٴ𐄬 التفاعل + بالمعرف › لمعرفه تفاعل الشخص
ٴ𐄬 التفاعل بالــرد › لمعرفه تفاعل الشخص
ٴ𐄬 كشف بالمعرف › لمعرفه معلومات حسابه
ٴ𐄬 كشف بالرد › لمعرفه معلومات حسابه
ٴ𐄬 كشف البوتات › لاظهار عدد البوتات الموجوده
ٴ𐄬 طرد البوتات › لطرد كل البوتات
ٴ𐄬 طرد المحذوفين › لطرد الحسابات المحذوفه
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 ** معـرف المـطور ↤︎ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م5' then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \nٴ𐄬 " end
local text =[[
❬ اوامر التسليه❭
ٴ𐄬 مرحباً عزيزي
ٴ𐄬 هذي اوامر التسليه:
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 رفع › تنزيل ❬ متوحد ❭
ٴ𐄬 رفع › تنزيل ❬ وتكه ❭
ٴ𐄬 رفع › تنزيل ❬ غبي ❭
ٴ𐄬 رفع › تنزيل ❬ كلب ❭
ٴ𐄬 رفع › تنزيل ❬ حمار ❭
ٴ𐄬 رفع › تنزيل ❬ زوجتي ❭
ٴ𐄬 رفع › تنزيل ❬ متوحده ❭
ٴ𐄬 رفع › ❬ بقلبي ❭ تنزيل › ❬ من قلبي❭
ٴ𐄬 ❬ طلاق ❭ › ❬ زواج ❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 ** معـرف المـطور ↤︎ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م6' then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \nٴ𐄬 " end
local text = [[     
❬ اوامر التفعيل و التعطيل ❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 تفعيل › تعطيل  ❬ الرفــع ❭
ٴ𐄬 تفعيل › تعطيل  ❬ الردود ❭
ٴ𐄬 تفعيل › تعطيل  ❬الالعـاب❭
ٴ𐄬 تفعيل › تعطيل  ❬ التحذير ❭
ٴ𐄬 تفعيل › تعطيل  ❬ الترحيب ❭
ٴ𐄬 تفعيل › تعطيل  ❬ الايدي ❭
ٴ𐄬 تفعيل › تعطيل  ❬ الايدي بالصوره ❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 ** معـرف المـطور ↤︎ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== 'م7' then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \nٴ𐄬 " end
local text = [[
 ❬ اوامر الوضع للمجموعه ❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 ضع رابـط › لوضع ❬ رابط ❭
ٴ𐄬 ضع اســـم › لوضع ❬ اســم ❭
ٴ𐄬 ضع صوره › لوضع ❬ صوره ❭
ٴ𐄬 ضع وصـف › لوضع ❬ وصف ❭ 
ٴ𐄬 ضع القوانيــن › لوضع ❬ القوانين ❭ 
ٴ𐄬 ضع الترحيب › لوضع ❬ ترحيــب ❭
ٴ𐄬 ضع تكرار + العدد › لوضع ❬ تكرار ❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 ** تواصل معي للأسفسار  ↤︎ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end
if MsgText[1]== "م المطور" then
if not msg.SudoBase then return "ٴ𐄬 للمطور الاساسي فقط  🎖" end
local text = [[     
❬اوامـر المطـور❭ 
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 تفعيـل › ❬لتفعيل البوت ❭
ٴ𐄬 تعطيل › ❬لتعطيل البوت ❭
ٴ𐄬 رفع منشى › ❬رفع منشى بالبوت❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 اذاعه › ❬لنشر رساله لكل المجموعات❭
ٴ𐄬 اذاعه خاص › ❬ لنشر رساله لكل المشتركين خاص❭
ٴ𐄬 اذاعه عام › ❬لنشر رساله لكل المجموعات والخاص❭
ٴ𐄬 اذاعه عام بالتوجيه › ❬لنشر منشور قناتك بابتوجيه للكل❭
ٴ𐄬 تنظيف المجموعات›  ❬لمسح المجموعات الوهميه❭
تنظيف المشتركين › ❬لمسح المشتركين الوهميين❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 تحديث › ❬لتحديث ملفات البوت❭
ٴ𐄬 تحديث السورس › ❬لتحديث السورس الى اصدار احدث❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 ** معـرف المـطور ↤︎ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1]== 'اوامر الرد' then
if not msg.Director then return "ٴ𐄬 **هذا الامر يخص {المطور,المنشئ,المدير,المطور} فقط  \nٴ𐄬 " end
local text = [[     
❬جميع اوامر الردود ❭
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 الردود › لعرض الردود المثبته
ٴ𐄬 اضف رد › لأضافه رد جديد
ٴ𐄬 مسح رد › الرد المراد مسحه
ٴ𐄬 مسح الردود › لمسح كل الردود
ٴ𐄬 الردود العامه › لمعرف الردود المثبته عام 
ٴ𐄬 اضف رد عام › لاضافه رد لكل المجموعات
ٴ𐄬 مسح رد عام  › لمسح الرد العام 
ٴ𐄬 مسح الردود العامه › لمسح كل ردود العامه
ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
ٴ𐄬 ** معـرف المـطور ↤︎ ]]..SUDO_USER
sendMsg(msg.chat_id_,msg.id_,text)
return false
end

if MsgText[1] == "تفعيل" and MsgText[2] == "اطردني"  then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \nٴ𐄬 " end
if not redis:get(bita..'lave_me'..msg.chat_id_) then 
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."\nٴ𐄬 ** المغادره بالتاكيد تم تفعيلها\n✓" 
else 
redis:del(bita..'lave_me'..msg.chat_id_) 
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."\nٴ𐄬 ** تم تفعيل المغادره \n✓" 
end 
end
if MsgText[1] == "تعطيل" and MsgText[2] == "اطردني" then
if not msg.Admin then return "ٴ𐄬 **هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \nٴ𐄬 " end
if redis:get(bita..'lave_me'..msg.chat_id_) then 
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."\nٴ𐄬 ** المغادره من قبل البوت بالتأكيد معطله\n✓" 
else
redis:set(bita..'lave_me'..msg.chat_id_,true)  
return "ٴ𐄬 **أهلا عزيزي "..msg.TheRankCmd.."\nٴ𐄬 ** تم تعطيل المغادره من قبل البوت\n✓" 
end   
end

if MsgText[1] == "اطردني" or MsgText[1] == "احظرني" then
if not redis:get(bita..'lave_me'..msg.chat_id_) then
if msg.Admin then return "ٴ𐄬 **لا استطيع طرد المدراء والادمنيه والمنشئين  \nٴ𐄬 " end
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
StatusLeft(msg.chat_id_,msg.sender_user_id_)
send_msg(msg.sender_user_id_,"ٴ𐄬 أهلاً عزيزي , لقد تم طردك من المجموعه بامر منك \nٴ𐄬 اذا كان هذا بالخطأ او اردت الرجوع للمجموعه \n\nٴ𐄬 فهذا رابط المجموعه\nٴ𐄬 "..Flter_Markdown(redis:get(bita..'group:name'..msg.chat_id_)).." :\n\n["..redis:get(bita..'linkGroup'..msg.chat_id_).."]\n")
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 لقد تم طردك بنجاح , ارسلت لك رابط المجموعه في الخاص اذا وصلت لك تستطيع الرجوع متى شئت ")
else
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬  لا استطيع طردك لانك مشرف في المجموعه  ")
end
end)
return false
end
end

end 

if MsgText[1] == "السورس" or MsgText[1]=="سورس" then
return [[
[𓆩 𝗦𝗢𝗨𝗥𝗖𝗘 𝗕𝗜𝗧𝗔 ⁦𓆪](t.me/baselabaza)

𐄬𝗗𝗘𝗩𝗘𝗟𝗢𝗣𝗘𝗥 → [♅ 𝗕𝗔𝗦𝗘𝗟 𝗔𝗕𝗔𝗭𝗔 ♅](t.me/xb_0b)

𐄬 𝗖𝗛𝗔𝗡𝗘𝗟 → [𝗦𖦹𝗨𝗥𝗖𝗘 𝗕𝗜𝗧𝗔 ๑](t.me/baselabaza)

𐄬 𝗧𝗢 𝗧𝗔𝗟𝗞 𝗧𝗢 𝗨𝗦 → [? 𝗧𝗔𝗪𝗔𝗦𝗢𝗟 𝗦𝗢𝗨𝗥𝗖𝗘 ?](t.me/abazaxbot)

𐄬𐄬𐄬𐄬𐄬𐄬𐄬𐄬𐄬𐄬
]]
end


if MsgText[1] == "التاريخ" then
return "\nٴ𐄬  الـتـاريـخ : "..os.date("%Y/%m/%d")
end

if MsgText[1]== "سحكاتي" then
return 'ٴ𐄬 **عدد سحكاتك ⇜ ❪ '..(redis:get(bita..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..' ❫ \n'
end

if MsgText[1] == 'مسح' and MsgText[2] == 'سحكاتي'  then
local rfih = (redis:get(bita..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
if rfih == 0 then  return "ٴ𐄬 *│* لا يوجد سحكات لك في البوت ." end
redis:del(bita..':edited:'..msg.chat_id_..':'..msg.sender_user_id_)
return "ٴ𐄬 *│*تم مسح {* "..rfih.." *} من سحكاتك .\n"
end

if MsgText[1] == "تفعيل الاشتراك الاجباري" or MsgText[1] == "تفعيل الاشتراك الاجباري ☑" then
if not msg.SudoBase then return"ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
if redis:get(bita..":UserNameChaneel") then
return "ٴ𐄬 اهلا عزيزي المطور \nٴ𐄬 الاشتراك بالتأكيد مفعل"
else
redis:setex(bita..":ForceSub:"..msg.sender_user_id_,350,true)
return "ٴ𐄬 مرحبا بـك في نظام الاشتراك الاجباري\nٴ𐄬 الان ارسل معرف قـنـاتـك"
end
if Text == "الغاء" then 
sendMsg(msg.chat_id_,msg.id_,"*¦ تم الغاء الامر *\n✓")
redis:del("CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end 
end

if MsgText[1] == "تعطيل الاشتراك الاجباري" or MsgText[1] == "تعطيل الاشتراك الاجباري ♻️" then
if not msg.SudoBase then return"ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
local SubDel = redis:del(bita..":UserNameChaneel")
if SubDel == 1 then
return "ٴ𐄬 تم تعطيل الاشتراك الاجباري . \n✓"
else
return "ٴ𐄬 الاشتراك الاجباري بالفعل معطل . \n✓"
end
end

if MsgText[1] == "الاشتراك الاجباري" or MsgText[1] == "الاشتراك الاجباري ⚠️" then
if not msg.SudoBase then return"ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
local UserChaneel = redis:get(bita..":UserNameChaneel")
if UserChaneel then
return "ٴ𐄬 اهلا عزيزي المطور \nٴ𐄬 الاشتراك الاجباري للقناة : ["..UserChaneel.."]\n"
else
return "ٴ𐄬 لا يوجد قناة مفعله على الاشتراك الاجباري . \n"
end
end

if MsgText[1] == "تغيير الاشتراك الاجباري" or MsgText[1] == "تغيير الاشتراك الاجباري 🔁" then
if not msg.SudoBase then return"ٴ𐄬 **هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(bita..":ForceSub:"..msg.sender_user_id_,350,true)
return "ٴ𐄬 مرحبا بـك في نظام الاشتراك الاجباري\nٴ𐄬 الان ارسل معرف قـنـاتـك"
end
if Text == "الغاء" then 
sendMsg(msg.chat_id_,msg.id_,"*¦ تم الغاء الامر *\n✓")
redis:del("CHENG:ID"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end 





end

local function dbita(msg)



local getChatId = function(id)
  local chat = {}
  local id = tostring(id)
  if id:match("^-100") then
    local channel_id = id:gsub("-100", "")
    chat = {ID = channel_id, type = "channel"}
  else
    local group_id = id:gsub("-", "")
    chat = {ID = group_id, type = "group"}
  end
  return chat
end
local getChannelFull = function(channel_id, cb)
  tdcli_function({
    ID = "GetChannelFull",
    channel_id_ = getChatId(channel_id).ID
  }, cb or dl_cb, nil)
end

local getUser = function(user_id, cb)
tdcli_function({ID = "GetUser", user_id_ = user_id}, cb, nil)
end
local getChat = function(chat_id, cb)
tdcli_function({ID = "GetChat", chat_id_ = chat_id}, cb or dl_cb, nil)
end


if redis:get(bita..'welc'..msg.chat_id_) == 'on' then
if msg.content_.ID == 'MessageChatJoinByLink' then
function WelcomeByAddUser(BlaCk,Diamond)
local function setlinkgp(td,mrr619)
function gps(arg,data)

txt = 'ٴ𐄬 اهلآ عزيزي '..(Diamond.first_name_ or '---')..'\nٴ𐄬 المجموعه  '..(data.title_ or '---')..' \nٴ𐄬 احترام الادمنيه\nٴ𐄬 ممنوع طلب الرتب\nٴ𐄬 ممنوع السب \nٴ𐄬 ممنوع التكلم بالسياسة\nٴ𐄬 الاعضاء '..mrr619.member_count_..' عضو\nٴ𐄬 الادمنيه '..mrr619.administrator_count_..' \nٴ𐄬 وقت الانضمام :【*'..os.date("%H:%M:%S")..'*】\nٴ𐄬 تاريخ الانضمام :【*'..os.date("%Y/%m/%d")..'*】\n'
sendMsg(msg.chat_id_,msg.id_,txt)
end
getChat(msg.chat_id_,gps)
end
getChannelFull(msg.chat_id_,setlinkgp)
end
getUser(msg.sender_user_id_,WelcomeByAddUser)
end
end



local Text = msg.text
if Text then


if Text and (Text:match('(.*)')) and tonumber(msg.sender_user_id_) ~= 0 then
function dl_username(arg,data)
if data.username_ then
info = data.username_
else
info = data.first_name_
end
local hash = bita..'user_names:'..msg.sender_user_id_
redis:set(hash,info)
end
getUser(msg.sender_user_id_,dl_username)
end

------set cmd------
Black = msg.text 
if Black == 'رفع مشرف كامل' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "ٴ𐄬 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function setadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\nٴ𐄬 تم رفعه مشرف بكامل الصلاحيات\n‌‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},setadmins,nil)

return false

end




if Black == 'رفع مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "ٴ𐄬 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function setadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\nٴ𐄬 تم رفعه مشرف \n‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},setadmins,nil)

return false

end




if Black == 'تنزيل مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "ٴ𐄬 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function remadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\nٴ𐄬 تم ازالته من الاشراف\n‏')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},remadmins,nil)

return false

end




if Black == 'تنزيل مشرف' and msg.reply_to_message_id_ ~= 0 then

if not msg.Kara then return "ٴ𐄬 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط ." end

function remadmins(black,diamond)

if msg.can_promote_members == false then

sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 البوت لايمتلك  صلاحية رفع مشرف')

else

res = https.request(ApiToken.."/promoteChatMember?chat_id="..msg.chat_id_.. "&user_id=" ..diamond.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")

function name(arg,data)

sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 الأسم : ['..data.first_name_..'](tg://user?id='..diamond.sender_user_id_..')\nٴ𐄬 تم إزالته من الاشراف')

end

GetUserID(diamond.sender_user_id_,name)

end

end

tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},remadmins,nil)

return false

end


mmd = redis:get(bita..'addcmd'..msg.chat_id_..msg.sender_user_id_)
if mmd then
redis:sadd(bita..'CmDlist:'..msg.chat_id_,msg.text)
redis:hset(bita..'CmD:'..msg.chat_id_,msg.text,mmd)
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 اهلا عزيزي \nٴ𐄬 تم تثبيت الامر الجديد\n✓')
redis:del(bita..'addcmd'..msg.chat_id_..msg.sender_user_id_)
end

if Black:match('تغير امر (.*)') then
if not msg.Kara then return "ٴ𐄬 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local cmd = Black:match('تغير امر (.*)') 
redis:setex(bita..'addcmd'..msg.chat_id_..msg.sender_user_id_,120,cmd)
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 اهلا بك عزيزي\nٴ𐄬 الامر الي تريد تغيره الي  "'..cmd..'" \nٴ𐄬 ارسله الان\n')
end

if Black and (Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')) then
if not msg.Kara then return "ٴ𐄬 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local cmd = Black:match('^delcmd (.*)') or Black:match('^مسح امر (.*)')
redis:hdel(bita..'CmD:'..msg.chat_id_,cmd)
redis:srem(bita..'CmDlist:'..msg.chat_id_,cmd)
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 اهلا عزيزي\nالامر >"..cmd.."\nٴ𐄬 تم مسحه من قائمه الاوامر\n")
end
if Black == 'مسح قائمه الاوامر' or Black == 'مسح قائمه الاوامر' then
if not msg.Kara then return "ٴ𐄬 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
redis:del(bita..'CmD:'..msg.chat_id_)
redis:del(bita..'CmDlist:'..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 اهلا عزيزي تم مسح قائمه الاوامر")
end
if Black == "قائمه الاوامر" then
if not msg.Kara then return "ٴ𐄬 **هذا الامر يخص {المنشئ الاساسي,المطور,المطور الاساسي} فقط  \n" end
local CmDlist = redis:smembers(bita..'CmDlist:'..msg.chat_id_)
local t = 'ٴ𐄬 قائمه الاوامر : \n'
for k,v in pairs(CmDlist) do
mmdi = redis:hget(bita..'CmD:'..msg.chat_id_,v)
t = t..k..") "..v.." > "..mmdi.."\n" 
end
if #CmDlist == 0 then
t = 'ٴ𐄬 عزيزي لم تقم ب اضافه امر .'
end
sendMsg(msg.chat_id_,msg.id_,t)
end




if Black == 'welcome on' or Black == 'تفعيل الترحيب' then
if redis:get(bita..'welc'..msg.chat_id_) == 'on' then
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل الترحيب سابقا')
else
sendMsg(msg.chat_id_,msg.id_,'تم تفعيل الترحيب')
redis:set(bita..'welc'..msg.chat_id_,'on')
end
end
if Text == 'welcome off' or Text == 'تعطيل الترحيب' then
if redis:get(bita..'welc'..msg.chat_id_) == 'off' then
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل الترحيب سابقا')
redis:set(bita..'welc'..msg.chat_id_,'off')
redis:del(bita..'welc'..msg.chat_id_,'on')
else
sendMsg(msg.chat_id_,msg.id_,'تم تعطيل الترحيب')
end
end

if Text == "join on" and msg.SudoUser then
redis:set(bita..'joinchnl',true)
sendMsg(msg.chat_id_,msg.id_,'on')
end
if Text and redis:get(bita..'setchs') and msg.SudoUser then
redis:set(bita..'setch',Text)
sendMsg(msg.chat_id_,msg.id_,'تم تعين القناه علي \n'..Text)
redis:del(bita..'setchs')
end
if Text and (Text:match("^setch$")) and msg.SudoUser then
sendMsg(msg.chat_id_,msg.id_,'ارسل معرفك بدون @')
redis:setex(bita..'setchs',120,true)
end


if Text == 'time' or Text == 'الوقت' and is_JoinChannel(msg) then
local colors = {'blue','green','yellow','magenta','Orange','DarkOrange','red'}
local fonts = {'mathbf','mathit','mathfrak','mathrm'}
local url1 = 'http://latex.codecogs.com/png.download?'..'\\dpi{600}%20\\huge%20\\'..fonts[math.random(#fonts)]..'{{\\color{'..colors[math.random(#colors)]..'}'..os.date("%H:%M")..'}}'	
file = download_to_file(url1,'time.webp')

print('TIMESSSS')
sendDocument(msg.chat_id_,msg.id_,file,'',dl_cb,nil)
end
if Text:match('^tosticker$') or Text:match('^تحويل ملصق$') and tonumber(msg.reply_to_message_id_) > 0 then
whoami()
BD = '/home/root/.telegram-cli/data/'
function tosticker(arg,data)
if data.content_.ID == 'MessagePhoto' then
if BD..'photo/'..data.content_.photo_.id_..'_(1).jpg' == '' then
pathf = BD..'photo/'..data.content_.photo_.id_..'.jpg'
else
pathf = BD..'photo/'..data.content_.photo_.id_..'_(1).jpg'
end
sendSticker(msg.chat_id_,msg.id_,pathf,'')
else
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 عزيزي المستخدم\nٴ𐄬 الامر فقط للصوره\n')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tosticker, nil)
end

if Text == 'tophoto' or Text == 'صوره' and tonumber(msg.reply_to_message_id_) > 0 then
function tophoto(kara,bita)   
if bita.content_.ID == "MessageSticker" then        
local bd = bita.content_.sticker_.sticker_.path_          
sendPhoto(msg.chat_id_,msg.id_,bd,'')
else
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 عزيزي المستخدم\nٴ𐄬 الامر فقط للملصق\n✓')
end
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},tophoto, nil)
end
end

if msg.type == "pv" then 

if not msg.SudoUser then
local msg_pv = tonumber(redis:get(bita..'user:'..msg.sender_user_id_..':msgs') or 0)
if msg_pv > 5 then
redis:setex(bita..':mute_pv:'..msg.sender_user_id_,18000,true)   
return sendMsg(msg.chat_id_,0,'*ٴ𐄬 * تم حظرك من البوت بسبب التكرار \n') 
end
redis:setex(bita..'user:'..msg.sender_user_id_..':msgs',2,msg_pv+1)
end

if msg.text=="/start" then 

if msg.SudoBase then
local text = '- شكراً لك لإستخدام سورس بيتٲ\n- أنت المطور الاساسي هنا\nٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬\n\n- يمكنك الأن التحكم بأوامر البوت عن طريق لوحة التحكم بالبوت\nفقط انقر على الأمر الذي اريده‏'
local keyboard = {
{"ضع اسم للبوت","ضع صوره للترحيب"},
 {"تعطيل التواصل","تفعيل التواصل"},
{"تعطيل البوت خدمي","تفعيل البوت خدمي","المطورين"},
 {"المشتركين","المجموعات","الاحصائيات"},
 {"اضف رد عام","الردود العامه"},
 {"اذاعه","اذاعه خاص"},
{"اذاعه بالتثبيت","اذاعه عام","اذاعه عام بالتوجيه"},
 {"تحديث","قائمه العام"},
{"تعطيل الاشتراك الاجباري","تفعيل الاشتراك الاجباري"},
{"تغيير الاشتراك الاجباري","الاشتراك الاجباري"},
{"تنظيف المشتركين","تنظيف المجموعات"},
 {"نسخه احتياطيه للمجموعات"},
 {"تحديث السورس"},
 {"قناة السورس"},
 {"الغاء"}}
return send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
else
redis:sadd(bita..'users',msg.sender_user_id_)
if redis:get(bita..'lock_service') then 
text = [[ٴ𐄬 أهلاً انا بوت   []]..redis:get(bita..':NameBot:')..[[] 
ٴ𐄬 اختـصاصـي حمايـة الـمجموعات
ٴ𐄬من التكـرار والسـبام وبوتـات التفـليش ومـن الشـير الايرانـي والخ
ٴ𐄬فقط اضف للبوت لمجموعتك وارفعه مشرف واكتب تفعيل ▧
[قنـاة سورس بيتآ ᪤](t.me/baselabaza)

ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
 ٴ𐄬 مـعـرف الـمـطـــور : ]]..SUDO_USER..[[
]]
else
text = [[ٴ𐄬 أهلاً انا بوت    []]..redis:get(bita..':NameBot:')..[[] 
ٴ𐄬 اختـصاصـي حمايـة الـمجموعات
ٴ𐄬من التكـرار والسـبام وبوتـات التفـليش ومـن الشـير الايرانـي والخ
ٴ𐄬فقط اضف للبوت لمجموعتك وارفعه مشرف واكتب تفعيل ▧
[قنـاة سورس بيتآ ᪤](t.me/baselabaza)

ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬
 ٴ𐄬 مـعـرف الـمـطـــور : ]]..SUDO_USER..[[
]]
end
xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="مـطـور الـبـوت ✓",url="t.me/"..xsudouser}}}
send_key(msg.sender_user_id_,text,nil,inline,msg.id_)
return false
end
end
 
if msg.SudoBase then
if msg.reply_id and msg.text ~= "رفع نسخه الاحتياطيه" then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,datainfo)
if datainfo.forward_info_ then
local FwdUser = datainfo.forward_info_.sender_user_id_
local FwdDate = datainfo.forward_info_.date_
GetUserID(FwdUser,function(arg,data)
local MSG_ID = (redis:get(bita.."USER_MSG_TWASEL"..FwdDate) or 1)
if msg.text then
sendMsg(FwdUser,MSG_ID,Flter_Markdown(msg.text))
elseif msg.sticker then
sendSticker(FwdUser,MSG_ID,sticker_id,msg.content_.caption_ or '')
elseif msg.photo then
sendPhoto(FwdUser,MSG_ID,photo_id,msg.content_.caption_ or '')
elseif msg.voice then
sendVoice(FwdUser,MSG_ID,voice_id,msg.content_.caption_ or '')
elseif msg.animation then
sendAnimation(FwdUser,MSG_ID,animation_id,msg.content_.caption_ or '')
elseif msg.video then
sendVideo(FwdUser,MSG_ID,video_id,msg.content_.caption_ or '')
elseif msg.audio then
sendAudio(FwdUser,MSG_ID,audio_id,msg.content_.caption_ or '')
end 

if data.username_ then 
USERNAME = '@'..data.username_
else 
USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
USERCAR = utf8.len(USERNAME)

SendMention(msg.sender_user_id_,data.id_,msg.id_,"ٴ𐄬 تم ارسال الرسالة .\nٴ𐄬 إلى : "..USERNAME.." .",39,USERCAR) 
return false 
end,nil)
end  
end,nil)
end 
else
if not redis:get(bita..'lock_twasel') then
if msg.forward_info_ or msg.sticker or msg.content_.ID == "MessageUnsupported" then
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 عذراً لا يمكنك ارسال { توجيه‌‏ , ملصق , فديو كام} .")
return false
end
redis:setex(bita.."USER_MSG_TWASEL"..msg.date_,43200,msg.id_)
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 تم آرسـآل رسالتك إلى المطور\nٴ𐄬 سـآرد عليك في اقرب وقت ممكن \nٴ𐄬 معرف المطور "..SUDO_USER)
tdcli_function({ID='GetChat',chat_id_ = SUDO_ID},function(arg,data)
fwdMsg(SUDO_ID,msg.chat_id_,msg.id_)
end,nil)
return false
end
end
end

--====================== Reply Only Group ====================================
if redis:get(bita..'addrd:'..msg.chat_id_..msg.sender_user_id_) and redis:get(bita..'replay1'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(bita..'replay1'..msg.chat_id_..msg.sender_user_id_)
if msg.text then 
redis:hset(bita..'replay:'..msg.chat_id_,klma,Flter_Markdown(msg.text))
redis:del(bita..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\nٴ𐄬 تم اضافت الرد . \n-')
elseif msg.photo then 
redis:hset(bita..'replay_photo:group:'..msg.chat_id_,klma,photo_id)
redis:del(bita..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم اضافه صوره للرد بنجاح\nٴ𐄬 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.voice then
redis:hset(bita..'replay_voice:group:'..msg.chat_id_,klma,voice_id)
redis:del(bita..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم اضافه بصمه صوت للرد بنجاح\nٴ𐄬 يمكنك ارسال ❴ ['..klma..'] ❵ لسماع البصمه الاتيه ')
elseif msg.animation then
redis:hset(bita..'replay_animation:group:'..msg.chat_id_,klma,animation_id)
redis:del(bita..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم اضافه متحركه للرد بنجاح\nٴ𐄬 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.video then
redis:hset(bita..'replay_video:group:'..msg.chat_id_,klma,video_id)
redis:del(bita..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم اضافه فيديو للرد بنجاح\nٴ𐄬 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الفيديو الاتي ')
elseif msg.audio then
redis:hset(bita..'replay_audio:group:'..msg.chat_id_,klma,audio_id)
redis:del(bita..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم اضافه للصوت للرد بنجاح\nٴ𐄬 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوت الاتي ')
elseif msg.sticker then
redis:hset(bita..'replay_sticker:group:'..msg.chat_id_,klma,sticker_id)
redis:del(bita..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم اضافه ملصق للرد بنجاح\nٴ𐄬 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الملصق الاتي ')
end  

end

--====================== Reply All Groups =====================================
if redis:get(bita..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) and redis:get(bita..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(bita..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
if msg.text then
redis:hset(bita..'replay:all',klma,Flter_Markdown(msg.text))
redis:del(bita..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n  ٴ𐄬 تم اضافت الرد لكل المجموعات . ')
elseif msg.photo then 
redis:hset(bita..'replay_photo:group:',klma,photo_id)
redis:del(bita..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم اضافه صوره للرد العام\nٴ𐄬 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.voice then
redis:hset(bita..'replay_voice:group:',klma,voice_id)
redis:del(bita..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم اضافه بصمه صوت للرد العام\nٴ𐄬 يمكنك ارسال ❴ ['..klma..'] ❵ لسماع البصمه الاتيه ')
elseif msg.animation then
redis:hset(bita..'replay_animation:group:',klma,animation_id)
redis:del(bita..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم اضافه متحركه للرد العام\nٴ𐄬 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوره الاتيه ')
elseif msg.video then
redis:hset(bita..'replay_video:group:',klma,video_id)
redis:del(bita..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم اضافه فيديو للرد العام\nٴ𐄬 يمكنك ارسال ❴ ['..klma..'] ❵لأظهار الفيديو الاتي ')
elseif msg.audio then
redis:hset(bita..'replay_audio:group:',klma,audio_id)
redis:del(bita..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم اضافه للصوت للرد العام\nٴ𐄬 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الصوت الاتي ')
elseif msg.sticker then
redis:hset(bita..'replay_sticker:group:',klma,sticker_id)
redis:del(bita..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم اضافه ملصق للرد العام\nٴ𐄬 يمكنك ارسال ❴ ['..klma..'] ❵ لأظهار الملصق الاتي ')
end  

end

if msg.text then
--====================== Requst UserName Of Channel For ForceSub ==============
if redis:get(bita..":ForceSub:"..msg.sender_user_id_) then
if msg.text:match("^@[%a%d_]+$") then
redis:del(bita..":ForceSub:"..msg.sender_user_id_)
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..msg.text..'&user_id='..msg.sender_user_id_)
if res == 400 then
local Req = JSON.decode(url)
if Req.description == "Bad Request: chat not found" then 
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 عذراً , هناك خطأ لديك \nٴ𐄬 المعرف الذي ارسلته ليس معرف قناة.")
return false
elseif Req.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 عذراً , لقد نسيت شيئا \nٴ𐄬 يجب رفع البوت مشرف في قناتك لتتمكن من تفعيل الاشتراك الاجباري .")
return false
end
else
redis:set(bita..":UserNameChaneel",msg.text)
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 جـيـد , الان لقد تم تفعيل الاشتراك الاجباري\nٴ𐄬 على قناتك ⇜ ["..msg.text.."]")
return false
end
else
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 عذرا , عزيزي المطور \nٴ𐄬 هذا ليس معرف قناة , حاول مجددا .")
return false
end
end


if redis:get(bita..'namebot:witting'..msg.sender_user_id_) then --- استقبال اسم البوت 
redis:del(bita..'namebot:witting'..msg.sender_user_id_)
redis:set(bita..':NameBot:',msg.text)
Start_Bot() 
sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 تم تغير اسم البوت  .\nٴ𐄬 الان اسمه "..Flter_Markdown(msg.text).." \n")
return false
end

if redis:get(bita..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد لكل المجموعات
if not redis:get(bita..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال كلمه الرد لكل المجموعات
redis:hdel(bita..'replay_photo:group:',msg.text)
redis:hdel(bita..'replay_voice:group:',msg.text)
redis:hdel(bita..'replay_animation:group:',msg.text)
redis:hdel(bita..'replay_audio:group:',msg.text)
redis:hdel(bita..'replay_sticker:group:',msg.text)
redis:hdel(bita..'replay_video:group:',msg.text)
redis:setex(bita..'allreplay:'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 جيد , يمكنك الان ارسال جوا ب الردالعام \nٴ𐄬 [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]\n")
end
end

if redis:get(bita..'delrdall:'..msg.sender_user_id_) then
redis:del(bita..'delrdall:'..msg.sender_user_id_)
local names = redis:hget(bita..'replay:all',msg.text)
local photo =redis:hget(bita..'replay_photo:group:',msg.text)
local voice = redis:hget(bita..'replay_voice:group:',msg.text)
local animation = redis:hget(bita..'replay_animation:group:',msg.text)
local audio = redis:hget(bita..'replay_audio:group:',msg.text)
local sticker = redis:hget(bita..'replay_sticker:group:',msg.text)
local video = redis:hget(bita..'replay_video:group:',msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 **هذا الرد ليس مضاف في قائمه الردود .')
else
redis:hdel(bita..'replay:all',msg.text)
redis:hdel(bita..'replay_photo:group:',msg.text)
redis:hdel(bita..'replay_voice:group:',msg.text)
redis:hdel(bita..'replay_audio:group:',msg.text)
redis:hdel(bita..'replay_animation:group:',msg.text)
redis:hdel(bita..'replay_sticker:group:',msg.text)
redis:hdel(bita..'replay_video:group:',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'('..Flter_Markdown(msg.text)..')\nٴ𐄬 تم مسح الرد . ')
end 
end 


if redis:get(bita..'text_sudo:witting'..msg.sender_user_id_) then -- استقبال كليشه المطور
redis:del(bita..'text_sudo:witting'..msg.sender_user_id_) 
redis:set(bita..':TEXT_SUDO',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "ٴ𐄬 ** تم وضع الكليشه بنجاح كلاتي .\n\n*{*  "..Flter_Markdown(msg.text).."  *}*\n")
end
if redis:get(bita..'welcom:witting'..msg.sender_user_id_) then -- استقبال كليشه الترحيب
redis:del(bita..'welcom:witting'..msg.sender_user_id_) 
redis:set(bita..'welcome:msg'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 ** تم وضع الترحيب بنجاح كلاتي .\n" )
end
if redis:get(bita..'rulse:witting'..msg.sender_user_id_) then --- استقبال القوانين
redis:del(bita..'rulse:witting'..msg.sender_user_id_) 
redis:set(bita..'rulse:msg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** مرحبآ عزيزي\nٴ𐄬 تم حفظ القوانين بنجاح .\nٴ𐄬 ارسل [[ القوانين ]] لعرضها \n')
end
if redis:get(bita..'name:witting'..msg.sender_user_id_) then --- استقبال الاسم
redis:del(bita..'name:witting'..msg.sender_user_id_) 
tdcli_function({ID= "ChangeChatTitle",chat_id_=msg.chat_id_,title_=msg.text},dl_cb,nil)
end
if redis:get(bita..'linkGroup'..msg.sender_user_id_,link) then --- استقبال الرابط
redis:del(bita..'linkGroup'..msg.sender_user_id_,link) 
redis:set(bita..'linkGroup'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم وضع الرابط الجديد بنجاح .. 🍂')
end
if redis:get(bita..'about:witting'..msg.sender_user_id_) then --- استقبال الوصف
redis:del(bita..'about:witting'..msg.sender_user_id_) 
tdcli_function({ID="ChangeChannelAbout",channel_id_=msg.chat_id_:gsub('-100',''),about_ = msg.text},function(arg,data) 
if data.ID == "Ok" then 
return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 ** تم وضع الوصف بنجاح\n")
end 
end,nil)
end


if redis:get(bita..'fwd:all'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه عام
redis:del(bita..'fwd:all'..msg.sender_user_id_)
local pv = redis:smembers(bita..'users')  
local groups = redis:smembers(bita..'group:ids')
local allgp =  #pv + #groups
if allgp >= 300 then
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 اهلا عزيزي المطور \nٴ𐄬 جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
for i = 1, #pv do 
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem user From list")
redis:srem(bita..'users',pv[i])
end
end)
end
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
rem_data_group(groups[i])
end
end)
end
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 **تم اذاعه الكليشه بنجاح .\nٴ𐄬 **للمجموعات » ( *'..#groups..'* )\nٴ𐄬 ** للمشتركين » ( '..#pv..' )\n')
end

if redis:get(bita..'fwd:pv'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(bita..'fwd:pv'..msg.sender_user_id_)
local pv = redis:smembers(bita..'users')
if #pv >= 300 then
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 اهلا عزيزي المطور \nٴ𐄬 جاري نشر الرساله للمشتركين ...')			
end
local NumPvDel = 0
for i = 1, #pv do
sendMsg(pv[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok")
else
print("Rem Group From list")
redis:srem(bita..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 **عدد المشتركين : ❴ '..#pv..' ❵\nٴ𐄬 **تم الاذاعه الى ❴ '..SenderOk..'  ❵ مشترك \n') 
end
end)
end
end

if redis:get(bita..':prod_pin:'..msg.chat_id_..msg.sender_user_id_) then 
redis:del(bita..':prod_pin:'..msg.chat_id_..msg.sender_user_id_)
local groups = redis:smembers(bita..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'| اهلا عزيزي المطور \n| جاري نشر الرساله للمجموعات ...')			
end
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),function(arg,data)
redis:setex(bita..":propin"..data.chat_id_,100,data.content_.text_)
end)
end
sendMsg(msg.chat_id_,msg.id_,'*¦* عدد المجموعات ٴ𐄬⊱ { *'..#groups..'*  } ⊰ٴ𐄬\n*¦* تـم الاذاعه بالتثبيت بنجاح ')
end 

if redis:get(bita..'fwd:groups'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(bita..'fwd:groups'..msg.sender_user_id_)
local groups = redis:smembers(bita..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 اهلا عزيزي المطور \nٴ𐄬 جاري نشر الرساله للمجموعات ...')			
end
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),nil,function(arg,data)
if data.send_state_ and data.send_state_.ID == "MessageIsBeingSent"  then
print("Sender Ok") 
else
print("Rem Group From list")
rem_data_group(groups[i])
NumGroupsDel = NumGroupsDel + 1
end
if #groups == i then
local AllGroupSend = #groups - NumGroupsDel
if NumGroupsDel ~= 0 then
MsgTDel = 'ٴ𐄬 **تم حذف ❴ *'..NumGroupsDel..'* ❵ من قائمه الاذاعه لانهم قامو بطرد البوت من المجموعه'
else
MsgTDel = ''
end
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 **عدد المجموعات ❴ *'..#groups..'* ❵\nٴ𐄬 **تـم الاذاعه الى ❴ *'..AllGroupSend..'* ❵\n'..MsgTDel..'')
end
end)
end
end 
end 

if msg.adduser and msg.adduser == our_id and redis:get(bita..':WELCOME_BOT') then
sendPhoto(msg.chat_id_,msg.id_,redis:get(bita..':WELCOME_BOT'),[[ٴ𐄬أهلاً انا بوت ]]..redis:get(bita..':NameBot:')..[[
ٴ𐄬 أختصاصي حماية‌‏ المجموعات
ٴ𐄬 مـن السبام والتوجيه‌‏ والتكرار والخ...

ٴ𐄬 مـعـرف الـمـطـور  : ]]..SUDO_USER:gsub([[\_]],'_')..[[
]])
return false
end 

if msg.forward_info and redis:get(bita..'fwd:'..msg.sender_user_id_) then
redis:del(bita..'fwd:'..msg.sender_user_id_)
local pv = redis:smembers(bita..'users')
local groups = redis:smembers(bita..'group:ids')
local allgp =  #pv + #groups
if allgp == 500 then
sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 اهلا عزيزي المطور \nٴ𐄬 جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
local number = 0
for i = 1, #pv do 
fwdMsg(pv[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
for i = 1, #groups do 
fwdMsg(groups[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 **تم اذاعه التوجيه بنجاح .\nٴ𐄬 **للمجموعات » ❴ *'..#groups..'* ❵\nٴ𐄬 **للخاص » ❴ '..#pv..' ❵\n')			
end

 

if msg.content_.ID == "MessagePhoto" and redis:get(bita..'welcom_ph:witting'..msg.sender_user_id_) then
redis:del(bita..'welcom_ph:witting'..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:set(bita..':WELCOME_BOT',photo_id)
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 تم تغيير صوره‏‏ الترحيب للبوت .\n')
end 

if msg.content_.ID == "MessagePhoto" and msg.type == "channel" and msg.GroupActive then
if redis:get(bita..'photo:group'..msg.chat_id_..msg.sender_user_id_) then
redis:del(bita..'photo:group'..msg.chat_id_..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_=msg.chat_id_,photo_=GetInputFile(photo_id)},function(arg,data)
if data.code_ == 3 then
sendMsg(arg.chat_id_,arg.id_,'ٴ𐄬 ليس لدي صلاحيه تغيير الصوره \nٴ𐄬 يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ⠀\n')
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
return false
end
end

if not msg.GroupActive then return false end
if msg.text then

if redis:get(bita..'addrd:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد للمجموعه فقط

if not redis:get(bita..'replay1'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
redis:hdel(bita..'replay:'..msg.chat_id_,msg.text)
redis:hdel(bita..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(bita..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(bita..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(bita..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(bita..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(bita..'replay_video:group:'..msg.chat_id_,msg.text)
redis:setex(bita..'replay1'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 جيد , يمكنك الان ارسال جواب الرد \nٴ𐄬 [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه ]]\n")
end
end

if redis:get(bita..'delrd:'..msg.sender_user_id_) then
redis:del(bita..'delrd:'..msg.sender_user_id_)
local names 	= redis:hget(bita..'replay:'..msg.chat_id_,msg.text)
local photo 	= redis:hget(bita..'replay_photo:group:'..msg.chat_id_,msg.text)
local voice 	= redis:hget(bita..'replay_voice:group:'..msg.chat_id_,msg.text)
local animation = redis:hget(bita..'replay_animation:group:'..msg.chat_id_,msg.text)
local audio 	= redis:hget(bita..'replay_audio:group:'..msg.chat_id_,msg.text)
local sticker 	= redis:hget(bita..'replay_sticker:group:'..msg.chat_id_,msg.text)
local video 	= redis:hget(bita..'replay_video:group:'..msg.chat_id_,msg.text)
if not (names or photo or voice or animation or audio or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 **هذا الرد ليس مضاف في قائمه الردود .')
else
redis:hdel(bita..'replay:'..msg.chat_id_,msg.text)
redis:hdel(bita..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(bita..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(bita..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(bita..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(bita..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(bita..'replay_video:group:'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..msg.text..'])\nٴ𐄬 تم مسح الرد . ')
end 
end

end

if msg.pinned then
print(" -- pinned -- ")
local msg_pin_id = redis:get(bita..":MsgIDPin:"..msg.chat_id_)
if not msg.Director and redis:get(bita..'lock_pin'..msg.chat_id_) then
if msg_pin_id then
print(" -- pinChannelMessage -- ")
tdcli_function({ID ="PinChannelMessage",
channel_id_ = msg.chat_id_:gsub('-100',''),
message_id_ = msg_pin_id,
disable_notification_ = 0},
function(arg,data)
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 ** ًعذرا التثبيت مقفل من قبل الاداره تم ارجاع التثبيت القديم\n")
end
end,nil)
else
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},
function(arg,data) 
if data.ID == "Ok" then
return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 ** ًعذرا التثبيت مقفل من قبل الاداره تم الغاء التثبيت\n")      
end
end,nil)
end
return false
end
redis:set(bita..":MsgIDPin:"..msg.chat_id_,msg.id_)
end

if msg.content_.ID == "MessageChatChangePhoto" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end
return sendMsg(msg.chat_id_,msg.id_," قام ["..UserName.."] بتغير صوره المجموعه .\n")
end)
end

if msg.content_.ID == "MessageChatChangeTitle" then
GetUserID(msg.sender_user_id_,function(arg,data)
redis:set(bita..'group:name'..msg.chat_id_,msg.content_.title_)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end

return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 قام  ["..UserName.."]\nٴ𐄬 بتغير اسم المجموعه .\nٴ𐄬 الى "..Flter_Markdown(msg.content_.title_).." \n") 
end)
end
if msg.adduser or msg.joinuser then
if redis:get(bita..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
else
if redis:get(bita..'welcome:get'..msg.chat_id_) then 
if not msg.adduserType then
GetUserID(msg.sender_user_id_,function(arg,data)  
welcome = (redis:get(bita..'welcome:msg'..msg.chat_id_) or "ٴ𐄬 اهلاً عزيزي {الاسم}\nٴ𐄬 معرفك » {المعرف}\n{القوانين}\n\nالرجاء الالتزام بالقوانين\nٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬\nٴ𐄬 اسم القروب » {المجموعه}")
if welcome then
rules = (redis:get(bita..'rulse:msg'..msg.chat_id_) or "ٴ𐄬 مرحباً عزيري القوانين كلاتي .\nٴ𐄬 ممنوع نشر الروابط\nٴ𐄬 ممنوع التكلم او نشر صور اباحيه\nٴ𐄬 ممنوع  اعاده توجيه\nٴ𐄬 ممنوع التكلم بالسياسة\nٴ𐄬 الرجاء احترام المدراء والادمنيه .\n")
welcome = welcome:gsub("{القوانين}", rules)
if data.username_ then UserName = '@'..data.username_ else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(bita..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(data.first_name_..' '..(data.last_name_ or "" ),20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end)
else
welcome = (redis:get(bita..'welcome:msg'..msg.chat_id_) or "ٴ𐄬 اهلن بك عزيزي {الاسم}\nٴ𐄬 معرفك » {المعرف}\n{القوانين}\n\nالرجاء الالتزام بالقوانين\nٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬\nٴ𐄬 اسم القروب » {المجموعه}")
if welcome then
rules = (redis:get(bita..'rulse:msg'..msg.chat_id_) or "ٴ𐄬 مرحباً عزيري القوانين كلاتي .\nٴ𐄬 ممنوع نشر الروابط\nٴ𐄬 ممنوع التكلم او نشر صور اباحيه\nٴ𐄬 ممنوع  اعاده توجيه\nٴ𐄬 ممنوع التكلم بالسياسة\nٴ𐄬 الرجاء احترام المدراء والادمنيه\n")
welcome = welcome:gsub("{القوانين}", rules)
if msg.addusername then UserName = '@'..msg.addusername else UserName = '< لا يوجد معرف >' end
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(bita..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الاسم}",FlterName(msg.addname,20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
end 
end

end
end
end 

--------------------------------------------
if msg.adduser and redis:get(bita..'welcome:get'..msg.chat_id_) then
local adduserx = tonumber(redis:get(bita..'user:'..msg.sender_user_id_..':msgs') or 0)
if adduserx > 3 then 
redis:del(bita..'welcome:get'..msg.chat_id_)
end
redis:setex(bita..'user:'..msg.sender_user_id_..':msgs',3,adduserx+1)
end

if not msg.Admin and not msg.Special and not (msg.adduser or msg.joinuser or msg.deluser ) then -- للاعضاء فقط   

if not msg.forward_info and redis:get(bita..'lock_flood'..msg.chat_id_)  then
local msgs = (redis:get(bita..'user:'..msg.sender_user_id_..':msgs') or 0)
local NUM_MSG_bita = (redis:get(bita..'num_msg_bita'..msg.chat_id_) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_bita) then 
GetUserID(msg.sender_user_id_,function(arg,datau)
Restrict(msg.chat_id_,msg.sender_user_id_,1)
redis:setex(bita..'sender:'..msg.sender_user_id_..':flood',30,true)
if datau.username_ then USERNAME = '@'..datau.username_ else USERNAME = FlterName(datau.first_name_..' '..(datau.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,datau.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME.."\nٴ𐄬 قمـت بتكرار اكثر مـن "..NUM_MSG_bita.." رسالة‌‏ , لذا تم تقييدك مـن المجموعه‌\n",12,USERCAR) 
return false
end)
end 
redis:setex(bita..'user:'..msg.sender_user_id_..':msgs',2,msgs+1)
end
 
 function Get_Info(msg,chat,user) --// ارسال نتيجة الصلاحيه
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 صلاحياته منشئ القروب\n')   
end 
if Json_Info.result.status == "member" then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 مجرد عضو هنا\n')   
end 
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end
return sendMsg(chat,msg.id_,'ٴ𐄬 الرتبة : مشرف\nٴ𐄬 والصلاحيات هي ↓ \nٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬\nٴ𐄬 تغير معلومات المجموعه ↞ ❪ '..info..' ❫\nٴ𐄬 حذف الرسائل ↞ ❪ '..delete..' ❫\nٴ𐄬 حظر المستخدمين ↞ ❪ '..restrict..' ❫\nٴ𐄬 دعوة مستخدمين ↞ ❪ '..invite..' ❫\nٴ𐄬 تثبيت الرسائل ↞ ❪ '..pin..' ❫\nٴ𐄬 اضافة مشرفين جدد ↞ ❪ '..promote..' ❫\n\nٴ𐄬 ملاحضه » علامة ❪  ꪜ ❫ تعني لديه الصلاحية وعلامة ❪ ✘ ❫ تعني ليس ليديه الصلاحيه')   
end
end
end

if msg.forward_info_ then
if redis:get(bita..'mute_forward'..msg.chat_id_) then -- قفل التوجيه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd \27[0m")

if data.ID == "Error" and data.code_ == 6 then 
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) and not redis:get(bita..':User_Fwd_Msg:'..msg.sender_user_id_..':flood') then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذراً ممنوع اعادة التوجيه  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
return redis:setex(bita..':User_Fwd_Msg:'..msg.sender_user_id_..':flood',15,true)
end,nil)
end
end)
return false
elseif redis:get(bita..':tqeed_fwd:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd tqeed \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false 
end
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(bita..'mute_inline'..msg.chat_id_) then -- قفل الانلاين
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send inline \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذراً الانلاين مقفول  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text then -- رسايل فقط
if utf8.len(msg.text) > 500 and redis:get(bita..'lock_spam'..msg.chat_id_) then -- قفل الكليشه 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send long msg \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 ممنوع ارسال الكليشه والا سوف تجبرني على طردك  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") 
or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.text:match(".[Pp][Ee]") 
or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.text:match("[Hh][Tt][Tt][Pp]://") 
or msg.text:match("[Ww][Ww][Ww].") 
or msg.text:match(".[Cc][Oo][Mm]")) 
and redis:get(bita..':tqeed_link:'..msg.chat_id_)  then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user i restricted becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false
elseif(msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Oo][Rr][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]")) 
and redis:get(bita..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 ممنوع ارسال الروابط  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Tt][Kk]") or msg.text:match(".[Mm][Ll]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(bita..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 ممنوع ارسال روابط الويب   \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("#[%a%d_]+") and redis:get(bita..'lock_tag'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send tag \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 ممنوع ارسال التاك  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.text:match("@[%a%d_]+")  and redis:get(bita..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 ممنوع ارسال المعرف   \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) 
end,nil)
end
end)
return false
elseif not msg.textEntityTypeBold and (msg.textEntityTypeBold or msg.textEntityTypeItalic) and redis:get(bita..'lock_markdown'..msg.chat_id_) then 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send markdown \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 ممنوع ارسال الماركدوان  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.textEntityTypeTextUrl and redis:get(bita..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web page \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 ممنوع ارسال روابط الويب   \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
 
elseif msg.edited and redis:get(bita..'lock_edit'..msg.chat_id_) then -- قفل التعديل
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Edit \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذراً ممنوع التعديل تم المسح \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end 
elseif msg.content_.ID == "MessageUnsupported" and redis:get(bita..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذرا ممنوع ارسال الفيديو كام \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.photo then
if redis:get(bita..'mute_photo'..msg.chat_id_)  then -- قفل الصور
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذرا ممنوع ارسال الصور  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif redis:get(bita..':tqeed_photo:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user resctricted becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.video then
if redis:get(bita..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send vedio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذرا ممنوع ارسال الفيديو  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(bita..':tqeed_video:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.document and redis:get(bita..'mute_document'..msg.chat_id_) then -- قفل الملفات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send file \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذرا ممنوع ارسال الملفات  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.sticker and redis:get(bita..'mute_sticker'..msg.chat_id_) then --قفل الملصقات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send sticker \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذرا ممنوع ارسال الملصقات  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.animation then
if redis:get(bita..'mute_gif'..msg.chat_id_) then -- قفل المتحركه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذرا ممنوع ارسال الصور المتحركه  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif redis:get(bita..':tqeed_gif:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.contact and redis:get(bita..'mute_contact'..msg.chat_id_) then -- قفل الجهات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Contact \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذرا ممنوع ارسال جهات الاتصال  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.location and redis:get(bita..'mute_location'..msg.chat_id_) then -- قفل الموقع
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send location \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذرا ممنوع ارسال الموقع  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.voice and redis:get(bita..'mute_voice'..msg.chat_id_) then -- قفل البصمات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send voice \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
 if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذرا ممنوع ارسال البصمات  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)   
end
end)
return false
elseif msg.game and redis:get(bita..'mute_game'..msg.chat_id_) then -- قفل الالعاب
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send game \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذرا ممنوع لعب الالعاب  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.audio and redis:get(bita..'mute_audio'..msg.chat_id_) then -- قفل الصوت
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send audio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذرا ممنوع ارسال الصوت  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.replyMarkupInlineKeyboard and redis:get(bita..'mute_keyboard'..msg.chat_id_) then -- كيبورد
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send keyboard \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذرا الكيبورد مقفول  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
end

if msg.content_ and msg.content_.caption_ then -- الرسايل الي بالكابشن
print("sdfsd     f- ---------- ")
if (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.content_.caption_:match("[Tt].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match(".[Pp][Ee]")) 
and redis:get(bita..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذرا ممنوع ارسال الروابط  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif (msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") 
or msg.content_.caption_:match("[Ww][Ww][Ww].") 
or msg.content_.caption_:match(".[Cc][Oo][Mm]")) 
and redis:get(bita..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send webpage caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgx = "ٴ𐄬 عذرا ممنوع ارسال روابط الويب  \n"
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end
end)
return false
elseif msg.content_.caption_:match("@[%a%d_]+") and redis:get(bita..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'ٴ𐄬 ** لا يمكنني مسح الرساله المخالفه .\nٴ𐄬 ** لست مشرف او ليس لدي صلاحيه  الحذف \n')    
end
if redis:get(bita..'lock_woring'..msg.chat_id_) then
local msgx = "ٴ𐄬 عذرا ممنوع ارسال التاك او المعرف  \n"
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
local USERCAR = utf8.len(USERNAME)
SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 العضو » "..USERNAME..'\n'..msgx,12,USERCAR) end,nil)
end 
end)
return false
end 

end --========{ End if } ======

end 
SaveNumMsg(msg)
------------------------------{ Start Replay Send }------------------------

if msg.text and redis:get(bita..'replay'..msg.chat_id_) then

local Replay = false

 Replay = redis:hget(bita..'replay:all',msg.text)
if Replay then
sendMsg(msg.chat_id_,msg.id_,Replay)
return false
end

 Replay = redis:hget(bita..'replay:'..msg.chat_id_,msg.text)
if Replay then 
 sendMsg(msg.chat_id_,msg.id_,Replay) 
return false
end
 Replay = redis:hget(bita..'replay_photo:group:',msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(bita..'replay_voice:group:',msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(bita..'replay_animation:group:',msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(bita..'replay_audio:group:',msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(bita..'replay_sticker:group:',msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(bita..'replay_video:group:',msg.text)
if Replay then 
print("0000000000000") 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(bita..'replay_photo:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendPhoto(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(bita..'replay_voice:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVoice(msg.chat_id_,msg.id_,Replay)
return false
end

Replay = redis:hget(bita..'replay_animation:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAnimation(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(bita..'replay_audio:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendAudio(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(bita..'replay_sticker:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(bita..'replay_video:group:'..msg.chat_id_,msg.text)
if Replay then 
 sendVideo(msg.chat_id_,msg.id_,Replay)
return false
end

if not Replay then

--================================{{  Reply Bot  }} ===================================

local su = {
  "اهلا بمطوري الحلو .",
  "ارحب يالمطور.",
  "هلا .",
  "عيون ["..Bot_Name.."] .",
  "ارحب ."}
  local ss97 = {
  "اهلا .","امرني يعيني .",
  "امرني .","نعم","هاه.","شفيه",
  "لبييه .","عيوني لك.","امرني يا حلو.",
  "ها يا روحي.","هلا .","شتبغى.",
  "عيون ["..Bot_Name.."] .",
  }

local nnn = {
"اسمي ["..Bot_Name.."] .",
"تدلل .",
"تفضل .",
"عيوني لك .",
}

local Text = msg.text
local Text2 = Text:match("^"..Bot_Name.." (%d+)$")

if msg.SudoUser and Text == Bot_Name and not Text2 then
return sendMsg(msg.chat_id_,msg.id_,su[math.random(#su)])
elseif not msg.SudoUser and Text== Bot_Name and not Text2 then  
return sendMsg(msg.chat_id_,msg.id_,ss97[math.random(#ss97)])
elseif Text:match("^قول (.*)$") then
if utf8.len(Text:match("^قول (.*)$")) > 500 then 
return sendMsg(msg.chat_id_,msg.id_,"- ما اقدر اقول اكثر من 500 حرف ")
end
local callback_Text = FlterName(Text:match("^قول (.*)$"),50)
if callback_Text and callback_Text ==  ' الاسم سبام ❗️'  then
return sendMsg(msg.chat_id_,msg.id_,"- للاسف النص هذا مخالف ")
else
return sendMsg(msg.chat_id_,0,callback_Text) 
end
elseif not msg.SudoUser and Text==" باي" or Text == "باي" then
return sendMsg(msg.chat_id_,msg.id_,dr[math.random(#dr)])
elseif not msg.SudoUser and Text==" بوت" or Text == "بوت" then
return 
sendMsg(msg.chat_id_,msg.id_,nnn[math.random(#nnn)]) 
elseif Text== "باسل" or Text== "باسل اباظه" then return  sendMsg(msg.chat_id_,msg.id_,"[ملك التلجرام ♕](https://t.me/XB_0B)")
elseif Text== "اغاني" or Text== "الاغاني" then return  sendMsg(msg.chat_id_,msg.id_,"[@YTOOTY_BOT + اسم الاغنية](https://t.me/YTOOTY_BOT)")
elseif Text== "رفع غبي"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع الغبي بنجاح↯\nٴ𐄬 تمت إضافته إلى قائمه الأغبياء\n☆")
elseif Text== "تنزيل غبي"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم تنزيل الغبي بنجاح↯\nٴ𐄬 تمت الزاله من قائمه الأغبياء\n☆")
elseif Text== "رفع كلب"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع الكلب بنجاح↯\nٴ𐄬 تمت إضافته إلى قائمه الكلاب\n☆")
elseif Text== "رفع حمار"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع الحمار بنجاح↯\nٴ𐄬 تمت إضافته إلى قائمه الحمير\n☆")
elseif Text== "تنزيل حمار"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم تنزيل الحمار بنجاح↯\nٴ𐄬 تمت ازالته من قائمه الحمير\n☆")
elseif Text== "تنزيل كلب"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي \nٴ𐄬 تم تنزيل الكلب بنجاح↯\nٴ𐄬 تمت إزالته من قائمه الكلاب\n☆")
elseif Text== "تنزيل متوحده"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم تنزيل المتوحده بنجاح↯\nٴ𐄬 لا متحاولوش حتي لو نزلتوها هتفضل متوحده\n☆")
elseif Text== "رفع متوحده"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع المتوحده بنجاح↯\nٴ𐄬 تمت إضافتها الي قائمة المتوحدين والمتخلفين عقلياً\n☆")
elseif Text== "رفع متوحد"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع المتوحد بنجاح↯\nٴ𐄬 تمت  اضافته الي قائمة المتوحديد والمرضي النفسيين\n☆")
elseif Text== "تنزيل متوحد"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم تنزيل المتوحد بنجاح↯\nٴ𐄬 لا متحاولوش حتي لو نزلتوه هيفضل متوحد\n☆")
elseif Text== "رفع بقلبي"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع العضو داخل قلبك↯\nٴ𐄬 تمت ترقيته بنجاح\n☆")
elseif Text== "تنزيل من قلبي"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم تنزيل من داخل قلبك↯\nٴ𐄬 تمت ازالته من قائمه القلوب\n☆")
elseif Text== "رفع وتكه"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع العضو وتكه بنجاح↯ \nٴ𐄬 اصبحت وتكتك\n☆")
elseif Text== "تنزيل وتكه"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم تنزيل العضو \nٴ𐄬 من قائمة وتكاتك بنجاح\n☆")
elseif Text== "رفع زوجتي"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم رفع العضو زوجتك↯\nالآن يمكنكم أخذ راحتكم واتفضلو اعملو واحد\n☆")
elseif Text== "تنزيل زوجتي"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم تنزيل زوجتك بنجاح↯\nالآن انتم مفترقان طلقتها علشان مبتعرفش صح\n☆")
elseif Text== "زواج"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم زواجكم الاثنين بنجاح↯\nٴ𐄬 الآن هي حلالك بلالك\n☆")
elseif Text== "طلاق"  then return sendMsg(msg.chat_id_,msg.id_,"ٴ𐄬 أهلاً عزيزي\nٴ𐄬 تم طلاق الخاينه بنجاح↯\nٴ𐄬 الآن هي مطلقه \n☆")
elseif Text== "اوامر التسليه"  then return sendMsg(msg.chat_id_,msg.id_,"\n‌‌‏ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬\nٴ𐄬 مرحباً عزيزي\nٴ𐄬 هذي اوامر التسليه:  \nٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬\nٴ𐄬 رفع › تنزيل ❬ متوحد ❭\nٴ𐄬 رفع › تنزيل ❬ وتكه ❭\nٴ𐄬 رفع › تنزيل ❬ غبي ❭\nٴ𐄬 رفع › تنزيل ❬ كلب ❭\nٴ𐄬 رفع › تنزيل ❬ حمار ❭\nٴ𐄬 رفع › تنزيل ❬ زوجتي ❭\nٴ𐄬 رفع › تنزيل ❬ متوحده ❭\nٴ𐄬 رفع › ❬ بقلبي ❭ تنزيل › ❬ من قلبي❭\nٴ𐄬 ❬ طلاق ❭ › ❬ زواج ❭\nٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬ٴ𐄬")


  elseif Text== "ايديي" or Text=="ايدي 🆔" then 
  GetUserID(msg.sender_user_id_,function(arg,data)
  if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or "")) end
  local USERCAR = utf8.len(USERNAME)
  SendMention(msg.chat_id_,data.id_,msg.id_,"ٴ𐄬 اضغط على الايدي ليتم النسخ\n\n "..USERNAME.." \n\n  ( "..data.id_.." )",37,USERCAR)  
  return false
  end)
  elseif Text=="ابي رابط الحذف" or Text=="ابي رابط حذف" or Text=="رابط حذف" or Text=="رابط الحذف" then
  return sendMsg(msg.chat_id_,msg.id_,[[
  ٴ𐄬 رابط حذف حساب التليجرام
ٴ𐄬 [أضغط هُنا](https://telegram.org/deactivate) - .
‏
  ]] )
  --=====================================
elseif Text== "مين ضافني" or Text== "منو ضافني"  then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"[انت مكانك كل مكان يا مطور♕](https://t.me/baselabaza) ")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"[انت منشئ المجموعه](https://t.me/baselabaza)")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"[انت دخلت عبر الرابط](https://t.me/baselabaza)")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"[انت دخلت عبر الرابط](https://t.me/baselabaza)")
else 
return sendMsg(msg.chat_id_,msg.id_,"[انت دخلت عبر الرابط](https://t.me/baselabaza)")
end 
  --=====================================
  elseif Text== "انا مين" or Text== "مين انا"  then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"[انت المطور الغالي ♕](https://t.me/baselabaza) ")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"[انت منشئ المجموعه  تاج راسي♔](https://t.me/baselabaza)")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"[انت مدير المجموعه๑](https://t.me/baselabaza)")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"[انت ادمن شد حيلك♘](https://t.me/baselabaza)")
else 
return sendMsg(msg.chat_id_,msg.id_,"[مجرد عضو ذليل𖦹](https://t.me/baselabaza)")
end 
end 




end 


end


------------------------------{ End Replay Send }------------------------

------------------------------{ Start Checking CheckExpire }------------------------
if not redis:get('kar') then
  redis:setex('kar',86400,true) 
  json_data = '{"BotID": '..bita..',"UserBot": "'..Bot_User..'","Groups" : {'
  local All_Groups_ID = redis:smembers(bita..'group:ids')
  for key,GroupS in pairs(All_Groups_ID) do
  local NameGroup = (redis:get(bita..'group:name'..GroupS) or '')
  NameGroup = NameGroup:gsub('"','')
  NameGroup = NameGroup:gsub([[\]],'')
  if key == 1 then
  json_data =  json_data ..'"'..GroupS..'":{"Title":"'..NameGroup..'"'
  else
  json_data =  json_data..',"'..GroupS..'":{"Title":"'..NameGroup..'"'
  end
  local admins = redis:smembers(bita..'admins:'..GroupS)
  if #admins ~= 0 then
  json_data =  json_data..',"Admins" : {'
  for key,value in pairs(admins) do
  local info = redis:hgetall(bita..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end
  end
  json_data =  json_data..'}'
  end
  
  local creators = redis:smembers(bita..':MONSHA_BOT:'..GroupS)
  if #creators ~= 0 then
  json_data =  json_data..',"Creator" : {'
  for key,value in pairs(creators) do
  local info = redis:hgetall(bita..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end 
  end
  json_data =  json_data..'}'
  end
  local creator = redis:smembers(bita..':KARA_BOT:'..GroupS)
  if #creator ~= 0 then
  json_data =  json_data..',"Kara" : {'
  for key,value in pairs(creator) do
  local info = redis:hgetall(bita..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end 
  end
  json_data =  json_data..'}'
  end
  
  local owner = redis:smembers(bita..'owners:'..GroupS)
  if #owner ~= 0 then
  json_data =  json_data..',"Owner" : {'
  for key,value in pairs(owner) do
  local info = redis:hgetall(bita..'username:'..value)
  if info then 
  UserName_ = (info.username or "")
  UserName_ = UserName_:gsub([[\]],'')
  UserName_ = UserName_:gsub('"','')
  end 
  if key == 1 then
  json_data =  json_data..'"'..UserName_..'":'..value
  else
  json_data =  json_data..',"'..UserName_..'":'..value
  end
  end
  json_data =  json_data..'}'
  end
  json_data =  json_data.."}"
  end
  local Save_Data = io.open("./inc/"..Bot_User..".json","w+")
  Save_Data:write(json_data..'}}')
  Save_Data:close()
  sendDocument(SUDO_ID,0,"./inc/"..Bot_User..".json","ٴ𐄬 ملف نسخه تلقائيه\nٴ𐄬   اليك مجموعاتك » { "..#All_Groups_ID.." }\nٴ𐄬 للبوت » "..Bot_User.."\nٴ𐄬 التاريخ » "..os.date("%Y/%m/%d").."\n",dl_cb,nil)
  end
  if redis:get(bita..'CheckExpire::'..msg.chat_id_) then
  local ExpireDate = redis:ttl(bita..'ExpireDate:'..msg.chat_id_)
  if not ExpireDate and not msg.SudoUser then
  rem_data_group(msg.chat_id_)
  sendMsg(SUDO_ID,0,'ٴ𐄬 انتهى الاشتراك في احد المجموعات .\nٴ𐄬 المجموعه : '..FlterName(redis:get(bita..'group:name'..msg.chat_id_))..'.\nٴ𐄬 ايدي : '..msg.chat_id_)
  sendMsg(msg.chat_id_,0,'ٴ𐄬 انتهى الاشتراك البوت.\nٴ𐄬 سوف اغادر المجموعه فرصه سعيده .\nٴ𐄬 او راسل المطور للتجديد '..SUDO_USER..' 🍃')
  return StatusLeft(msg.chat_id_,our_id)
  else
  local DaysEx = (redis:ttl(bita..'ExpireDate:'..msg.chat_id_) / 86400)
  if tonumber(DaysEx) > 0.208 and ExpireDate ~= -1 and msg.Admin then
  if tonumber(DaysEx + 1) == 1 and not msg.SudoUser then
  sendMsg(msg.chat_id_,'ٴ𐄬 باقي يوم واحد وينتهي الاشتراك .\nٴ𐄬 راسل المطور للتجديد '..SUDO_USER..'\n')
  end 
  end 
  end
  end
  
  ------------------------------{ End Checking CheckExpire }------------------------
  
  
  end 
  
  
  return {
  bita = {
  "^(رفع القيود)$",
"^(رفع القيود) (%d+)$",
"^(رفع القيود) (@[%a%d_]+)$",
  "^(تقييد)$",
  "^(تقييد) (%d+)$",
  "^(تقييد) (@[%a%d_]+)$",
  "^(فك التقييد)$",
  "^(فك التقييد) (%d+)$",
  "^(فك التقييد) (@[%a%d_]+)$",
  "^(فك تقييد)$",
  "^(فك تقييد) (%d+)$",
  "^(فك تقييد) (@[%a%d_]+)$",
  "^(ضع شرط التفعيل) (%d+)$",
  "^(التفاعل)$",
  "^(التفاعل) (@[%a%d_]+)$",
  "^([iI][dD])$",
  "^(تفعيل الايدي بالصوره)$",
  "^(تعطيل الايدي بالصوره)$",
  "^(تعطيل الرفع)$",
  "^(تفعيل الرفع)$",
  "^(قفل الدخول بالرابط)$",
  "^(فتح الدخول بالرابط)$", 
  "^(ايدي)$",
  "^(ايدي) (@[%a%d_]+)$",
  "^(كشف)$",
  "^(كشف) (%d+)$",
  "^(كشف) (@[%a%d_]+)$",
  '^(رفع مميز)$',
  '^(رفع مميز) (@[%a%d_]+)$',
  '^(رفع مميز) (%d+)$',
  '^(تنزيل مميز)$',
  '^(تنزيل مميز) (@[%a%d_]+)$',
  '^(تنزيل مميز) (%d+)$',
  '^(رفع ادمن)$',
  '^(رفع ادمن) (@[%a%d_]+)$',
  '^(رفع ادمن) (%d+)$',
  '^(تنزيل ادمن)$',
  '^(تنزيل ادمن) (@[%a%d_]+)$',
  '^(تنزيل ادمن) (%d+)$', 
  '^(رفع مطي)$',
  '^(تنزيل مطي)$', 
  '^(رفع متوحده)$',
  '^(تنزيل متوحده)$', 
  '^(رفع المدير)$',
  '^(رفع مدير)$', 
  '^(رفع مدير) (@[%a%d_]+)$',
  '^(رفع المدير) (@[%a%d_]+)$',
  '^(رفع المدير) (%d+)$',
  '^(رفع مدير) (%d+)$',
  '^(رفع منشى اساسي)$',
  '^(رفع منشئ اساسي)$',
  '^(رفع منشئ اساسي) (@[%a%d_]+)$',
  '^(رفع منشى اساسي) (@[%a%d_]+)$',
  '^(تنزيل منشئ اساسي)$',
  '^(تنزيل منشى اساسي)$',
  '^(تنزيل منشئ اساسي) (%d+)$',
  '^(تنزيل منشى اساسي) (%d+)$',
  '^(تنزيل منشى اساسي) (@[%a%d_]+)$',
  '^(تنزيل منشئ اساسي) (@[%a%d_]+)$',
  '^(رفع منشى)$',
  '^(رفع منشئ)$',
  '^(رفع منشئ) (@[%a%d_]+)$',
  '^(رفع منشى) (@[%a%d_]+)$',
  '^(تنزيل منشئ)$',
  '^(تنزيل منشى)$',
  '^(تنزيل منشئ) (%d+)$',
  '^(تنزيل منشى) (%d+)$',
  '^(تنزيل منشى) (@[%a%d_]+)$',
  '^(تنزيل منشئ) (@[%a%d_]+)$',
  '^(تنزيل المدير)$',
  '^(تنزيل مدير)$',
  '^(تنزيل مدير) (@[%a%d_]+)$',
  '^(تنزيل المدير) (@[%a%d_]+)$',
  '^(تنزيل المدير) (%d+)$',
  '^(تنزيل مدير) (%d+)$',
   '^(صلاحياته)$',
   '^(صلاحياتي)$',
  '^(صلاحياته) (@[%a%d_]+)$',
  '^(قفل) (.+)$',
  '^(فتح) (.+)$',
  '^(تفعيل)$',
  '^(تفعيل) (.+)$',
  '^(تعطيل)$',
  '^(تعطيل) (.+)$',
  '^(ضع تكرار) (%d+)$',
  "^(مسح)$",
  "^(مسح) (.+)$",
  '^(منع) (.+)$',
  '^(الغاء منع) (.+)$',
  "^(حظر عام)$",
  "^(حظر عام) (@[%a%d_]+)$",
  "^(حظر عام) (%d+)$",
  "^(الغاء العام)$",
  "^(الغاء العام) (@[%a%d_]+)$",
  "^(الغاء العام) (%d+)$",
  "^(الغاء عام)$",
  "^(الغاء عام) (@[%a%d_]+)$",
  "^(الغاء عام) (%d+)$",
  "^(حظر)$",
  "^(حظر) (@[%a%d_]+)$",
  "^(حظر) (%d+)$",
  "^(الغاء الحظر)$", 
  "^(الغاء الحظر) (@[%a%d_]+)$",
  "^(الغاء الحظر) (%d+)$",
  "^(الغاء حظر)$", 
  "^(الغاء حظر) (@[%a%d_]+)$",
  "^(الغاء حظر) (%d+)$",
  "^(طرد)$",
  "^(طرد) (@[%a%d_]+)$",
  "^(طرد) (%d+)$",
  "^(كتم)$",
  "^(كتم) (@[%a%d_]+)$",
  "^(كتم) (%d+)$",
  "^(الغاء الكتم)$",
  "^(الغاء الكتم) (@[%a%d_]+)$",
  "^(الغاء الكتم) (%d+)$",
  "^(الغاء كتم)$",
  "^(الغاء كتم) (@[%a%d_]+)$",
  "^(الغاء كتم) (%d+)$",
  "^(رفع مطور)$",
  "^(رفع مطور) (@[%a%d_]+)$",
  "^(رفع مطور) (%d+)$",
  "^(تنزيل مطور)$",
  "^(تنزيل مطور) (%d+)$",
  "^(تنزيل مطور) (@[%a%d_]+)$",
  "^(تعطيل) (-%d+)$",
  "^(الاشتراك) ([123])$",
  "^(الاشتراك)$",
  "^(تنزيل الكل)$", 
  "^(شحن) (%d+)$",
  "^(المجموعه)$",
  "^(كشف البوت)$",
  "^(انشاء رابط)$",
  "^(ضع الرابط)$",
  "^(تثبيت)$",
  "^(الغاء التثبيت)$",
  "^(الغاء تثبيت)$",
  "^(رابط)$",
  "^(الرابط)$",
  "^(ضع رابط)$",
  "^(رابط خاص)$",
  "^(الرابط خاص)$",
  "^(القوانين)$",
  "^(ضع القوانين)$",
  "^(ضع قوانين)$",
  "^(ضع تكرار)$",
  "^(ضع التكرار)$",
  "^(الادمنيه)$",
  "^(تاك للكل)$",
  "^(نذار)$",
  "^(تاك)$",
  "^(قائمه المنع)$",
  "^(المدراء)$",
  "^(المميزين)$",
  "^(المكتومين)$",
  "^(ضع الترحيب)$",
  "^(الترحيب)$",
  "^(المنشى الاساسي)$",
  "^(المنشئ الاساسي)$",
  "^(المحظورين)$",
  "^(ضع اسم)$",
  "^(ضع صوره)$",
  "^(ضع وصف)$",
  "^(طرد البوتات)$",
  "^(كشف البوتات)$",
  "^(طرد المحذوفين)$",
  "^(رسائلي)$",
  "^(رسايلي)$",
  "^(احصائياتي)$",
  "^(معلوماتي)$",
  "^(مسح معلوماتي)$",
  "^(موقعي)$",
  "^(رفع الادمنيه)$",
  "^(صوره الترحيب)$",
  "^(ضع كليشه المطور)$",
  "^(المطور)$",
  "^(شرط التفعيل)$",
  "^(قائمه المجموعات)$",
  "^(المجموعات)$",
  "^(المجموعات 🌋)$",
  "^(المشتركين)$",
  "^(المشتركين Ⓜ)$",
  "^(اذاعه)$",
  "^(اذاعه عام)$",
  "^(اذاعه خاص)$",
  "^(اذاعه عام بالتوجيه)$",
  "^(اذاعه عام بالتوجيه 📣)$", 
  "^(اذاعه خاص 🗣)$", 
  "^(اذاعه عام 📢)$", 
  "^(اذاعه 🗣)$", 
  "^(قائمه العام)$",
  "^(قائمه العام 📜)$",
  "^(المطورين)$",
  "^(المطورين 🔥)$",
  "^(تيست)$",
  "^(test)$",
  "^(ايديي🆔)$",
  "^(قناة السورس)$",
  "^(الاحصائيات)$",
  "^(الاحصائيات 💥)$",
  "^(اضف رد عام)$",
  "^(اضف رد عام ➕)$",
  "^(مسح الردود)$",
  "^(مسح الردود العامه)$",
  "^(ضع اسم للبوت)$",
  "^(مسح الصوره)$",
  "^(مسح رد)$",
  "^(الردود)$",
  "^(الردود العامه)$",
  "^(الردود العامه 🗨)$",
  "^(اضف رد)$",
  "^(تعيين كليشه الايدي عام)$",
  "^(/UpdateSource)$",
  "^(تحديث السورس 🔂)$",
  "^(تحديث السورس)$",
  "^(تنظيف المجموعات)$",
  "^(تنظيف المشتركين)$",
  "^(تنظيف المجموعات 🗑)$",
  "^(تنظيف المشتركين 🗑)$",
  "^(رتبتي)$",
  "^(ضع اسم للبوت ©)$",
  "^(ضع صوره للترحيب 🌄)$",
  "^(ضع صوره للترحيب)$",
  "^(الحمايه)$",
  "^(الاعدادات)$",
  "^(الوسائط)$",
  "^(الغاء الامر ✖️)$",
  "^(الرتبه)$",
  "^(الغاء)$",
  "^(سحكاتي)$",
  "^(اسمي)$",
  "^(التاريخ)$",
  "^(/[Ss]tore)$",
  "^(اصدار السورس)$",
  "^(الاصدار)$",
  "^(server)$",
  "^(السيرفر)$",
  "^(اذاعه بالتثبيت)$",
  "^(فحص البوت)$", 
  "^(نسخه احتياطيه للمجموعات)$",
  "^(رفع نسخه الاحتياطيه)$", 
  "^(تفعيل الاشتراك الاجباري)$", 
  "^(تعطيل الاشتراك الاجباري)$", 
  "^(تغيير الاشتراك الاجباري)$", 
  "^(الاشتراك الاجباري)$", 
  "^(تفعيل الاشتراك الاجباري ☑)$", 
  "^(تعطيل الاشتراك الاجباري ♻️)$", 
  "^(تغيير الاشتراك الاجباري 🔁)$", 
  "^(الاشتراك الاجباري ⚠️)$", 
  "^(احظرني)$", 
  "^(اطردني)$", 
  "^(جهاتي)$", 
  
  
  
  
  
  
  
  
  
  "^(السورس)$",
  "^(سورس)$",
  "^(م المطور)$", 
  "^(اوامر الرد)$",
  "^(الاوامر)$",
  "^(م1)$",
  "^(م2)$",
  "^(م3)$",
  "^(م4)$",
  "^(م5)$",
  "^(م6)$",
  "^(م7)$",
   
   
   },
   ibita = ibita,
   dbita = dbita,
   }
  