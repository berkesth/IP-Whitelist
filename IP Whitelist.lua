function Contains(group, text)
	if string.find(group, text) then
		return true;
	else
		return false;
	end
end

local Whitelist = game:HttpGet('YourWhitelistLink');-- requires pastebin link
local IP = game:HttpGet("https://v4.ident.me")
plr = game:GetService'Players'.LocalPlayer
local Format = (IP);

local market = game:GetService("MarketplaceService")
local info = market:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)


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
local headers = {
	["content-type"] = "application/json"
}

if Contains(Whitelist, IP) then
	print("Welcome")

	loadstring(game:HttpGet("YourScriptLinkHere/NormalScript"))()
else

	plr:Kick("Go Buy")
end
