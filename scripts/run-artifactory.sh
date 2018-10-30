docker run \
    --detach \
    --name artifactory \
    --restart always \
    --publish 8081:8081 \
    --volume artifactory-data:/var/opt/jfrog/artifactory \
    docker.bintray.io/jfrog/artifactory-cpp-ce
