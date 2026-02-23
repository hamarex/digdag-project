FROM mcr.microsoft.com/devcontainers/base:ubuntu

# digdag バージョン
ENV DIGDAG_VERSION=0.10.5

# 必要なパッケージをインストール
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y \
        curl \
        openjdk-8-jre \
        postgresql-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# digdagをダウンロード
RUN curl -o /usr/local/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-${DIGDAG_VERSION}" \
    && chmod +x /usr/local/bin/digdag

# 非rootユーザーで実行
USER vscode
