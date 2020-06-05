/*

Oclean每日积分签到 By @vhvg

微信小程序 - 欧可林商城 - 签到 获取链接

Surge 4.0+:
[Script]
Oclean.cookie.js = script-path=https://raw.githubusercontent.com/vhvg/scripts/master/Oclean.cookie.js,type=http-request,pattern=^https:\/\/mall\.oclean\.com\/API\/VshopProcess\.ashx\?action=SignIn.?
Oclean每日签到 = type=cron,cronexp=15 0 0 * * *,script-path=https://raw.githubusercontent.com/vhvg/scripts/master/Oclean.js,wake-system=true

[mitm]
hostname = mall.oclean.com

*/


const chavy = init()

const cookieName = 'Oclean'

const KEY_signurl = 'signurl_oclean'
const KEY_signheader = 'signheader_oclean'

const signinfo = {}

let VAL_signurl = chavy.getdata(KEY_signurl)
let VAL_signheader = chavy.getdata(KEY_signheader)


sign()

function sign() {
  let url = { url: VAL_signurl, body: '{}', headers: JSON.parse(VAL_signheader) }
  
  //构造自动签到特征
  url.headers['xingzhi'] = 'auto'
  
  chavy.get(url, (error, response, data) => {
    let result = JSON.parse(data)
    let title = `Olcean每日签到`
    // 签到成功
    if (result.Code == 1) {
      let subTitle = `签到结果: 成功`
      let detail = `获得积分: ${result.Data.points}, 总积分: ${result.Data.integral}, 签满${result.Data.continuDays}/${result.Data.settingDays}天可获得${result.Data.continuPoints}积分`
      chavy.msg(title, subTitle, detail)
    }
	// 签到重复
    else if(result.Code == 2){
      let subTitle = `签到结果: 成功（重复签到）`
      let detail = `总积分: ${result.Data.integral}`
      chavy.msg(title, subTitle, detail)
    }
    // 签到失败
    else {
      let subTitle = `签到结果: 失败`
      let detail = `请手动签到`
      chavy.msg(title, subTitle, detail)
    }
  })

  chavy.done()
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
