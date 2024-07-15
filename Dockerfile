# Use the official Golang image
FROM golang:1.21.6-alpine

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files if they exist
COPY go.mod go.sum ./
# Initialize go modules if not already done
RUN if [ ! -f go.mod ]; then go mod init github.com/go_prometheus; fi

# Download and install any required dependencies
RUN go mod tidy

# Copy the rest of the files
COPY . .

# Build the Go application
RUN go build -o /main .

# Command to run the executable
CMD ["./main"]
