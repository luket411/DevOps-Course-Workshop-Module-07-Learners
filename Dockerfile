# dotnet image based on Debian 11 with root
FROM mcr.microsoft.com/dotnet/sdk:7.0 as base

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && apt-get install -y nodejs

WORKDIR /workspace

COPY DotnetTemplate.Web ./DotnetTemplate.Web
COPY DotnetTemplate.Web.Tests ./DotnetTemplate.Web.Tests
COPY DotnetTemplate.sln .
COPY DotnetTemplate.sln.DotSettings .

RUN dotnet build

WORKDIR /workspace/DotnetTemplate.Web
RUN npm install && npm run build

CMD [ "bash" ]
