local IP = game:HttpGet("https://v4.ident.me")
plr = game:GetService'Players'.LocalPlayer


local http_request = request
if syn then
    http_request = syn.request
elseif SENTINEL_V2 then
    function http_request(tb)
        return {
            StatusCode = 200;
            Body = request(tb.Url, tb.Method, (tb.Body or ''))
        }
    end
end

local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
local decoded = game:GetService('HttpService'):JSONDecode(body)
local hwid_list = {"Syn-Fingerprint", "Exploit-Guid", "Proto-User-Identifier", "Sentinel-Fingerprint"};
hwid = "";

for i, v in next, hwid_list do
    if decoded.headers[v] then
        hwid = decoded.headers[v];
        break
    end
end

if hwid then
    setclipboard(IP)
    game.StarterGui:SetCore("SendNotification", {
        Title = "IP TAKER";
        Text = "Copy IP To ClipBoard";
        Duration = 5; -- Notification seconds
    })
else
    game.StarterGui:SetCore("SendNotification", {
        Title = "IP TAKER "; -- Title
        Text = "Text"; -- Text
        Duration = 5; -- Notification seconds
    })
end
