# eConf

配置,从本地配置文件读取.


## 运行服务
```
cd goms/eConf/cmd

# 使用默认的配置文件
go run . &  

# 使用指定的配置文件
go run . & -cfgpath=../configs  
```


## 测试API

http
```
# 使用 http 方法 GET　/ping
curl  localhost:8080/ping

# 使用 http 方法 GET /ping, 参数 message=xxx
curl  localhost:8080/ping?message=xxx
```

grpc
```
# 获取 grpc 方法列表
grpcurl -plaintext localhost:50051 list

# 使用 grpc 方法 service.goms.User/Ping, 参数 {"Message": "xxx"}
grpcurl -plaintext -d '{"Message": "xxx"}'  localhost:50051 service.goms.User/Ping 
```