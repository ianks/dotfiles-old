package main

import (
    "fmt"
    "log"
    "net/http"
    "os"
    "sync"
    "os/exec"
    "time"
    "runtime"
)
var wg sync.WaitGroup

func Serve(port string) {
    defer wg.Done()

    dir := "."
    if len(os.Args) > 1 {
        dir = os.Args[1]
    }

    fmt.Println("Serving", dir, "on port", port)
    http.Handle("/", http.FileServer(http.Dir(dir)))
    err := http.ListenAndServe(":" + port, nil)

    if err != nil {
        log.Fatal("ListenAndServe: ", err)
    }
}

func OpenBrowser(port string) {
    defer wg.Done()

    open := ""
    switch runtime.GOOS {
    case "linux":
        open = "/usr/bin/xdg-open"
    case "darwin":
        open = "/usr/bin/open"
    default:
        println("Could not reliably find a command to launch the browser.")
    }

    time.Sleep(time.Second * 2)
    cmd := exec.Command(open, "http://localhost:" + port)
    stdout, err := cmd.Output()

    if err != nil {
        println(err.Error())
        return
    }

    print(string(stdout))
}

func main() {
    port := "8008"

    wg.Add(2)
    go Serve(port)
    go OpenBrowser(port)
    wg.Wait()
}
