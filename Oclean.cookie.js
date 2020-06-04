/*
Oclean每日积分签到 By @vhvg

微信小程序 - 欧可林商城 - 签到 获取链接

Surge 4.0+:
[Script]
Oclean.cookie.js = script-path=myscript/Oclean.cookie.js,type=http-request,pattern=^https:\/\/mall\.oclean\.com\/API\/VshopProcess\.ashx\?action=SignIn.?
Oclean每日签到 = type=cron,cronexp=15 0 0 * * *,script-path=myscript/Oclean.js,wake-system=true

[mitm]
hostname = mall.oclean.com

*/


const cookieName = 'Oclean'

const signurlKey = 'signurl_oclean'
const signheaderKey = 'signheader_oclean'
const chavy = init()

let title = ``
let detail = ``

if ($request && $request.headers.X-mark != 'auto' && $request.headers.Host == 'mall.oclean.com') {
  const signurlVal = $request.url
  const signheaderVal = JSON.stringify($request.headers)
  if (signurlVal) chavy.setdata(signurlVal, signurlKey)
  if (signheaderVal) chavy.setdata(signheaderVal, signheaderKey)
  title = `获取Cookie: 成功 (手动签到)`
  chavy.msg(`${cookieName}`, title, detail)
}

function init() {
  isSurge = () => {
    return undefined === this.$httpClient ? false : true
  }
  isQuanX = () => {
    return undefined === this.$task ? false : true
  }
  getdata = (key) => {
    if (isSurge()) return $persistentStore.read(key)
    if (isQuanX()) return $prefs.valueForKey(key)
  }
  setdata = (key, val) => {
    if (isSurge()) return $persistentStore.write(key, val)
    if (isQuanX()) return $prefs.setValueForKey(key, val)
  }
  msg = (title, subtitle, body) => {
    if (isSurge()) $notification.post(title, subtitle, body)
    if (isQuanX()) $notify(title, subtitle, body)
  }
  log = (message) => console.log(message)
  get = (url, cb) => {
    if (isSurge()) {
      $httpClient.get(url, cb)
    }
    if (isQuanX()) {
      url.method = 'GET'
      $task.fetch(url).then((resp) => cb(null, resp, resp.body))
    }
  }
  post = (url, cb) => {
    if (isSurge()) {
      $httpClient.post(url, cb)
    }
    if (isQuanX()) {
      url.method = 'POST'
      $task.fetch(url).then((resp) => cb(null, resp, resp.body))
    }
  }
  done = (value = {}) => {
    $done(value)
  }
  return { isSurge, isQuanX, msg, log, getdata, setdata, get, post, done }
}
chavy.done()
