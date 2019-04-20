
cd /Users/sunhongjun/Project/jenkins/workspace/DOTNETCORE_CI_TEST
cp DockerTest/Dockerfile .

#build
docker build -t docker-dotnetcore-testapp:$BUILD_NUMBER .

# stop&delete current container
docker stop $(docker ps -a | grep dotnet-testapp | awk '{print $1}')
docker rm $(docker ps -a | grep dotnet-testapp | awk '{print $1}')

#run the new build
docker run --name dotnet-testapp -d -p 8810:8810 docker-dotnetcore-testapp:1.0