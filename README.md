 # Face Detection with OpenCV

Этот репозиторий содержит dockerfile с приложением opencv для распознавания человеческих лиц

## Requirements

- Docker
- Git

## Использование

1. Clone the repository:

    ```sh
    git clone https://github.com/your_github_username/your_repository.git
    cd your_repository
    ```

2. Build the Docker image:

    ```sh
    docker build -t your_dockerhub_username/your_image_name:latest .
    ```

3. Run the Docker container:

    ```sh
    docker run --rm your_dockerhub_username/your_image_name:latest
    ```

## GitHub Actions

This repository uses GitHub Actions to automatically build and push the Docker image to Docker Hub on every push to the `main` branch.

