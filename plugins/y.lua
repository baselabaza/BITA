function download_to_fileh(url, file_path) 
    local respbody = {} 
    local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
    local response = nil 
    options.redirect = false 
    response = {https.request(options)} 
    local code = response[2] 
    local headers = response[3] 
    local status = response[4] 
    if code ~= 200 then return false, code 
    end 
    file = io.open(file_path, "w+") 
    file:write(table.concat(respbody)) 
    file:close() 
    return file_path 
    end 
 local function yt(msg,MsgText)
    if msg.type ~= "pv" and msg.GroupActive then
    
    if MsgText[1] == 'تعطيل اليوتيوب' then
    if not msg.Director then 
    return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" 
    end
    redis:set(herwen.."dl_yt_dl"..msg.chat_id_,"close") 
    return '\n💢┇تم تعطيل اليوتيوب في المجموعه ...'
    end
    if MsgText[1] == 'تفعيل اليوتيوب' then
    if not msg.Director then 
    return "📛*¦* هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n🚶" 
    end
    redis:set(herwen.."dl_yt_dl"..msg.chat_id_,"open") 
    return '\n💢┇تم تفعيل اليوتيوب في المجموعه ...'
    end
    
if MsgText[1] and MsgText[2] == "!!" and redis:get(herwen.."dl_yt_dl"..msg.chat_id_) == "open" then
local InfoSearch = https.request('https://teamstorm.tk/search/?query='..URL.escape(MsgText[1]))
local JsonSearch = JSON.decode(InfoSearch)
for k,vv in pairs(JsonSearch) do
if k == 1 then
local url,res = https.request('https://teamstorm.tk/Get_yt/?url='..vv.id..'&status=getmp3')
local infoLink = JSON.decode(url)  
for k,v in pairs(infoLink) do
local download_to = download_to_fileh(v.url,vv.id..'.mp3')
print('download Mp3 done ...\nName : '..vv.Title..'\nIdLink : '..vv.id)
sendAudio(msg.chat_id_, msg.id_,'./'..download_to,vv.Title,'SourceCh ---> @baselabaza')
os.execute('rm -rf ./'..vv.id..'.mp3') 
https.request('https://teamstorm.tk/Get_yt/?url='..vv.id..'&status=del')
end
end
end
end
if MsgText[1] and MsgText[2] == "؟؟" and redis:get(herwen.."dl_yt_dl"..msg.chat_id_) == "open" then 
local InfoSearch = https.request('https://teamstorm.tk/search/?query='..URL.escape(MsgText[1]))
local JsonSearch = JSON.decode(InfoSearch)
for k,vv in pairs(JsonSearch) do
if k == 1 then
local url,res = https.request('https://teamstorm.tk/Get_yt/?url='..vv.id..'&status=getmp3')
local infoLink = JSON.decode(url)
for k,v in pairs(infoLink) do
local download_to = download_to_fileh(v.url,vv.id..'.ogg')
print('download Mp3 done ...\nName : '..vv.Title..'\nIdLink : '..vv.id)
sendVoice(msg.chat_id_,msg.id_,'./'..download_to,'SourceCh ---> @baselabaza')
os.execute('rm -rf ./'..vv.id..'.ogg') 
https.request('https://teamstorm.tk/Get_yt/?url='..vv.id..'&status=del')
end
end
end
end



    end
    end
    return {
    herwen = {
    '^(تفعيل اليوتيوب)$',
    '^(تعطيل اليوتيوب)$',
    '^(.*) (!!)$',
    '^(.*) (؟؟)$',
    },
    iherwen = yt,
    
    
    }
    
    
    