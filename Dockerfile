FROM google/cloud-sdk:alpine

#Install OpenJDK
RUN apk add --update --no-cache openjdk8 curl tar bash \
	&& rm -rf /var/lib/apt/lists/* \
    /var/cache/apk/* \
    /usr/share/man \
    /tmp/*

#Install only Java App Engine
RUN gcloud components install app-engine-java

#Set Enviroment for Gradle
ENV GRADLE_VERSION 5.2.1
ENV GRADLE_HOME /usr/local/gradle
ENV PATH ${PATH}:${GRADLE_HOME}/bin
ENV GRADLE_USER_HOME /gradle
ARG SHA=748c33ff8d216736723be4037085b8dc342c6a0f309081acf682c9803e407357

# Install gradle
WORKDIR /usr/local
RUN wget  https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
    echo "${SHA}  gradle-$GRADLE_VERSION-bin.zip" | sha256sum -c - && \
    unzip gradle-$GRADLE_VERSION-bin.zip && \
    rm -f gradle-$GRADLE_VERSION-bin.zip && \
    ln -s gradle-$GRADLE_VERSION gradle && \
    echo -ne "- with Gradle $GRADLE_VERSION\n" >> /root/.built

RUN apk update && apk add libstdc++ && rm -rf /var/cache/apk/*

RUN mkdir -p /gradle && mkdir -p /app

#Set work Folder
ENV MAIN_FOLDER=/usr/local/tohure/
VOLUME $MAIN_FOLDER
WORKDIR $MAIN_FOLDER