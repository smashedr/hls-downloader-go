package main

import (
	"encoding/binary"
	"encoding/json"
	"fmt"
	"io"
	"log"
	"math/rand"
	"os"
	"os/exec"
	"path/filepath"
	"runtime"
	"strings"
	"time"
)

var (
	version = "dev"
	//commit  = "none"
	//date    = "unknown"
)

type Message struct {
	Download string `json:"download"`
	Message  string `json:"message"`
	Open     string `json:"open"`
	Title    string `json:"title"`
	Version  string `json:"version"`
}

type Response struct {
	CurrentVersion string `json:"current_version"`
	Message        string `json:"message"`
	Path           string `json:"path"`
	Success        bool   `json:"success"`
}

func setupLogging() (*os.File, error) {
	const fileName = "log.txt"
	const maxSize = 1000000
	if info, err := os.Stat(fileName); err == nil && info.Size() >= maxSize {
		_ = os.Rename(fileName, "log-1.txt")
	}
	logFile, err := os.OpenFile(fileName, os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0666)
	if err != nil {
		return nil, err
	}
	log.SetOutput(logFile)
	return logFile, nil
}

func readMessage() (Message, error) {
	// Read the 4-byte message length
	var length uint32
	if err := binary.Read(os.Stdin, binary.LittleEndian, &length); err != nil {
		return Message{}, fmt.Errorf("failed to read message length: %w", err)
	}

	// Read the message content
	data := make([]byte, length)
	if _, err := io.ReadFull(os.Stdin, data); err != nil {
		return Message{}, fmt.Errorf("failed to read message data: %w", err)
	}

	// Parse JSON
	var message Message
	if err := json.Unmarshal(data, &message); err != nil {
		return Message{}, fmt.Errorf("failed to unmarshal json: %w", err)
	}

	return message, nil
}

func sendResponse(response Response, success bool) error {
	// Add success field
	response.Success = success
	log.Printf("sendResponse: %v\n", response)

	// Marshal to JSON
	jsonData, err := json.Marshal(response)
	if err != nil {
		return fmt.Errorf("failed to marshal JSON: %w", err)
	}

	// Write the message length (4 bytes, uint32, native byte order)
	length := uint32(len(jsonData))
	if err := binary.Write(os.Stdout, binary.LittleEndian, length); err != nil {
		return fmt.Errorf("failed to write message length: %w", err)
	}

	// Write the message content
	if _, err := os.Stdout.Write(jsonData); err != nil {
		return fmt.Errorf("failed to write message data: %w", err)
	}

	return nil
}

func showFileInExplorer(filePath string) error {
	log.Printf("showFileInExplorer: %s: %s\n", runtime.GOOS, filePath)
	var cmd *exec.Cmd

	switch runtime.GOOS {
	case "windows":
		cmd = exec.Command("explorer", "/select,"+filePath)
	case "darwin":
		cmd = exec.Command("open", "-R", filePath)
	case "linux":
		dir := filepath.Dir(filePath)
		cmd = exec.Command("xdg-open", dir)
	default:
		return fmt.Errorf("unsupported platform: %s", runtime.GOOS)
	}

	return cmd.Run()
}

func sanitizeFilename(filename string) string {
	invalid := []string{"/", "\\", ":", "*", "?", "\"", "<", ">", "|", " "}
	result := filename
	for _, char := range invalid {
		result = strings.ReplaceAll(result, char, "_")
	}
	return result
}

func generateRandomString(length int) string {
	charset := "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	seed := rand.NewSource(time.Now().UnixNano())
	random := rand.New(seed)

	result := make([]byte, length)
	for i := range result {
		result[i] = charset[random.Intn(len(charset))]
	}
	return string(result)
}

func downloadUrl(message Message) (string, error) {
	// get url
	url := message.Download
	log.Printf("downloadUrl: %v\n", url)

	// get ffmpeg
	//cwd, _ := os.Getwd()
	//log.Printf("cwd: %v\n", cwd)
	//fname, err := exec.LookPath("./ffmpeg")
	//if err != nil {
	//	return "", fmt.Errorf("error finding ffmpeg: %w", err)
	//}
	//log.Printf("fname: %+v\n", fname)
	exeName := "ffmpeg"
	switch runtime.GOOS {
	case "windows":
		exeName = "ffmpeg.exe"
	case "darwin":
		newPaths := []string{
			"/usr/local/bin",
			"/opt/homebrew/bin",
			"/opt/local/bin",
			"/sw/bin",
			filepath.Join(os.Getenv("HOME"), "bin"),
		}
		currentPath := os.Getenv("PATH")
		newPath := strings.Join(newPaths, ":")
		_ = os.Setenv("PATH", currentPath+":"+newPath)
	}
	log.Printf("PATH: %s\n", os.Getenv("PATH"))
	log.Printf("exeName: %s\n", exeName)
	var ffmpegPath string
	if _, err := os.Stat(exeName); err == nil {
		ffmpegPath, _ = filepath.Abs(exeName)
	} else {
		path, err := exec.LookPath("ffmpeg")
		if err != nil {
			return "", fmt.Errorf("error finding ffmpeg: %w", err)
		}
		ffmpegPath = path
	}
	log.Printf("ffmpegPath: %s\n", ffmpegPath)

	// get directory
	home, _ := os.UserHomeDir()
	log.Printf("home: %+v\n", home)
	directory := filepath.Join(home, "Downloads")
	log.Printf("directory: %+v\n", directory)
	// RETARD WARNING
	if _, err := os.Stat(directory); os.IsNotExist(err) {
		log.Printf("Created Downloads Directory: %s\n", directory)
		if err := os.MkdirAll(directory, 0755); err != nil {
			return "", fmt.Errorf("error creating downloads directory: %w", err)
		}
	}

	// get filename
	title := message.Title
	log.Printf("title: %s\n", title)
	var filename string
	if title != "" {
		filename = title
	} else {
		filename = filepath.Base(url)
	}
	log.Printf("filename: %s\n", filename)

	// sanatize filename
	filename = sanitizeFilename(filename)
	finalName := filename + ".mp4"
	log.Printf("finalName: %s\n", finalName)

	// get path
	path := filepath.Join(directory, finalName)
	log.Printf("path: %s\n", path)

	if _, err := os.Stat(path); !os.IsNotExist(err) {
		// path/to/whatever exists
		random := generateRandomString(4)
		log.Printf("random: %s\n", random)
		path = filepath.Join(directory, filename+random+".mp4")
	}
	log.Printf("path: %s\n", path)

	// process download
	args := []string{"-i", url, "-c", "copy", "-bsf:a", "aac_adtstoasc", path}
	cmd := exec.Command(ffmpegPath, args...)
	if err := cmd.Run(); err != nil {
		log.Printf("err: %+v\n", err)
		return "", err
	}

	return path, nil
}

func main() {
	// Setup logging
	logFile, err := setupLogging()
	if err == nil {
		defer func() { _ = logFile.Close() }()
	}

	// Read the message
	message, err := readMessage()
	if err != nil {
		log.Fatal(err)
	}
	log.Printf("message: %+v\n", message)

	// Generate the response
	var response Response
	var success = true
	if message.Version != "" {
		// version check
		response.CurrentVersion = version
	} else if message.Open != "" {
		// open file
		file := message.Open
		if err := showFileInExplorer(file); err != nil {
			log.Printf("Error opening file in explorer: %v\n", err)
		}
		response.Message = "opened"
	} else if message.Download != "" {
		// download file
		path, err := downloadUrl(message)
		if err != nil {
			log.Printf("Download error: %v\n", err)
			response.Message = err.Error()
			success = false
		} else {
			response.Message = "Download Finished."
			response.Path = path
		}
	} else {
		response.Message = "Host Client Working."
	}

	// Send the response
	err = sendResponse(response, success)
	if err != nil {
		log.Printf("Error sending response: %v\n", err)
	}
}
