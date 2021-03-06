package grpc

import (
	"net/http"

	"github.com/fuwensun/goms/eApi/api"
	"github.com/grpc-ecosystem/grpc-gateway/runtime"
	"golang.org/x/net/context"
	// "google.golang.org/grpc"
)

func newGateway(s *Server) error {
	ctx, cancel := context.WithCancel(context.Background())
	defer cancel()

	mux := runtime.NewServeMux()
	err := api.RegisterUserHandlerServer(ctx, mux, s)
	// opts := []grpc.DialOption{grpc.WithInsecure()}
	// err := api.RegisterUserHandlerFromEndpoint(ctx, mux, "localhost:50051", opts)
	if err != nil {
		return err
	}
	return http.ListenAndServe(":8081", mux)
}

// func startGateway() {
// 	defer glog.Flush()
// 	if err := http.ListenAndServe(":8081", mux); err != nil {
// 		glog.Fatal(err)
// 	}
// }
