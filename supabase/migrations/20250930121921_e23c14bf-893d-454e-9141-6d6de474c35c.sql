-- Make the bucket public so file URLs work without authentication
UPDATE storage.buckets
SET public = true
WHERE id = 'contact-attachments';