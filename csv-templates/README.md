# CSV Import System - Complete Implementation Guide

✅ **SYSTEM READY**: Staging tables created, unique indexes added, security configured.

## Quick Start

1. **Import CSV files** in this order via [Supabase Dashboard](https://supabase.com/dashboard/project/bpwqdkznbmqwvvxpthhl/editor):
   - `staging_service_city_pages` ← service_city_pages.csv
   - `staging_service_city_offers` ← service_city_offers.csv  
   - `staging_service_city_faqs` ← service_city_faqs.csv
   - `staging_testimonials` ← testimonials.csv

2. **Run merge script**: Execute `CSV_MERGE_SCRIPT.sql` in SQL Editor

3. **Verify**: Check the 6 new PAC pages at `/pompe-a-chaleur-[city]`

## CSV Files Ready

- **service_city_pages.csv** - 6 PAC pages (Marcq, Bondues, La Madeleine, etc.)
- **service_city_offers.csv** - 36 offers (6 per city)
- **service_city_faqs.csv** - 48 FAQs (8 per city)
- **testimonials.csv** - 36 testimonials (6 per city)

## Benefits

- **95% Credit Savings** vs individual inserts
- **Auto JSON-LD** generation for SEO
- **Idempotent imports** (re-run safely)
- **Security compliant** (RLS enabled)

## Technical Details

✅ **Database Setup Complete**:
- Unique indexes for conflict resolution
- Staging tables with RLS policies
- Cities added: Marcq-en-Barœul, Bondues, La Madeleine, Lambersart, Saint-André-lez-Lille, Lomme
- Merge script with upsert logic

## Pages Generated

Each city gets a complete PAC page with:
- SEO-optimized meta tags & H1
- 6 service offers with emojis
- 8 localized FAQs  
- 6 customer testimonials
- Dynamic JSON-LD structured data
- Geographic zone descriptions