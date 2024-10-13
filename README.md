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

4. Copy from app output.jpg:
```sh
   docker cp face_detection_container:/app/output.jpg .
    ```


## GitHub Actions

Этот репозиторий использует GitHub Action для автоматического build и push в Docker Image в Docker Hub каждый раз, когда push 'main' branch
