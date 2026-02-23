# Digdag on Docker

MacbookでDigdagサーバーをDockerで構築し、VSCode devcontainerから開発できる環境です。MacbookにJavaをインストールせずにDigdagのワークフロー開発が可能です。

## 特徴

- Digdag Server 0.10.5 + PostgreSQL 16 をDockerで完結
- VSCode devcontainerからDigdag CLIを直接操作
- `pg>` オペレーターによるSQL実行に対応
- DigdagシステムDBとユーザーDBを分離管理

## 構成

```
digdag-postgres      PostgreSQL 16        ポート 5433
digdag-server        Digdag Server        ポート 65432
digdag-devcontainer  開発用コンテナ        VSCode接続先
```

### データベース

| DB名 | 用途 |
|------|------|
| `digdag_system` | Digdagサーバー内部管理用 |
| `digdag_user` | ワークフローからSQLを実行する対象DB |

## ディレクトリ構造

```
.
├── docker-compose.yml
├── .env                        # 環境変数（Git管理外・要作成）
├── .env.example                # .envのテンプレート
├── .devcontainer/
│   ├── devcontainer.json
│   └── Dockerfile
├── digdag-server/
│   ├── Dockerfile
│   ├── server.properties
│   └── entrypoint.sh
├── postgres/
│   └── init/
├── workflows/                  # ワークフロー置き場
│   ├── sample_workflow.dig
│   └── queries/
└── logs/
```

---

## セットアップ

### 1. `.env` ファイルの作成

```bash
cp .env.example .env && sed -i '' "s|DIGDAG_SECRET_ENCRYPTION_KEY=|DIGDAG_SECRET_ENCRYPTION_KEY=$(openssl rand -base64 16)|" .env
```

### 2. Dockerコンテナの起動

```bash
docker-compose up -d
```

### 3. VSCodeでdevcontainerを開く

1. VSCodeでプロジェクトフォルダを開く
2. 右下の「**Reopen in Container**」をクリック

### 4. シークレットの設定（初回のみ）

devcontainer内のターミナルで実行：

```bash
digdag secrets --project sample --set pg.password=digdag_secure_password_2026 --endpoint http://digdag-server:65432
```

### 5. ワークフローのプッシュと実行

```bash
cd /workspace/workflows
digdag push sample --endpoint http://digdag-server:65432
digdag start sample sample_workflow --session now --endpoint http://digdag-server:65432
```

---

## Digdag UI

```
http://localhost:65432
```

## 参考

- [Digdag公式ドキュメント](https://docs.digdag.io/)
- [pg> オペレーター](https://docs.digdag.io/operators/pg.html)
