don: *.go public.rice-box.go
	go build -ldflags=-s -o don

don_linux-amd64: *.go public.rice-box.go
	docker run --rm -it -v $(shell pwd):/go/src/fknsrs.biz/p/don golang:1.8 bash -c 'cd /go/src/fknsrs.biz/p/don && go build -o don_linux-amd64'

public.rice-box.go: public/*
	rice embed-go

.PHONY: clean

clean:
	rm -f don don_linux-amd64
