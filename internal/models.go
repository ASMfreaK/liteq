// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.25.0

package internal

import ()

type Job struct {
	ID                int64
	Queue             string
	Job               string
	JobStatus         string
	ExecuteAfter      int64
	RemainingAttempts int64
	ConsumerFetchedAt int64
	FinishedAt        int64
	DedupingKey       string
	Errors            ErrorList
	CreatedAt         int64
	UpdatedAt         int64
}