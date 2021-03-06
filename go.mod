module github.com/fuwensun/goms

go 1.14

require (
	bou.ke/monkey v1.0.2
	cloud.google.com/go v0.57.0 // indirect
	github.com/fullstorydev/grpcurl v1.6.0 // indirect
	github.com/gin-gonic/gin v1.4.0
	github.com/go-sql-driver/mysql v1.4.1
	github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b
	github.com/golang/mock v1.4.3
	github.com/golang/protobuf v1.4.2
	github.com/gomodule/redigo v2.0.0+incompatible
	github.com/gomsx/hello v0.0.2 // indirect
	github.com/gomsx/helloworld v1.0.1
	github.com/gomsx/world/v2 v2.0.2 // indirect
	github.com/grpc-ecosystem/grpc-gateway v1.14.6
	github.com/nbio/st v0.0.0-20140626010706-e9e8d9816f32
	github.com/prashantv/gostub v1.0.0
	github.com/rs/zerolog v1.18.0
	github.com/satori/go.uuid v1.2.0
	github.com/smartystreets/goconvey v1.6.4
	golang.org/x/exp/errors v0.0.0-20200224162631-6cc2880d07d6
	golang.org/x/net v0.0.0-20200520182314-0ba52f642ac2
	golang.org/x/sys v0.0.0-20200523222454-059865788121 // indirect
	google.golang.org/genproto v0.0.0-20200528110217-3d3490e7e671
	google.golang.org/grpc v1.29.1
	gopkg.in/yaml.v2 v2.3.0
)

replace (
	golang.org/x/sys => github.com/golang/sys v0.0.0-20190926180325-855e68c8590b
	google.golang.org/grpc => github.com/grpc/grpc-go v1.24.0
)

exclude (
	github.com/golang/mock v1.1.0
	github.com/golang/mock v1.1.1
	github.com/golang/mock v1.2.0
)
