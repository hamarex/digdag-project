FROM amazoncorretto:8

# digdag バージョン
ENV DIGDAG_VERSION=0.10.5

# 必要なパッケージをインストール
RUN yum install -y curl bash postgresql gettext && \
    yum clean all

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
