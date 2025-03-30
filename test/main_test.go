package test

import (
	"database/sql"
	"fmt"
	"log"
	"os"
	"os/exec"
	"testing"
	"time"

	_ "github.com/lib/pq"
)

var db *sql.DB

func TestMain(m *testing.M) {
	err := setupDockerContainers()
	if err != nil {
		log.Fatal("Failed to set up Docker containers:", err)
	}

	err = waitForPostgreSQLReady(10 * time.Second)
	if err != nil {
		log.Fatal("PostgreSQL is not ready:", err)
	}

	connStr := "postgresql://root:secret@localhost:5432/postgres?sslmode=disable"
	db, err = sql.Open("postgres", connStr)
	if err != nil {
		log.Fatalf("Failed to connect to PostgreSQL database: %v", err)
	}

	err = importSQLFile("../migration/")
	if err != nil {
		log.Fatal("Failed to import SQL file:", err)
	}

	exitCode := m.Run()

	fmt.Println("Cleaning up test environment...")
	db.Close()

	// if err := teardownDockerContainers(); err != nil {
	// 	log.Printf("Warning: Failed to clean up containers: %v", err)
	// }

	os.Exit(exitCode)
}

func setupDockerContainers() error {
	return exec.Command("docker", "compose", "up", "-d").Run()
}

func waitForPostgreSQLReady(timeout time.Duration) error {
	startTime := time.Now()
	i := 0

	for time.Since(startTime) < timeout {

		connStr := "postgresql://root:secret@localhost:5432/postgres?sslmode=disable"
		tempDB, err := sql.Open("postgres", connStr)
		log.Println(err)
		if err == nil {
			err = tempDB.Ping()
			if err == nil {
				tempDB.Close()
				return nil
			}
			tempDB.Close()
		}
		time.Sleep(1 * time.Second)
		i++
	}
	return fmt.Errorf("timeout waiting for PostgreSQL")
}

func importSQLFile(path string) error {
	envVar := fmt.Sprintf("path=%s", path)

	cmd := exec.Command("make", "migrateup")
	cmd.Env = append(cmd.Env, envVar)
	
	cmd.Dir = ".."
	return cmd.Run()
}

// func teardownDockerContainers() error {
// 	cmd := exec.Command("docker", "compose", "down", "-v")
// 	return cmd.Run()
// }
