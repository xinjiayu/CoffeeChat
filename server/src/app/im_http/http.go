package main

import (
	"coffeechat/internal/httpd"
	"coffeechat/pkg/helper"
	"coffeechat/pkg/logger"
	"flag"
	"github.com/BurntSushi/toml"
	"math/rand"
	"time"
)

var (
	configFile = flag.String("conf", "http-example.toml", "the config path")
	//configFile  = flag.String("conf", "app/im_http/http-example.toml", "the config path")
	pidFileName = "server.pid"
)

func main() {
	logger.InitLoggerEx("log/log.log", "log/log.warn.log", "debug")
	defer logger.Logger.Sync() // flushes buffer, if any
	rand.Seed(time.Now().UnixNano())

	config := httpd.Config{}
	_, err := toml.DecodeFile(*configFile, &config)
	if err != nil {
		_, err := toml.DecodeFile("im_http.toml", &config)
		if err != nil {
			logger.Sugar.Error(err)
			return
		}
	}

	// 记录pid
	err = helper.WritePid(pidFileName)
	if err != nil {
		logger.Sugar.Fatalf("write pid file error:%s", err.Error())
		return
	}

	// 启动HTTP 服务
	httpd.StartHttpServer(config)
}
