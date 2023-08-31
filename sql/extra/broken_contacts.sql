-- Add rows from old db not found;
-- FAILS as column names do not match
-- Probably not important as old db and new db almost match in terms of row count
INSERT INTO contacts
SELECT
  *
  -- ,0 AS picture_source
FROM
  old.contacts
WHERE
  m_id NOT IN (SELECT m_id FROM contacts);

