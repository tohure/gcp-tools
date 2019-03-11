# **GCP Tools**

An Image for GCP Tools based in Linux Alpine optimize to use with Gradle

## Contains
```
 - Google Cloud SDK (Alpine)
 - OpenJDK 8
 - App Engine Java
 - Gradle 5.2.1
```
 
## Build
```
docker build -t tohure/gcp-app-engine-actions .
```

## Volume
```
docker run --rm -ti -v $(pwd)/:/usr/local/tohure gcp-app-engine-actions bash (Mac & Linux)

docker run --rm -ti -v ${PWD}/:/usr/local/tohure gcp-app-engine-actions bash (Windows - PowerShell)
```