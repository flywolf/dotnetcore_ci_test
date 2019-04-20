FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY DockerTest/*.csproj ./DockerTest/
RUN dotnet restore

# copy everything else and build app
COPY DockerTest/. ./DockerTest/
WORKDIR /app/DockerTest
RUN dotnet publish  -c Release -o out

FROM mcr.microsoft.com/dotnet/core/runtime:2.2 AS runtime
WORKDIR /app
COPY --from=build /app/DockerTest/out ./

EXPOSE 8810
ENTRYPOINT ["dotnet", "DockerTest.dll"]