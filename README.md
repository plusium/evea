# evea
EVE-Online 迷你 API 服务器

An EVE-Online API provider

基于 SinaAppEngine 的 python/django 开发的 EVE-Online 迷你 API 服务器。仅提供可令 EVEMon 等工具基本运行的最低限度的 API。符合 CCP 的 APIv2 标准。

## 一，部署方法
1，申请 SAE，并新建一个应用

2，检出本程序代码至本地，将 1/config.yaml 中的 name 改为你的应用的名字
	为了安全，将 1/evea/settings.py 中的 SECRET_KEY 修改为另一个随机字符串

3，将所有代码（包含1文件夹）上传至 SAE 的 SVN 服务器

4，在 SAE 控制面板的 MySQL 中执行 1/db_structure.sql 和 1/db_data.sql

5，浏览器打开 http://你的应用的名字.sinaapp.com 检查部署是否成功

6，admin 管理员的默认用户名密码为 root/root，登录后修改一下密码

7，具体使用方法见 http://bbs.eve-china.com/forum.php?mod=viewthread&tid=619536&fromuid=248904

## 二，更新 evea 服务器中文数据
evea 服务器中使用到了部分中文数据，如技能名称、技能组名称和部分脑插名称。源代码中已经含有中文数据，见 1/db_data.sql，我也会随时更新该中文数据。如需自己更新中文数据，可参考里面注释的 sql 语句，在下面提到的数据库中执行以获取更新中文数据的 sql 语句。

## 三，生成 EVEMon 中文数据包
0，如果本人没有及时更新中文数据包版 EVEMon，可按以下方法自行生成 EVEMon 中文数据包

1，检出 EVEMon 的源代码至本地。EVEMon 项目地址：https://bitbucket.org/EVEMonDevTeam/evemon

2，按项目 wiki 的说明成功编译 EVEMon

3，阅读 wiki 中的“How to create the data files”这一节
	这一篇 wiki 说的比较笼统，我下面说的都是对这篇 wiki 的补充

4，下载 CCP 对外公开的数据库备份文件（Static Data Export，SDE），下载地址：https://developers.eveonline.com/resource/resources

5，下载并安装上述页面所提示的版本(或者 EVEMon 所需要的版本)的 Microsoft SQL Server，目前是 SQL Server 2014 Express

6，将下载到的数据库备份文件放至 EVEMon 源代码下的 \Tools\EVESDEToSQL\SDEFiles 文件夹下

7，在 \Tools\EVESDEToSQL 文件夹下以管理员身份运行 cmd，然后运行：

	EVESDEToSQL import

视电脑运行速度影响，可能会导致数据库连接超时，从而运行失败。此时先删掉整个数据库，编辑 EVESDEToSQL.exe.config 文件中的 EveStaticData 一节，在 connectionString 的最后面加上 Connection Timeout=300; 然后重新运行上述命令。成功后会将 SDE 恢复至 EveStaticData 数据库中。

8，打开 SQL Server 2014 Management Studio，在该数据库中运行以下几个 sql 语句

	update invGroups set groupName = ISNULL((select text from trnTranslations where keyID=invGroups.groupID and tcID = 7 and languageID = 'ZH'),groupName);

	update invMarketGroups set marketGroupName = ISNULL((select text from trnTranslations where keyID=invMarketGroups.marketGroupID and tcID = 36 and languageID = 'ZH'),marketGroupName), description = ISNULL((select text from trnTranslations where keyID=invMarketGroups.marketGroupID and tcID = 37 and languageID = 'ZH'),description);

	update invMetaGroups set metaGroupName = ISNULL((select text from trnTranslations where keyID=invMetaGroups.metaGroupID and tcID = 34 and languageID = 'ZH'),metaGroupName);

	update invTypes set typeName = ISNULL((select text from trnTranslations where keyID=invTypes.typeID and tcID = 8 and languageID = 'ZH'),typeName), description = ISNULL((select text from trnTranslations where keyID=invTypes.typeID and tcID = 33 and languageID = 'ZH'),description);

9，设置 XmlGenerator 为启动项目，运行一下
	以防万一数据库连接超时，运行前也修改一下 EVEMonXmlGenerator.exe.config 中的 connectionString。成功后会在 EVEMon.Common/Resources/ 文件夹下生成 EVEMon 中文数据包。数据包是压缩文件，可以解压出来看看里面是否是中文。
