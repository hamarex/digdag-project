-- MD5認証に変更（古いPostgreSQLクライアントとの互換性のため）
ALTER SYSTEM SET password_encryption = 'md5';
SELECT pg_reload_conf();

-- digdagユーザーのパスワードを再設定
ALTER USER digdag WITH PASSWORD 'digdag_secure_password_2026';
