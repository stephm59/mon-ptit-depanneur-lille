-- Drop existing policies for contact-attachments
DROP POLICY IF EXISTS "Anyone can upload contact attachments" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can view contact attachments" ON storage.objects;

-- Allow anonymous users to upload files to contact-attachments bucket
CREATE POLICY "Allow anonymous uploads to contact attachments"
ON storage.objects
FOR INSERT
TO anon, authenticated
WITH CHECK (bucket_id = 'contact-attachments');

-- Allow anyone to view files from contact-attachments bucket
CREATE POLICY "Allow public access to contact attachments"
ON storage.objects
FOR SELECT
TO anon, authenticated
USING (bucket_id = 'contact-attachments');

-- Make the bucket public so URLs work without authentication
UPDATE storage.buckets
SET public = true
WHERE id = 'contact-attachments';