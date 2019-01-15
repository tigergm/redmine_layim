这是一个利用LayIM的前端网页聊天js的Redmine插件。官网地址是：

http://layim.layui.com/

该插件仅支持Redmine 4及以上版本，因为自从Redmine 4开始基于Rails 5构建，内置了ActionCable的WebSocket技术，可以进行实时的信息订阅及发布，不需要另外建立WebSocke系统。

另外，LayIM的生态圈包括了Java，Php，Node.js，.Net等实现案例，唯独缺Ruby On Rails，所以利用Redmine最新版4.0进行集成，作为Rails领域的案例参考，补充这一空白，也希望能够纳入到LayIM的接入案例库。

目前，初步实现了全员和当前项目的人员单点文本聊天及群组文本聊天。未来将逐步实现图片和文件传递（已初步实现），更多消息服务端存储和查询，Redmine信息的实时推送，Redis的服务配置等。

尽管Rails 5已经极大简化了WebSocket的实现，但该插件的配置还是略显复杂，随着版本升级逐渐增强功能并减少配置复杂度，目前不建议放到生产环境。

LayIM前端插件需要获得授权，没有开源，相关文件可以查看gitignore文件，请到http://www.layim.com官网获取授权之后，追加LayIM的特定文件即可。

可以在中国最大的Redmine讨论千人群找到我并参与讨论，QQ群号为：138524445。我是管理员tigergm。

该插件在Redmine官方的插件注册地址为：http://www.redmine.org/plugins/redmine_layim
请多支持。

贡献者名单：

以后会陆续加入。

已知bug：

项目组群会显示为佚名。

功能规划：

Redmine内置的消息推送。

图片传输（已实现）。

文件传输（已实现）。

安装过程：

1、下载源码压缩包，展开到Redmine的plugins目录下，保证有redmine_layim目录。

2、安装必要的gem类库，如果是生产环境，则建议带--without参数：
bundle install --without development test

3、执行数据迁移：
rake redmine:plugins:migrate NAME=redmine_layim RAILS_ENV=production

4、复制必要的文件以启用ActionCable：
1）把others目录下的文件复制到Redmine根目录。
2）把获得授权的layim.css和layim.js放到assets目录的相应位置，参见gitignore文件。

5、重启redmine。
