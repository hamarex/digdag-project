FROM amazoncorretto:8-al2023

# digdag バージョン
ENV DIGDAG_VERSION=0.10.5

# 必要なパッケージをインストール
RUN dnf install -y bash postgresql15 gettext python3.11 python3-pip && \
    dnf clean all && \
    ln -s /usr/bin/python3.11 /usr/local/bin/python

# digdagをダウンロード
RUN curl -o /usr/local/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-${DIGDAG_VERSION}" \
    && chmod +x /usr/local/bin/digdag

# 作業ディレクトリ作成
RUN mkdir -p /digdag/logs /digdag/workflows

WORKDIR /digdag

# 設定ファイルとエントリーポイントをコピー
COPY server.properties /digdag/server.properties
COPY entrypoint.sh /digdag/entrypoint.sh
RUN chmod +x /digdag/entrypoint.sh

# ポート公開
EXPOSE 65432

# エントリーポイント
ENTRYPOINT ["/digdag/entrypoint.sh"]
