-- Update blog post content: fix phone number
UPDATE blog_posts 
SET 
  content = REPLACE(content, '03.66.06.00.68', '03 28 53 48 68'),
  updated_at = now()
WHERE slug = 'climatisation-ne-refroidit-plus';