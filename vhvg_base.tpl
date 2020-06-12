{% if request.target == "clash" or request.target == "clashr" %}

port: 7890
socks-port: 7891
redir-port: 7892
allow-lan: true
mode: Rule
log-level: info
external-controller: '127.0.0.1:9090'
experimental:
  ignore-resolve-fail: true
secret: ''

# System proxy will ignore these domains(or ipnet)
cfw-bypass:
  - localhost
  - 127.*
  - 10.*
  - 172.16.*
  - 172.17.*
  - 172.18.*
  - 172.19.*
  - 172.20.*
  - 172.21.*
  - 172.22.*
  - 172.23.*
  - 172.24.*
  - 172.25.*
  - 172.26.*
  - 172.27.*
  - 172.28.*
  - 172.29.*
  - 172.30.*
  - 172.31.*
  - 192.168.*
  - <local>

# Proxies module latency test settings
cfw-latency-timeout: 3000 # seconds



{% endif %}

{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% endif %}
{% if local.clash.new_field_name == "false" %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}



{% if request.target == "surge" %}

[General]
# 来自 https://github.com/nzw9314/Surge 与 https://github.com/lhie1/Rules/tree/master/Surge/Surge%203

# 日志等级 warning, notify, info, verbose (默认: notify)
loglevel = notify

# 网络诊断
# > Internet 测试 URL
internet-test-url = http://bing.com

# > 代理测速 URL
proxy-test-url = http://www.gstatic.com/generate_204

# > 测速超时 (s)
test-timeout = 3

# IPv6 支持
ipv6 = true

# Wi-Fi 访问
# > 允许 Wi-Fi 网络下其它设备访问
allow-wifi-access = true

# > HTTP 代理服务端口（默认 "6152"）
# wifi-access-http-port = 6152

# > SOCKS5 代理服务端口（默认 "6153"）
# wifi-access-socks5-port = 6153

# 外部控制器
external-controller-access = admin@0.0.0.0:6170

# > WiFi助理
# wifi-assist = true

# 兼容性
# > 兼容模式（默认 "禁用"）
# compatibility-mode = 0

# > 跳过某个域名或者IP段
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, 17.0.0.0/8, localhost, *.local, *.crashlytics.com

bypass-system = true

# 实验性支持

# > TLS Provider: default, secure-transport, network-framework, openssl (默认: default)
tls-provider = default

# > 启动 Network.framework（默认不启用）
network-framework = false

# 其他（请先阅读手册，除非你明确知道其含义，否则不要修改任何设置）
# > Show Reject Error Page
show-error-page-for-reject = true

# > Hijack DNS
# hijack-dns =

# > TCP Force HTTP Hosts
# force-http-engine-hosts = example.com:80

# > VIF Excluded Routes
tun-excluded-routes = 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12

# > VIF Included Routes
# tun-included-routes = 192.168.1.12/32

# DNS 服务器
# dns-server = 119.29.29.29, 223.5.5.5, 1.2.4.8
dns-server = 119.29.29.29, 223.5.5.5, 1.2.4.8, system

[Replica]
# [抓取流量] => 过滤器
# > 隐藏 Apple 请求
hide-apple-request = true
# > 隐藏 Crashlytics 请求
hide-crashlytics-request = true
# > 隐藏 UDP 会话
hide-udp = false
# > 关键词过滤器
keyword-filter-type = (null)
keyword-filter = icloud,ocsp,logs,analytic,ads,imap,adthor,applovin,appnext,talk,dropbox,spys

[Proxy]
# 节点名称 = 协议，服务器地址，服务器端口，encrypt-method=加密协议，password=密码，obfs=混淆类型（http/tls），obfs-host=混淆地址
# 3 和 4 的 obfs 仅为示例，需服务端支持，如果不懂就别加
1 = ss, 1.2.3.4, 443, encrypt-method=aes-128-gcm, password=password
2 = ss, 1.2.3.4, 443, encrypt-method=aes-128-gcm, password=password
3 = ss, 1.2.3.4, 443, encrypt-method=chacha20-ietf-poly1305, password=password, obfs=tls, obfs-host=yunjiasu-cdn.net
4 = ss, 1.2.3.4, 443, encrypt-method=chacha20-ietf-poly1305, password=password, obfs=http, obfs-host=bing.com

[Proxy Group]
# 白名单模式 PROXY，黑名单模式 DIRECT
Final = select,PROXY,DIRECT
# 节点选项
PROXY = select,Auto,1,2,3,4
# 自定义多区域媒体应用
# YouTube = select,1,2,3,4
# Netflix = select,1,2,3,4
# HBO = select,1,2,3,4
# Fox = select,1,2,3,4
# 国际流媒体服务
GlobalMedia = select,PROXY,1,2,3,4
# 大陆流媒体面向港澳台限定服务
HKMTMedia = select,DIRECT,1,2,3,4
# Apple 服务策略组
Apple = select,DIRECT,1,2,3,4
# Telegram
# Telegram = select,DIRECT,1,2,3,4
# 广告（以及隐私追踪保护开关，不建议 macOS 开启）
Advertising = select,REJECT,DIRECT
# 劫持（运营商及臭名昭著的网站和应用）
Hijacking = select,REJECT,DIRECT
# 延迟自动测速
Auto = url-test,1,2,3,4,url = http://bing.com/

[Rule]

// DOMAIN-SET,https://raw.githubusercontent.com/NobyDa/ND-AD/master/Surge/AD_Block.txt,🚫AdBlock

// Detect local network
GEOIP, CN, 🍂 Domestic
// Use Proxy for all others
FINAL, ☁️ Others, dns-failed


[URL Rewrite]
# Redirect Google Search Service
^http:\/\/www\.google\.cn https://www.google.com 302


[Header Rewrite]
# 百度贴吧
^https?+:\/\/(?:c\.)?+tieba\.baidu\.com\/(?>f|p) header-replace User-Agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Safari/605.1.15"
^https?+:\/\/jump2\.bdimg\.com\/(?>f|p) header-replace User-Agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Safari/605.1.15"
# 百度知道
^https?+:\/\/zhidao\.baidu\.com header-replace User-Agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Safari/605.1.15"
# 知乎
^https?+:\/\/www\.zhihu\.com\/question header-replace User-Agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.4 Safari/605.1.15"



[MITM]
skip-server-cert-verify = true
hostname = *.googlevideo.com, *.amemv.com, *.iydsj.com, *.k.sohu.com, *.kakamobi.cn, *.kingsoft-office-service.com, *.meituan.net, *.musical.ly, *.ofo.com, *.pstatp.com, *.snssdk.com, *.tiktokv.com, *.tv.sohu.com, *.uve.weibo.com, *.ydstatic.com, 101.201.175.228, 119.18.193.135, 123.59.31.1, 154.8.131.171, 182.92.251.113, 4gimg.map.qq.com, a.apicloud.com, a.qiumibao.com, acs.m.taobao.com, act.vip.iqiyi.com, api*.futunn.com, api.21jingji.com, api.caijingmobile.com, api.chelaile.net.cn, api.daydaycook.com.cn, api.douban.com, api.gotokeep.com, api.haohaozhu.cn, api.huomao.com, api.intsig.net, api.izuiyou.com, api.jr.mi.com, api.jxedt.com, api.kkmh.com, api.m.jd.com, api.meipian.me, api.mgzf.com, api.psy-1.com, api.qbb6.com, api.rr.tv, api.smzdm.com, api.vistopia.com.cn, api.waitwaitpay.com, api.wallstreetcn.com, api.weibo.cn, api.xiachufang.com, api.xueqiu.com, api.yangkeduo.com, api.zhihu.com, api.zhuishushenqi.com, api-mifit*.huami.com, api-release.wuta-cam.com, app.58.com, app.api.ke.com, app.bilibili.com, app.mixcapp.com, app.poizon.com, app.variflight.com, app.wy.guahao.com, app.xinpianchang.com, app.yinxiang.com, app.zhuanzhuan.com, appapi.huazhu.com, app-api.smzdm.com, appconf.mail.163.com, appv6.55haitao.com, b.zhuishushenqi.com, business-cdn.shouji.sogou.com, c.m.163.com, cap.caocaokeji.cn, capi.mwee.cn, ccsp-egmas.sf-express.com, cdn.moji.com, cdnfile1.msstatic.com, channel.beitaichufang.com, client.mail.163.com, clientaccess.10086.cn, cms.daydaycook.com.cn, consumer.fcbox.com, creditcardapp.bankcomm.com, daoyu.sdo.com, dl.app.gtja.com, dsa-mfp.fengshows.cn, dxy.com, e.dangdang.com, easyreadfs.nosdn.127.net, g.cdn.pengpengla.com, gateway.shouqiev.com, guide-acs.m.taobao.com, gw.alicdn.com, gw.csdn.net, gw-passenger.01zhuanche.com, heic.alicdn.com, i.ys7.com, iapi.bishijie.com, iface.iqiyi.com, ih2.ireader.com, imeclient.openspeech.cn, img.jiemian.com, img01.10101111cdn.com, interface.music.163.com, ios.lantouzi.com, ios.wps.cn, jump2.bdimg.com, kaola-haitao.oss.kaolacdn.com, learn.chaoxing.com, list-app-m.i4.cn, m*.amap.com, m.client.10010.com, m.ibuscloud.com, m.tuniu.com, m.yap.yahoo.com, manga.bilibili.com, mapi.mafengwo.cn, media.qyer.com, mlife.jf365.boc.cn, mob.mddcloud.com.cn, mobi.360doc.com, mp.weixin.qq.com, mrobot.pcauto.com.cn, mrobot.pconline.com.cn, ms.jr.jd.com, msspjh.emarbox.com, news.ssp.qq.com, newsso.map.qq.com, nnapp.cloudbae.cn, open.qyer.com, p.du.163.com, pan.baidu.com, pic*.chelaile.net, pic1cdn.cmbchina.com, pocketuni.net, portal-xunyou.qingcdn.com, promo.xueqiu.com, pss.txffp.com, r.inews.qq.com, render.alipay.com, res.xiaojukeji.com, resrelease.wuta-cam.com, restapi.iyunmai.com, richmanapi.jxedt.com, rtbapi.douyucdn.cn, s*.zdmimg.com, s.youtube.com, service.4gtv.tv, slapi.oray.net, smkmp.96225.com, snailsleep.net, ss0.bdstatic.com, ssl.kohsocialapp.qq.com, static.vuevideo.net, static1.keepcdn.com, status.boohee.com, support.you.163.com, thor.weidian.com, tieba.baidu.com, tiku.zhan.com, weibointl.api.weibo.cn, www.bodivis.com.cn, www.dandanzan.com, www.flyertea.com, www.hxeduonline.com, www.icourse163.org, www.iyingdi.cn, www.tieba.com, www.youtube.com, www.zhihu.com, www.zybang.com, xyz.cnki.net, xyst.yuanfudao.com, youtubei.googleapis.com, yxyapi*.drcuiyutao.com, zhidao.baidu.com
ca-passphrase = eHpo
ca-p12 = MIIJrgIBAzCCCXgGCSqGSIb3DQEHAaCCCWkEggllMIIJYTCCA/8GCSqGSIb3DQEHBqCCA/AwggPsAgEAMIID5QYJKoZIhvcNAQcBMBwGCiqGSIb3DQEMAQYwDgQIYl/myyqpUtwCAggAgIIDuMYEzEUgSxIUScp1vSSooV2iePmy4Q7YP8cfnhaatGNnX+CC9/rDdPgDuz7k1D/7hYdaOsTKpXU9aUAxHvg9SLAWFm5dL4g/9MVk7Id8qCPMYbO2H+lQTChEN8iTpWdq+qlAC8VpqY1TTXhQTkCKF3cT+S68xZUMFDuX95INBUswjN+imGIYVKFBp4s0K7UDFpF0BMUD5HwR9U/QFsZ+ScCaNj/Y1p95LWPllUkeeb67uTOeXc55yEM+O8W/SGjJhgjdnvPgetCfLMc6RWREK0SNAGMzHibuvHHHm0fIBg5zwE+DjDdefwYMUghpQVl+0gSeASjsvP9mSgtm9+horQCw/ef0a3FxcKsmTzSE6o4dx37fEckEouYN/Ni+OWnKWb6eXeaL6yVD4gLDmEwV8lmgBG4OjYcdY9jeIBFkDzbG70eUvmj6/1olUtnOnkGY5ZMvCGhVr8K4ZJ80xuykgxgPI/5enNZZiS9cAuk85xAN+XeDvmQdIHF9TxMRyLGJyWUkczjV3DSPkqZ2hMFJRuOF5zbhZlCcJgkEdCYbb4sebYnGKOEVnfceFVK1yv33Hp+BcQDmqEm+gssrtNhJGCWtqTjT28WeGxGgAWOaY2e+isVJG6TvU1D+tHCl09WyLKM671a63jY6QvpWwRpSMkbcrGEMhQRo2IMrxhwkia9vkk+eDYRt4jJcG8gRAWB0crXuYMM/t0gxDKTiVF7aS0XEHWMkH7ATWFI/+Yta4dsVLAOACnTCarD80RH/xV5JK1KiAn5pSzy13fRwvYcHAluJ/7JHphVUtNYroNgfzdt5n65B7qD5PU4ykhVMfflZXom17VGwUqf750kx0fowU23XCUyWoifoGBbkR9mgGHBqZyMZHv+Z9iWPmpqJcfjL9UBX91Ulzg74IQocvNTHMVu3cLXx63OiQ6k4+FYZcvTiJyYpu7N36I/nLz61L3D2d8LaYLHAcvnsClfC6QRVVAU/wvQnhp2/oPh/l19KBX7QUnBKPU1oFLEV8y1G87IbN/LDJ0SUroS/McCojANgutTpKQJT+5jlid+GxZkEi4CXlTAUfu6/lioLdJugycPEKHu49zAmbDw8lUy5QRUbyjWrZk8tLu2bKzaxg5A21N9N/zKt9uXmcN5J/O1L8WIcAIXDytAmkyw7ez45EF631i6k2uJeuIxtBwRfwDyuw4FwKrsqw197FoqsvsMb68Tak2vVtzgs/rSQ1PL3acsLQ0CBZ9/Do1WxAb8azc4ko36JE7e0xtM43qswggVaBgkqhkiG9w0BBwGgggVLBIIFRzCCBUMwggU/BgsqhkiG9w0BDAoBAqCCBO4wggTqMBwGCiqGSIb3DQEMAQMwDgQI3rZrdI9fPuMCAggABIIEyGZyUi/orJ8LMBdjZFQaCNXECddtwPuKPg+QxAzpxC0/VSgdtHsOR/v8koAJgddmGJUDwLXGVcuasJ7YlhdIKpnvSzNBB7qjJoQBQ5dMsXVfcJaRwbhjMExjZyvUjCKH21lJ7yaxGQORtmIXTpx0FPQUprJtghF/C2ejA9QSW+SCjYY64dkvUovvXMDaddKWq+i0lOGKi0hvCjGiLobIovBpSfjX1EYTK5pmpBtWKro5Wnm/Q5r/OBU2+PyzlFCZdMdov7bIcUwnz4D1Oypn6woQol8N9AqgQL52pMweL8k0fK8YH3eChE5EP0JNc1X0vRTHhKiAB0Su5vjSVa5QU4ZBTCdNdwM7rr2NJMzMjF8g4y7fXMTVXdPUi1QeYihOqmcU2i0pmrk4zPeobGfzLIcgRSLf9qeP2r9Gw3yt3rjJMHgbx6QvBZ+5GZ8/iooQTbLjUj83QfdGeidkD+Auba9f8cPDiurDF+Pjt2FotaT3Vqx38qlaprBdlk7H1yVZtY2G5Y5pquiyPK/C+QwrXYWEocsJIAvAb3xhXalqkUs6ZmKTVQqlpUR0L/ogRmeJ0OxHYKbqy4Rg2eIcHogPEK2Xa2iiPFmG6AbWUnE8mmH5PunCPGuhcOxFYZAkpf96//c0J9ry52pcvR15ZIvmZdSLrhjD4pD+CElUKFS6izafXSyFQpjNuQI2aCnMNS/AFSe3kH6naARoOUnXFC7Wz+e69nOKs6G84/gV3xD4klk5vCza32e55MtUD9SX09+q9XItarBeBYCn3XCZk1sZADmg8gHxZzgEj3mA7slqsRnx7E80lz1UlHU4FSLkeMEU2u9/K1QA6VZzFfFRXtitZuam2Di98zCyftyb0D0DwlywSab/ww7VrROnBq3sozc7uo7eEiT8Jx9qd2kGNF+r9KI6QePBtATJzsgCNoPHNTdA7DNX4opD0bNsRtFHQLW3b9k1PeeAix1agcrqsDVV2PsWn9Qae9vY4zqwkNY+hjlmt2CRPG/5pX8COVn+dzqGHTksFg/NgVZsAj8NK4ZGf+QSRxSUo/5sYbu61Pj6TpyEIjOEPM+ylXdhziKhDTfw4GkrmTjlrQQ9T+7pqC86nYS8HH9ZcET+SecZK8kMPe7pwbzwHPWsl+OqHTP01KvEAogOL8fAZ7LsbaHlPoLHkHDQzxeep6ZKDnoCphjsf4oqSlcQzNh383mAr0YTPY8SaVV5G6Hh9mCHQqKWWmXhNd8rN/kqZn0H7KvfMJW2BGVWgCvYaE5m5sodhHYjSMGzgauV7O9DL3H+Az2Ztz0K2hj11xsz/C7nRVNOgV02rDvIEHw0asBPq2gYPC4OG/HutK+etT87z+tLftGO9V5+TMcIc4JKaNVOUg814DP59yo/WptH346rHwY7AqvgmEi6LJ1LLP9W6+HH1k3Fk6WEpOtDJS3YqV4EjswXGCtLXu6y/IvqLkyvT7NIZi/BYFf39xwJDvD5SbLM2jhCShG/HsD0/4qfqeGA/x4LLaM9Lyl091XeKWtY9XpP9nZzfgOJkk2rsBH29jS5d8lLkz+GhdzrROPIgHn+yaSsp8vIwr8L9h27+6/95kbUiQugOWEWdO/ZO+X/iyhThallmiNbJP+Qv3abUJgzcTE+MBcGCSqGSIb3DQEJFDEKHggAZQBIAHAAbzAjBgkqhkiG9w0BCRUxFgQU5gr9fNKSpq6pZ3g5Hca/uXOuY+cwLTAhMAkGBSsOAwIaBQAEFKXWG0IDj30Q2VfVGNWcVJ8iipuZBAgHvSM3D+pSUA==



[Script]
ali = type=http-response,pattern=^https?+:\/\/amdc\.m\.taobao\.com\/amdc\/mobileDispatch,requires-body=1,script-path=https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Script/ali.js
etao = type=http-response,pattern=^https?+:\/\/acs\.m\.taobao\.com\/gw\/mtop\.alimama\.etao\.config\.query\/,requires-body=1,script-path=https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Script/etao.js




{% endif %}
{% if request.target == "loon" %}

[General]
skip-proxy = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,localhost,*.local,e.crashlynatics.com
bypass-tun = 10.0.0.0/8,100.64.0.0/10,127.0.0.0/8,169.254.0.0/16,172.16.0.0/12,192.0.0.0/24,192.0.2.0/24,192.88.99.0/24,192.168.0.0/16,198.18.0.0/15,198.51.100.0/24,203.0.113.0/24,224.0.0.0/4,255.255.255.255/32
dns-server = system,119.29.29.29,223.5.5.5
allow-udp-proxy = false
host = 127.0.0.1

[Proxy]

[Remote Proxy]

[Proxy Group]

[Rule]

[Remote Rule]

[URL Rewrite]
enable = true
^https?:\/\/(www.)?(g|google)\.cn https://www.google.com 302

[Remote Rewrite]
https://raw.githubusercontent.com/Loon0x00/LoonExampleConfig/master/Rewrite/AutoRewrite_Example.list,auto

[MITM]
hostname = *.example.com,*.sample.com
enable = true
skip-server-cert-verify = true
#ca-p12 =
#ca-passphrase =

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
