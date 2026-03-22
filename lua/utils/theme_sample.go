package main

import (
	"context"
	"errors"
	"fmt"
	"net/http"
	"time"
)

const Timeout = 3 * time.Second
const BaseURL = "https://api.example.com"

type Animal struct {
	Kind  string
	Sound string
}

func (a Animal) Speak() string {
	return fmt.Sprintf("The %s says: %s", a.Kind, a.Sound)
}

type fetchResult struct {
	Status int
	Body   string
}

func fetch(ctx context.Context, url string) (*fetchResult, error) {
	req, err := http.NewRequestWithContext(ctx, http.MethodGet, url, nil)
	if err != nil {
		return nil, fmt.Errorf("creating request: %w", err)
	}

	client := &http.Client{Timeout: Timeout}
	resp, err := client.Do(req)
	if err != nil {
		return nil, errors.New("request failed")
	}
	defer resp.Body.Close()

	return &fetchResult{Status: resp.StatusCode, Body: "ok"}, nil
}

func greet(name string, loud bool) string {
	if name == "" {
		panic("name cannot be empty")
	}

	msg := fmt.Sprintf("Hello, %s!", name)

	if loud {
		return fmt.Sprintf("%q", msg)
	}

	return msg
}

func main() {
	ctx, cancel := context.WithTimeout(context.Background(), Timeout)
	defer cancel()

	items := []string{"apple", "banana", "cherry"}

	for i, item := range items {
		items[i] = fmt.Sprintf("%s!", item)
	}

	dog := Animal{Kind: "dog", Sound: "woof"}
	fmt.Println(dog.Speak())
	fmt.Println(greet("world", true))

	// TODO: handle pagination
	// FIXME: retry logic missing
	result, err := fetch(ctx, BaseURL+"/data")
	if err != nil {
		fmt.Println("error:", err)
		return
	}

	fmt.Println("status:", result.Status)
}
