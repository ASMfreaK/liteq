default:
	go run *.go || (go get ./... && go run *.go)

watch:
	(watchexec -e sql -- make schema-const) & \
	(watchexec -e sql -- sqlc generate) & \
	(watchexec -w sqlc.yaml -- sqlc generate) & \
	(watchexec -e go -c -r -- go test ./... -count 1) & \
	wait
	# SQL Watcher done

.PHONY: bench
bench:
	make cleanup
	make schema-const
	sqlc generate
	cd bench && go run main.go

cleanup:
	rm -f bench/bench.db*
