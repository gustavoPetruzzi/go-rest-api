# AGENTS.md

## Running the API

```bash
go run app.go           # Local development (port 8080)
docker-compose up -d   # Docker development (persistent container)
```

## Tech Stack

- Go 1.25+ with Gin framework
- SQLite database (`api.db`)
- JWT authentication

## Project Structure

- `app.go` - Entry point
- `db/db.go` - Database initialization
- `models/` - User, Event structs
- `routes/` - HTTP handlers
- `utils/` - JWT, password hashing

## No Tests

This repo has no test files or testing framework configured.

## Important

- Changes to `db/db.go` may require deleting `api.db` to reinitialize
- The Docker container runs `tail -f /dev/null` to stay running - exec into it to run the app manually