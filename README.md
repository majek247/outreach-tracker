# GrowUp Outreach Tracker

A single-page outreach tracker: log who you've contacted, when to follow up,
and your reply rate. Data is stored in Supabase (a free hosted Postgres DB),
so it syncs across every device you open the page on.

## 1. Create a Supabase project (muiztom47@gmail.com's Project)
1. Go to supabase.com and create a free account / project.
2. Once it's provisioned, open **SQL Editor** and run the contents of
   `schema.sql` (creates the `contacts` table).
3. Go to **Settings > API** and copy your **Project URL** and **anon public**
   key.

## 2. Wire up index.html
Open `index.html` and near the top of the `<script>` block, replace:

```js
const SUPABASE_URL = 'YOUR_SUPABASE_URL';
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';
```

with your actual Project URL and anon key. Until you do this, the page shows
a setup banner and the "Add contact" button stays disabled.

## 3. Deploy on GitHub Pages
Following the same pattern as your other subdomain mockups:
1. Push this folder to a GitHub repo (or a folder within one).
2. In the repo's **Settings > Pages**, enable Pages for that
   branch/folder.
3. Point a CNAME record at `<yourgithubusername>.github.io` the same way
   you've done for your other `*.seo-growup.com` subdomains, and add a
   `CNAME` file to the repo root with your chosen subdomain if you want a
   custom domain.

## Notes
- The `anon` key is meant to be public-ish, but the RLS policy in
  `schema.sql` gives it full read/write on the table. That's fine for a
  personal tool, but keep the repo private if you want to be extra safe
  about randoms finding the page and poking at your data.
- To extend later: split by campaign (fintech cold outreach vs. GrowUp SaaS
  outreach) by adding a `campaign` column and a filter tab, or add CSV
  export by querying all rows and generating a CSV client-side.
