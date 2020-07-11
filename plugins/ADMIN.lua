
local function storm_send(chat_id, reply_to_message_id, text) local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
--###########################
function sendMention(msg,chat,text,user)   
entities = {}   
entities[0] = {ID='MessageEntityBold', offset_=0, length_=0}   
if text and text:match('{') and text:match('}')  then   
local x = utf8.len(text:match('(.*){'))   
local offset = x + 1  
local y = utf8.len(text:match('{(.*)}'))   
local length = y + 1  
text = text:gsub('{','')   
text = text:gsub('}','')   
table.insert(entities,{ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user})   
end   
return tdcli_function ({ID="SendMessage", chat_id_=chat, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_=entities}}, dl_cb, nil)   
end
local function getMessag(chat_id, message_id,cb) 
tdcli_function ({ ID = "GetMessage", chat_id_ = chat_id, message_id_ = message_id }, cb, nil) 
end 
--###########################
function CatchNameSet(Name) 
ChekName = utf8.sub(Name,0,35) 
Name = ChekName 
if utf8.len(Name) > 30 then
t=  Name..' ...' 
else
t = Name
end
return t
end
--###########################
function rem_admin(msg,chat,user) --// نتيجه تنزيل الادمن
if (msg.can_be_deleted_ == false) then   
storm_send(chat,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي وتفعيل جميع الصلاحيات \n👨🏻‍✈️*")   
return false end      
tdcli_function ({ID = "GetChatMember",chat_id_ = chat,user_id_ = user},function(arg,da) 
tdcli_function ({ID = "GetUser",user_id_ = user},function(arg,data) 
if data.message_ == "User not found" then
storm_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ لا استطيع استخراج معلوماته ✨ *\n', 1, 'md')
return false  end
if tonumber(user) == tonumber(bita) then  
storm_send(chat,msg.id_,"*📮¦ انا بوت لا تستطيع تنزيلي \n👨🏻‍✈️*")   
return false  end 
if (da and da.status_.ID == "ChatMemberStatusCreator") then
storm_send(chat,msg.id_,"*📮¦ عذرآ هاذا الشخص هوا منشئ المجموعه \n👨🏻‍✈️*")   
return false  end 
if (da and da.status_.ID == "ChatMemberStatusMember") then
storm_send(chat,msg.id_,"*📮¦ عذرآ هاذا الشخص ليس ادمن في المجموعه \n👨🏻‍✈️*")   
return false  end 
local SET_ADMIN = https.request('https://api.telegram.org/bot'..Token..'/promoteChatMember?chat_id='.. chat ..'&user_id='.. user..'&can_pin_messages=false&can_restrict_members=false&can_invite_users=false&can_delete_messages=false&can_change_info=false')
local JSON_ADMIN = JSON.decode(SET_ADMIN)
if (JSON_ADMIN.description == "Bad Request: not enough rights" and JSON_ADMIN.error_code == 400) then
storm_send(chat,msg.id_,"*📮¦ عذرآ هناك خطأ يرجي تفعيل صلاحية { اضافة مشرفين جدد } حتى استطيع تنزيله \n👨🏻‍✈️*")   
return false  end 
if (JSON_ADMIN.description == "Bad Request: CHAT_ADMIN_REQUIRED" and JSON_ADMIN.error_code == 400) then
storm_send(chat,msg.id_,"*📮¦ عذرآ هناك خطأ المستخدم انا لم اقم بترقيته مشرف في المجموعه لا استطيع تنزيله \n👨🏻‍✈️*")   
return false  end 
if (JSON_ADMIN.result == true) then
sendMention(msg,chat,'📮¦ العضو » {'..CatchNameSet(data.first_name_)..'}'..'\n📬¦ تم تنزيله من المشرفين في المجموعه \n',user)   
end end,nil) end,nil)   
end
--###########################
function add_admin(msg,chat,user) --// نتيجه رفع ادمن
if redis:get(bita.."Add:Pin"..msg.chat_id_) then
pin_msg = 'true'
pin = 'ꪜ'
else
pin_msg = 'false'
pin = '✘'
end
if redis:get(bita.."Add:Kick"..msg.chat_id_) then
Add_Kick = 'true'
kick = 'ꪜ'
else
Add_Kick = 'false'
kick = '✘'
end
if redis:get(bita.."Add:Info"..msg.chat_id_) then
Add_Info = 'true'
info = 'ꪜ'
else
Add_Info = 'false'
info = '✘'
end
if redis:get(bita.."Add:Set:Admin"..msg.chat_id_) then
Add_SetAdmin = 'true'
adde = 'ꪜ'
else
Add_SetAdmin = 'false'
adde = '✘'
end
if redis:get(bita.."Add:Del"..msg.chat_id_) then
Add_Del = 'true'
del = 'ꪜ'
else
Add_Del = 'false'
del = '✘'
end
if (msg.can_be_deleted_ == false) then   
storm_send(chat,msg.id_,"*📮¦ انا لست ادمن هنا يرجى ترقيتي وتفعيل جميع الصلاحيات \n👨🏻‍✈️*")   
return false end      
tdcli_function ({ID = "GetChatMember",chat_id_ = chat,user_id_ = user},function(arg,da) 
tdcli_function ({ID = "GetUser",user_id_ = user},function(arg,data) 
if data.message_ == "User not found" then
storm_sendMsg(msg.chat_id_, msg.id_, 1,'*📬¦ لا استطيع استخراج معلوماته ✨ *\n', 1, 'md')
return false  end
if tonumber(user) == tonumber(bot_id) then  
storm_send(chat,msg.id_,"*📮¦ انا بوت وصلاحيتي هي الادمن \n👨🏻‍✈️*")   
return false  end 
if (da and da.status_.ID == "ChatMemberStatusCreator") then
storm_send(chat,msg.id_,"*📮¦ عذرآ هاذا الشخص هوا منشئ المجموعه \n👨🏻‍✈️*")   
return false  end 
if (da and da.status_.ID == "ChatMemberStatusEditor") then
storm_send(chat,msg.id_,"*📮¦ عذرآ هاذا الشخص هوا ادمن في المجموعه \n👨🏻‍✈️*")   
return false  end 
local SET_ADMIN = https.request('https://api.telegram.org/bot'..Token..'/promoteChatMember?chat_id='.. chat ..'&user_id='.. user..'&can_pin_messages='..pin_msg..'&can_restrict_members='..Add_Kick..'&can_invite_users=true&can_delete_messages='..Add_Del..'&can_change_info='..Add_Info..'&can_promote_members='..Add_SetAdmin..'')
local JSON_ADMIN = JSON.decode(SET_ADMIN)
if (JSON_ADMIN.description == "Bad Request: not enough rights" and JSON_ADMIN.error_code == 400) then
storm_send(chat,msg.id_,"*📮¦ عذرآ هناك خطأ يرجي تفعيل صلاحية { اضافة مشرفين جدد } حتى استطيع ترقيته \n👨🏻‍✈️*")   
return false  end 
if (JSON_ADMIN.result == true) then
taha = '\n💢¦ واصبحت صلاحياته هي \nٴ━━━━━━━━━━\n📝¦ تغير معلومات المجموعه ↞ ❴ '..info..' ❵'..'\n📨¦ حذف الرسائل ↞ ❴ '..del..' ❵'..'\n🚷¦ حظر المستخدمين ↞ ❴ '..kick..' ❵'..'\n♻¦ دعوة مستخدمين ↞ ❴ ꪜ ❵'..'\n🔘¦ تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n🚸¦ اضافة مشرفين جدد ↞ ❴ '..adde..' ❵'
sendMention(msg,chat,'📮¦ العضو » {'..CatchNameSet(data.first_name_)..'}'..'\n📬¦ تم ترقيتة مشرف في المجموعه \n'..taha,user)   
end end,nil) end,nil)   
end

--###########################
function Get_Info(msg,chat,user) --// ارسال نتيجة الصلاحيه
local Chek_Info = https.request('https://api.telegram.org/bot'..Token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
storm_send(msg.chat_id_,msg.id_,'*\n🚸¦ صلاحياته منشئ الكروب 🍃*')   
return false  end 
if Json_Info.result.status == "member" then
storm_send(msg.chat_id_,msg.id_,'*\n🚸¦ مجرد عضو هنا 🍃*')   
return false  end 
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ'
else
info = '✘'
end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ'
else
delete = '✘'
end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ'
else
invite = '✘'
end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ'
else
pin = '✘'
end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ'
else
restrict = '✘'
end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ'
else
promote = '✘'
end
storm_send(chat,msg.id_,'\n📌¦ الرتبة : مشرف 🍃 '..'\n💢¦ والصلاحيات هي ↓ \nٴ━━━━━━━━━━'..'\n📝¦ تغير معلومات المجموعه ↞ ❴ '..info..' ❵'..'\n📨¦ حذف الرسائل ↞ ❴ '..delete..' ❵'..'\n🚷¦ حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n♻¦ دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n🔘¦ تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n🚸¦ اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end
--€€€€€€€€€€€€€€€€€€€€€
local function games(msg,MsgText)
if msg.type ~= "pv" and msg.GroupActive then
if MsgText[1] == "رفع مشرف" then
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
add_admin(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end 
if MsgText[1] == "تنزيل مشرف" then
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
rem_admin(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end 
if MsgText[1] == "رفع مشرف" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
local username = MsgText[2]
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
storm_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
storm_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false end      
add_admin(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
if MsgText[1] == "تنزيل مشرف" and MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
local username = MsgText[2]
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
storm_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
storm_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false end      
rem_admin(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 

if MsgText[1] == "رفع مشرف" and MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
if tonumber(msg.reply_to_message_id_) == 0 then 
add_admin(msg,msg.chat_id_,MsgText[2])
end
end  
if MsgText[1] == "تنزيل مشرف" and MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
if tonumber(msg.reply_to_message_id_) == 0 then 
rem_admin(msg,msg.chat_id_,MsgText[2])
end  
end
----------------------------------------
if MsgText[1] == "صلاحياته" then 
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
if tonumber(msg.reply_to_message_id_) == 0 then 
local username = MsgText[2]
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
storm_send(msg.chat_id_,msg.id_,"*📮¦ المعرف غير صحيح \n👨🏻‍✈️*")   
return false  end   
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
storm_send(msg.chat_id_,msg.id_,"*📮¦ هاذا معرف قناة \n👨🏻‍✈️*")   
return false end      
Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end
if MsgText[1] == 'فحص البوت' then
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
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
storm_send(msg.chat_id_,msg.id_,'\n📌¦ اهلا عزيزي البوت هنا ادمن'..'\n💢¦ وصلاحياته هي ↓ \nٴ━━━━━━━━━━'..'\n📝¦ تغير معلومات المجموعه ↞ ❴ '..info..' ❵'..'\n📨¦ حذف الرسائل ↞ ❴ '..delete..' ❵'..'\n🚷¦ حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n♻¦ دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n🔘¦ تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n🚸¦ اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end
----------------------------------------
if MsgText[1] == "تفعيل" and MsgText[2] == "صلاحيه التثبيت" then 
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
redis:set(bita.."Add:Pin"..msg.chat_id_,true)   
storm_send(msg.chat_id_,msg.id_,'🔰| تم تفعيل صلاحيه التثبيت')
end
if MsgText[1] == "تعطيل" and MsgText[2] == "صلاحيه التثبيت" then 
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
redis:del(bita.."Add:Pin"..msg.chat_id_)   
storm_send(msg.chat_id_,msg.id_,'🔰| تم تعطيل صلاحيه التثبيت')
end
if MsgText[1] == "تفعيل" and MsgText[2] == "صلاحيه الحذف" then 
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
redis:set(bita.."Add:Del"..msg.chat_id_,true)   
storm_send(msg.chat_id_,msg.id_,'🔰| تم تفعيل صلاحيه حذف الرسائل')
end
if MsgText[1] == "تفعيل" and MsgText[2] == "صلاحيه الحذف" then 
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
redis:del(bita.."Add:Del"..msg.chat_id_)   
storm_send(msg.chat_id_,msg.id_,'🔰| تم تعطيل صلاحية حذف الرسائل')
end
if MsgText[1] == "تفعيل" and MsgText[2] == "صلاحيه الرفع" then 
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
redis:set(bita.."Add:Set:Admin"..msg.chat_id_,true)   
storm_send(msg.chat_id_,msg.id_,'🔰| تم تفعيل صلاحيه اضافه مشرفين جدد')
end
if MsgText[1] == "تعطيل" and MsgText[2] == "صلاحيه الرفع" then 
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
redis:del(bita.."Add:Set:Admin"..msg.chat_id_)   
storm_send(msg.chat_id_,msg.id_,'🔰| تم تعطيل صلاحيه اضافة مشرفين جدد')
end
if MsgText[1] == "تفعيل" and MsgText[2] == "صلاحيه المعلومات" then 
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
redis:set(bita.."Add:Info"..msg.chat_id_,true)   
storm_send(msg.chat_id_,msg.id_,'🔰| تم تفعيل صلاحيه تغير معلومات المجموعه')
end
if MsgText[1] == "تعطيل" and MsgText[2] == "صلاحيه المعلومات" then 
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
redis:del(bita.."Add:Info"..msg.chat_id_)   
storm_send(msg.chat_id_,msg.id_,'🔰| تم تعطيل صلاحيه تغير معلومات المجموعه')
end
if MsgText[1] == "تفعيل" and MsgText[2] == "صلاحيه الطرد" then 
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
redis:set(bita.."Add:Kick"..msg.chat_id_,true)   
storm_send(msg.chat_id_,msg.id_,'🔰| تم تفعيل صلاحيه طرد المستخدمين')
end
if MsgText[1] == "تعطيل" and MsgText[2] == "صلاحيه الطرد" then 
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
redis:del(bita.."Add:Kick"..msg.chat_id_)   
storm_send(msg.chat_id_,msg.id_,'🔰| تم تعطيل صلاحيه طرد المستخدمين')
end

if MsgText[1] == 'م مشرف' then 
if not msg.Creator then
storm_send(msg.chat_id_,msg.id_,"*📮¦ عذرآ لا تستطيع استخدام هاذا الامر \n👨🏻‍✈️*")   
return false  end 
textt = [[
📌¦ اهلا بك في اوامر المشرفين
ٴ━━━━━━━━━━
💢¦ اوامر خاصه بالمنشئ ↓
ٴ━━━━━━━━━━
⚡¦ فحص البوت
⭐¦ رفع مشرف ❴ رد ؛ معرف ؛ ايدي ❵
🔖¦ تنزيل مشرف ❴ رد ؛ معرف ؛ ايدي ❵
ٴ━━━━━━━━━━
🙋🏻‍♂¦ اوامر تفعيل او التعطيل ↓
ٴ━━━━━━━━━━
🔰¦تفعيل/تعطيل صلاحيه التثبيت
🔰¦تفعيل/تعطيل صلاحيه المعلومات
🔰¦تفعيل/تعطيل صلاحيه الحذف
🔰¦تفعيل/تعطيل صلاحيه الطرد
🔰¦تفعيل/تعطيل صلاحيه الرفع
ٴ━━━━━━━━━━
🙋🏻‍♂¦ اوامر متاحه للجميع ↓
ٴ━━━━━━━━━━
🔖¦ صلاحياتي
🔰¦ صلاحياته ❴ رد ؛ معرف ❵
ٴ━━━━━━━━━━
🍃¦ مطور البوت » [@XB_0B]
]]
storm_send(msg.chat_id_,msg.id_,textt)   
end


end
end


return {
bita = {
'^(صلاحياته)$',
'^(تعطيل) (.+)$',
'^(تفعيل) (.+)$',
'^(اوامر المشرفين)$',
'^(صلاحياتي)$',
'^(فحص البوت)$',
"^(صلاحياته) (@[%a%d_]+)$",
'^(رفع مشرف)$',
'^(رفع مشرف) (@[%a%d_]+)$',
'^(رفع مشرف) (%d+)$',
'^(تنزيل مشرف)$',
'^(تنزيل مشرف) (@[%a%d_]+)$',
'^(تنزيل مشرف) (%d+)$', 

 },
 ibita = games,


 }


