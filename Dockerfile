# Dockerfile para entorno de desarrollo Go
FROM golang:1.25.7-bookworm

# Instalar herramientas útiles para desarrollo (incluye gcc para CGO)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    bash \
    curl \
    vim \
    make \
    ca-certificates \
    gcc \
    libc6-dev \
    && rm -rf /var/lib/apt/lists/*

# Crear directorio de trabajo
WORKDIR /app

EXPOSE 8080

# Instalar herramientas de desarrollo Go
# Necesitamos CGO_ENABLED=1 durante la instalación de herramientas
RUN CGO_ENABLED=1 go install github.com/go-delve/delve/cmd/dlv@latest && \
    go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest && \
    go install golang.org/x/tools/gopls@v0.20.0

# Configurar el entorno
ENV GOOS=linux
ENV GOARCH=amd64
ENV CGO_ENABLED=1

CMD ["bash"]
