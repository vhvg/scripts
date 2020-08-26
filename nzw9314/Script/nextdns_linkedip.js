/*
Script event auto linked ipv4 nextdns: network-change (By langkhach)


配置教程:

1、打开 my.nestdns.io 左上角点击 NEW 新建一个属于自己的配置，系统会分配一组 DNS Servers给你，
替换示例中的(45.90.66.162)


2、找到 Linked IP 字样，将 DNS servers 复制后填入到 Surge DNS 服务器，继续往下看有个刷新按钮，点击链接你当前 IP 地址。

3、继续往下看，找到 You can also programmatically update your linked IP by calling: 这段字样，复制 URL 替换脚本内(https://link-ip.nextdns.io/4af4c8/88e9a964ed89a8bd)

完整示例

[General]
# DNS
dns-server = 8.8.8.8, 223.5.5.5，45.90.30.30
always-real-ip = link-ip.nextdns.io
[Host]
# NextDNS
link-ip.nextdns.io = server:45.90.30.30
[Script]
# > NextDNS
event network-changed script-path=JS/nextdns_linkedip.js



*/

async function launch() {
    await linkedip();
}
launch()
function linkedip(){ 
$httpClient.post('https://link-ip.nextdns.io/4af4c8/88e9a964ed89a8bd', function(error, response, data){
  if (error) {
console.log('‼️');
  } else {
console.log('🟢 '+ data);
  }
  $done();
});
}