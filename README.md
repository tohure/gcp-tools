# **GCP Tools**

An Image for GCP Tools based in Linux Alpine

## Contains
```
 - Google Cloud SDK (Alpine)
 - OpenJDK 7
 - App Engine Java
 - Apache Maven 3.6.0
```
 
## Build
```
docker build -t tohure/gcp-app-engine-java .
```

## Volume
```
docker run --rm -ti -v $(pwd)/:/usr/local/tohure gcp-app-engine-java bash (Mac & Linux)

docker run --rm -ti -v ${PWD}/:/usr/local/tohure gcp-app-engine-java bash (Windows - PowerShell)
```