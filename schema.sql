-- Run this once in your Supabase project's SQL editor (SQL Editor > New query).

create table if not exists contacts (
  id text primary key,
  name text not null,
  company text,
  channel text,
  date_sent date not null,
  follow_up_date date not null,
  notes text,
  status text not null default 'Sent',
  created_at timestamptz default now()
);

alter table contacts enable row level security;

-- This is a single-user personal tool, so the anon key gets full access.
-- Anyone who has your Supabase URL + anon key (visible in index.html's source)
-- can read and write this table. That's fine for a private tool only you use,
-- but don't put sensitive data in it, and consider keeping the GitHub repo
-- private for extra safety.
create policy "Allow anon full access" on contacts
  for all
  using (true)
  with check (true);
