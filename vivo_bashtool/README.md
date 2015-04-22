
#vivo plus#

@(vivo)

## how to use ##
**usage**: add `source ~/vivo_plus.sh` to `~/.zshrc`

## 编译与安装 ##
假设编译生成的apk文件在`~/git_vivosdk`,然后映射到本地是`/z/git_vivosdk`
### 服务器端编译 ###
```
mbianyi	APP_NAME
```
操作:
- touch改变AndroidManifest.xml的时间戳
- 编译该APP_NAME, 并把编译输出结果输出到.compile.tmp

### 客户端安装 ###
```
minstall
```
操作:
- 从.compile.tmp提取出android版本, app
- 判断是4.4还是5.0的项目, 5.0的多个目录, 而且还要重启, 杀死zygote
- 判断是否是system app, 如果是要把app push到`system/app`目录下


## 小工具 ##
### mkill ###
正则匹配杀死设备上的app进程
```
mkill float*
```

### mcapture ###
设备截屏, 生成不同的分辨率大小
```
mcapture        # 默认缩小30%
mcapture file_name      # 100%大小, 生成的文件重命名
mcapture 38 file_name   # 自定义大小和文件名, 实例为38%原图大小
```





## git提交相关 ##
### plog ###
查看自己的提交 , qiufuqing
```
plog
```
###  previews ##
查看当前仓库的reviewers和owners
```
previewers
```
###  ppush ###
提交HEAD到当前分支对应的远程分支
```
ppush
```

### padd ###
给最近的一次修改添加reviewers
```
padd review_id --add qiufuqing
```
### pmansuo ###
获取最近一次被审核后的可以填写在漫索上commit信息
```
pmansuo
```


