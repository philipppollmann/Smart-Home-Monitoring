# Speed-Testing
![Go](https://img.shields.io/badge/go-%2300ADD8.svg?style=for-the-badge&logo=go&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
> [!NOTE]
>This is a simple speed testing service that can be used to test the speed of your internet connection.

## Docker
```shell
docker build -t speed-testing .
docker run -p 8080:8080 speed-testing
```