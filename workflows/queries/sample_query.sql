-- サンプルテーブル作成
CREATE TABLE IF NOT EXISTS sample_table (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- サンプルデータ挿入
INSERT INTO sample_table (name) VALUES
    ('Sample 1'),
    ('Sample 2'),
    ('Sample 3');

-- 結果確認
SELECT * FROM sample_table;
