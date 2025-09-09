-- Enable RLS on all staging tables
ALTER TABLE staging_service_city_pages ENABLE ROW LEVEL SECURITY;
ALTER TABLE staging_service_city_offers ENABLE ROW LEVEL SECURITY;
ALTER TABLE staging_service_city_faqs ENABLE ROW LEVEL SECURITY;
ALTER TABLE staging_testimonials ENABLE ROW LEVEL SECURITY;

-- Add RLS policies for staging tables (allow all authenticated users)
CREATE POLICY "Authenticated users can manage staging data" ON staging_service_city_pages
FOR ALL USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can manage staging data" ON staging_service_city_offers
FOR ALL USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can manage staging data" ON staging_service_city_faqs
FOR ALL USING (auth.role() = 'authenticated');

CREATE POLICY "Authenticated users can manage staging data" ON staging_testimonials
FOR ALL USING (auth.role() = 'authenticated');

-- Fix the existing function search path
CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER SET search_path = public
AS $function$
begin
  new.updated_at = now();
  return new;
end;
$function$;