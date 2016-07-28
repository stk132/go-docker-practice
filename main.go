package main

import (
	"fmt"
	"os"

	"github.com/fsouza/go-dockerclient"
)

func main() {
	endpoint := "unix:///var/run/docker.sock"
	client, _ := docker.NewClient(endpoint)
	container, err := client.CreateContainer(docker.CreateContainerOptions{
		Name: "some-postgres",
		Config: &docker.Config{
			Image: "postgres",
		},
	})

	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	if err = client.StartContainer(container.ID, &docker.HostConfig{}); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
