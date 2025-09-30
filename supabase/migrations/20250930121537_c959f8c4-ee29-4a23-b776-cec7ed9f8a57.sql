-- Create storage bucket for contact form attachments
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES (
  'contact-attachments',
  'contact-attachments',
  false,
  10485760, -- 10MB
  ARRAY['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'image/jpeg', 'image/png']
);

-- Allow anyone to upload files (they'll get a unique name)
CREATE POLICY "Anyone can upload contact attachments"
ON storage.objects
FOR INSERT
WITH CHECK (bucket_id = 'contact-attachments');

-- Only authenticated users can view attachments (for admin access)
CREATE POLICY "Authenticated users can view contact attachments"
ON storage.objects
FOR SELECT
USING (bucket_id = 'contact-attachments' AND auth.role() = 'authenticated');