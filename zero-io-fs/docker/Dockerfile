# DOCKER_BUILDKIT=1 docker build . -t install-jar-1 --no-cache
## m2 stage
FROM zelejs/allin-web:m2 AS m2

# ## src stage
# FROM zelejs/allin-web:git AS git
# WORKDIR /root/m2
# COPY --from=m2 /root/.m2/settings.xml /root/m2
# RUN echo 'github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl' > /root/.ssh/known_hosts
# RUN echo 'github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==' >> /root/.ssh/known_hosts
# RUN echo 'github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg=' >> /root/.ssh/known_hosts
# ####################################
# WORKDIR /usr
# # RUN ssh-keyscan github.com > ~/.ssh/known_hosts
# # RUN git clone --depth=1 git@github.com:smallsaas/nft.git --single-branch -b nft-artifact-auth src
# ADD ./known_hosts /root/.ssh/known_hosts
# RUN git clone --depth=1 ssh://git@git.f.smallsaas.cn:7022/home/git/apps/nft.git --single-branch -b nft-artifact-auth src
FROM allin-web:src as src
# ######################################

#cache-stage
FROM zelejs/allin-web:build-cache-artifact as cache

#builk-stage
# FROM maven:3.6-openjdk-11-slim AS build
FROM maven:3.6-adoptopenjdk-11 as build

WORKDIR /root/.m2
COPY --from=m2 /root/.m2/settings.xml .
COPY --from=cache /root/.m2 /root/.m2
RUN rm -rf /root/.m2/repository/com/jfeat/

WORKDIR /usr/src
COPY --from=src /usr/src/pom.xml  ./pom.xml
COPY --from=src /usr/src/src ./src
RUN mvn -DskipStandalone=false -Dmaven.test.skip=true package

# final-stage
FROM adoptopenjdk:11-jre-hotspot
WORKDIR /webapps
COPY --from=build /usr/src/target/*-standalone.jar ./app.jar

################################
# uat config
# COPY ./config/application-uat.yml /webapps/config/application-uat.yml
CMD ["java", "-jar", "app.jar", "--server.port=8080"]
