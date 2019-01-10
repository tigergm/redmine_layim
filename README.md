这是一个利用LayIM的前端网页聊天js的Redmine插件。官网地址是：
http://layim.layui.com/
该插件仅支持Redmine 4及以上版本，因为自从Redmine 4开始基于Rails 5构建，内置了ActionCable的WebSocket技术，可以进行实时的信息订阅及发布，不需要另外建立WebSocke系统。
另外，LayIM的生态圈包括了Java，Php，Node.js，.Net等实现案例，唯独缺Ruby On Rails，所以利用Redmine最新版4.0进行集成，作为Rails领域的案例参考，补充这一空白，也希望能够纳入到LayIM的接入案例库。
目前，初步实现了全员和当前项目的人员单点文本聊天及群组文本聊天。未来将逐步实现图片和文件传递，更多消息服务端存储和查询，Redmine信息的实时推送，Redis的服务配置等。
尽管Rails 5已经极大简化了WebSocket的实现，但该插件的配置还是略显复杂，随着版本升级逐渐增强功能并减少配置复杂度，目前不建议放到生产环境。

LayIM前端插件需要获得授权，没有开源，相关文件可以查看gitignore文件，请到http://www.layim.com官网获取授权之后，追加LayIM的特定文件即可。

可以在中国最大的Redmine讨论千人群找到我并参与讨论，QQ群号为：138524445。我是管理员tigergm。
该插件在Redmine官方的插件注册地址为：http://www.redmine.org/plugins/redmine_layim，请多支持。

以后会陆续加入贡献者名单。