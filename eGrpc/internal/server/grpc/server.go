package grpc

import (
	// "fmt"
	// "context"
	"context"
	"log"
	"net"

	xrpc "google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	"github.com/fuwensun/goms/eGrpc/internal/server/grpc/pb"
	"github.com/fuwensun/goms/eGrpc/internal/service"
)

const (
	port = ":7070"
)

var (
	svc *service.Service
)

//
type Server struct{}

//
func (s *Server) Ping(ctx context.Context, q *pb.Request) (r *pb.Reply, e error) {
	r = &pb.Reply{Message: "pong" + " " + q.Message}
	log.Printf(r.Message)
	return r, nil
}

//
func New(s *service.Service) (server *Server) {
	log.Println("grpc new")
	svc = s

	server = &Server{} //server = new(Server)

	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	xs := xrpc.NewServer()
	pb.RegisterEgrpcServer(xs, server)
	reflection.Register(xs) //

	go func() {
		if err := xs.Serve(lis); err != nil {
			panic(err)
			// log.Fatalf("failed to serve: %v", err)
		}
	}()
	return
}
