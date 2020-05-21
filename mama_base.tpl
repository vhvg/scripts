{% if request.target == "clash" or request.target == "clashr" %}

port: {{ global.clash.http_port }}
socks-port: {{ global.clash.socks_port }}
allow-lan: {{ global.clash.allow_lan }}
mode: Rule
log-level: {{ global.clash.log_level }}
external-controller: :9090
{% if request.clash.dns == "1" %}
dns:
  enabled: true
  listen: 1053
{% endif %}
{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}

{% endif %}
{% if request.target == "surge" %}

[General]
loglevel = notify
bypass-system = true
skip-proxy = 127.0.0.1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,100.64.0.0/10,localhost,*.local,e.crashlytics.com,captive.apple.com,::ffff:0:0:0:0/1,::ffff:128:0:0:0/1
#DNS设置或根据自己网络情况进行相应设置
bypass-tun = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12
dns-server = 119.29.29.29,223.5.5.5

[Script]
http-request https?:\/\/.*\.iqiyi\.com\/.*authcookie= script-path=https://raw.githubusercontent.com/NobyDa/Script/master/iQIYI-DailyBonus/iQIYI.js

{% endif %}
{% if request.target == "loon" %}

# Loon全局配置 by nzw9314
# YouTube去广告请删除hostname 后的.bak
# GitHub主页(https://github.com/nzw9314)
# TG通知频道 (https://t.me/nzw9314News)

[General]
ipv6 = true
skip-proxy = 10.0.0.0/8,127.0.0.0/8,169.254.0.0/16,192.0.2.0/24,192.168.0.0/16,198.51.100.0/24,224.0.0.0/4,*.local,localhostlocal
bypass-tun = 10.0.0.0/8,127.0.0.0/8,169.254.0.0/16,192.0.2.0/24,192.168.0.0/16,198.51.100.0/24,224.0.0.0/4
# [DNS] => DNS 服务器
dns-server = system,1.2.4.8,119.29.29.29,223.5.5.5
allow-udp-proxy = true
host = 127.0.0.1

[Remote Proxy]
# 订阅节点
# 别名 = 订阅URL


[Remote Filter]
# 筛选订阅节点，筛选后的结果可加入到策略组中，目前支持三种筛选方式
# NodeSelect: 使用在UI上选择的节点。
# NameKeyword: 根据提供的关键词对订阅中所有节点的名称进行筛选，使用筛选后的节点。
# NameRegex: 根据提供的正则表达式对订阅中所有节点的名称进行筛选，使用筛选后的节点。

🇭🇰香港 = NameRegex,✈️机场1,✈️机场2,Cordcloud, FilterKey = "香港|HK"
🇯🇵日本 = NameRegex,✈️机场1,✈️机场2,Cordcloud, FilterKey = "日本|JP"
🇰🇷韩国 = NameRegex,✈️机场1,✈️机场2,Cordcloud, FilterKey = "韩国|KR"
🇺🇸美国 = NameRegex,✈️机场1,✈️机场2,Cordcloud, FilterKey = "美国|US"
Other = NameRegex,✈️机场1,✈️机场2, FilterKey = "^(?!.*(HK|JP|US|KR|香港|日本|韩国|美国)).*$"

[Proxy]
# 本地节点

# 内置 DIRECT、REJECT 策略

[Proxy Group]

代理 = url-test,🇭🇰香港,url = http://www.gstatic.com/generate_204,interval = 600

🚫𝐀𝐝 𝐁𝐥𝐨𝐜𝐤 = select,⛔️𝐑𝐞𝐣𝐞𝐜𝐭,🎯𝐃𝐢𝐫𝐞𝐜𝐭
🎯𝐃𝐢𝐫𝐞𝐜𝐭 = select,DIRECT
⛔️𝐑𝐞𝐣𝐞𝐜𝐭 = select,REJECT


[Rule]
# 本地规则
# Type:DOMAIN-SUFFIX,DOMAIN,DOMAIN-KEYWORD,USER-AGENT,URL-REGEX,IP-CIDR
# Strategy:DIRECT,Proxy,REJECT
# Options:force-remote-dns(Default:false),no-resolve

#  𝐍𝐞𝐭𝐞𝐚𝐬𝐞𝐌𝐮𝐬𝐢𝐜
DOMAIN-SUFFIX,music.126.net,DIRECT

# GeoIP China
GEOIP,CN,🎯𝐃𝐢𝐫𝐞𝐜𝐭
FINAL, 🎯𝐃𝐢𝐫𝐞𝐜𝐭

[Remote Rule]


# 订阅规则
https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/Liby.list, policy=🚫𝐀𝐝 𝐁𝐥𝐨𝐜𝐤, enabled=true
https://raw.githubusercontent.com/nzw9314/Surge/master/Ruleset/Tide.list, policy=🚫𝐀𝐝 𝐁𝐥𝐨𝐜𝐤, enabled=true


https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/Domestic.list, policy=🎯𝐃𝐢𝐫𝐞𝐜𝐭, enabled=true
https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/Global.list, policy=代理, enabled=true
https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/Region.list, policy=🎯𝐃𝐢𝐫𝐞𝐜𝐭, enabled=true

[URL Rewrite]
# 本地重写

# > Redirect Google Service
^https?:\/\/(www.)?(g|google)\.cn https://www.google.com 302

# > TikTok Unlock (By Choler)
# 区域请修改下方国家代码，默认为日本 JP

(?<=_region=)CN(?=&) JP 307
(?<=&app_version=)16..(?=.?.?&) 1 307
(?<=\?version_code=)16..(?=.?.?&) 1 307

# > 抖音 去广告&水印
# 需配合脚本使用
^https?:\/\/[\w-]+\.amemv\.com\/aweme\/v\d\/feed\/ https://aweme.snssdk.com/aweme/v1/feed/ header
^https?:\/\/[\w-]+\.amemv\.com\/aweme\/v\d\/aweme\/post\/ https://aweme.snssdk.com/aweme/v1/aweme/post/ header
^https?:\/\/[\w-]+\.amemv\.com\/aweme\/v\d\/follow\/feed\/ https://aweme.snssdk.com/aweme/v1/follow/feed/ header
^https?:\/\/[\w-]+\.amemv\.com\/aweme\/v\d\/nearby\/feed\/ https://aweme.snssdk.com/aweme/v1/nearby/feed/ header
^https?:\/\/[\w-]+\.amemv\.com\/aweme\/v\d\/search\/item\/ https://aweme.snssdk.com/aweme/v1/search/item/ header
^https?:\/\/[\w-]+\.amemv\.com\/aweme\/v\d\/general\/search\/single\/ https://aweme.snssdk.com/aweme/v1/general/search/single/ header
^https?:\/\/[\w-]+\.amemv\.com\/aweme\/v\d\/hot/search\/video\/list\/ https://aweme.snssdk.com/aweme/v1/hot/search/video/list/ header

enable = true

[Remote Rewrite]
#订阅重写 去广告 by eHpo
# 格式：订阅url，别名(可选)
https://raw.githubusercontent.com/eHpo1/Rules/master/Loon/Rewrite.conf, tag=eHpo, enabled=true
https://raw.githubusercontent.com/nzw9314/Loon/master/Q-Search_All_in_one.conf, tag=Q-Search_All_in_one, enabled=true
[Script]
# 本地脚本
enable = true

[Remote Script]
# 远程脚本
https://raw.githubusercontent.com/nzw9314/Loon/master/Task.conf, tag=签到, enabled=false
https://raw.githubusercontent.com/nzw9314/Loon/master/Script.conf, tag=脚本, enabled=true
https://raw.githubusercontent.com/nzw9314/Loon/master/Cookie.conf, tag=Cookie, enabled=false

[MITM]
enable = true
hostname = *.googlevideo.com.bak
skip-server-cert-verify = true
ca-p12 = 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
ca-passphrase = eHpo



{% endif %}
{% if request.target == "quan" %}

[SERVER]

[SOURCE]

[BACKUP-SERVER]

[SUSPEND-SSID]

[POLICY]

[DNS]
1.1.1.1

[REWRITE]

[URL-REJECTION]

[TCP]

[GLOBAL]

[HOST]

[STATE]
STATE,AUTO

[MITM]

{% endif %}
{% if request.target == "quanx" %}

[general]
excluded_routes=192.168.0.0/16, 172.16.0.0/12, 100.64.0.0/10, 10.0.0.0/8
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js
network_check_url=http://www.baidu.com/
server_check_url=http://www.gstatic.com/generate_204

[dns]
server=119.29.29.29
server=223.5.5.5
server=1.0.0.1
server=8.8.8.8

[policy]
static=♻️ 自动选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
static=🔰 节点选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
static=🌍 国外媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
static=🌏 国内媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/DomesticMedia.png
static=Ⓜ️ 微软服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
static=📲 电报信息, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
static=🍎 苹果服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=🎯 全球直连, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Direct.png
static=🛑 全球拦截, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Advertising.png
static=🐟 漏网之鱼, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png

[server_remote]

[filter_remote]

[rewrite_remote]

[server_local]

[filter_local]

[rewrite_local]

[mitm]

{% endif %}
{% if request.target == "mellow" %}

[Endpoint]
DIRECT, builtin, freedom, domainStrategy=UseIP
REJECT, builtin, blackhole
Dns-Out, builtin, dns

[Routing]
domainStrategy = IPIfNonMatch

[Dns]
hijack = Dns-Out
clientIp = 114.114.114.114

[DnsServer]
localhost
223.5.5.5
8.8.8.8, 53, Remote
8.8.4.4

[DnsRule]
DOMAIN-KEYWORD, geosite:geolocation-!cn, Remote
DOMAIN-SUFFIX, google.com, Remote

[DnsHost]
doubleclick.net = 127.0.0.1

[Log]
loglevel = warning

{% endif %}
{% if request.target == "surfboard" %}

[General]
loglevel = notify
interface = 127.0.0.1
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, localhost, *.local
ipv6 = false
dns-server = system, 223.5.5.5
exclude-simple-hostnames = true
enhanced-mode-by-rule = true
{% endif %}
{% if request.target == "sssub" %}
{
  "route": "bypass-lan-china",
  "remote_dns": "dns.google",
  "ipv6": false,
  "metered": false,
  "proxy_apps": {
    "enabled": false,
    "bypass": true,
    "android_list": [
      "com.eg.android.AlipayGphone",
      "com.wudaokou.hippo",
      "com.zhihu.android"
    ]
  },
  "udpdns": false
}

{% endif %}
