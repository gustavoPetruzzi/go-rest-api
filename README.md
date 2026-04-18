# REST API

A REST API built with Go and Gin framework, using SQLite for data persistence. I use this project to learn about GO

## Features

- User registration and authentication with JWT
- Event management (CRUD operations)
- SQLite database

## Tech Stack

- Go
- Gin (HTTP framework)
- SQLite (database)
- JWT (authentication)

## Getting Started

### Prerequisites

- Go 1.21+
- Docker (optional)

### Running the API

Using Docker:

```bash
docker-compose up -d
```

Locally:

```bash
go run app.go
```

The API will be available at http://localhost:8080

## API Endpoints

### Users

- `POST /users/register` - Register a new user
- `POST /users/login` - Login and get JWT token

### Events

- `GET /events` - Get all events
- `GET /events/:id` - Get a single event
- `POST /events` - Create a new event (requires auth)
- `PUT /events/:id` - Update an event (requires auth)
- `DELETE /events/:id` - Delete an event (requires auth)

## Project Structure

- `app.go` - Main entry point
- `db/db.go` - Database initialization
- `models/` - Data models (User, Event)
- `routes/` - API route handlers
- `utils/` - Utility functions (JWT, hashing)
