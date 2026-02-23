-- digdagサーバー用データベース（自動作成されるため不要だが明示的に記載）
-- digdag_system は環境変数 POSTGRES_DB で自動作成される

-- ユーザー用データベース作成
CREATE DATABASE digdag_user;

-- uuid-ossp拡張を両方のデータベースに追加
\c digdag_system
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

\c digdag_user
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 確認用クエリ
\c digdag_system
SELECT 'digdag_system database initialized' AS status;

\c digdag_user
SELECT 'digdag_user database initialized' AS status;
