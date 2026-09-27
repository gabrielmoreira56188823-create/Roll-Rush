create table if not exists public.players (
 id uuid primary key references auth.users(id) on delete cascade,
 username text not null unique check (char_length(username) between 1 and 24),
 run_points integer not null default 0 check (run_points >= 0),
 bank_points integer not null default 0 check (bank_points >= 0),
 position bigint not null default 0 check (position >= 0),
 rolls integer not null default 0 check (rolls >= 0),
 low_rolls integer not null default 0 check (low_rolls >= 0),
 upgrades jsonb not null default '{}'::jsonb,
 updated_at timestamptz not null default now()
);
alter table public.players enable row level security;
drop policy if exists "players read authenticated" on public.players;
create policy "players read authenticated" on public.players for select to authenticated using (true);
drop policy if exists "players insert self" on public.players;
create policy "players insert self" on public.players for insert to authenticated with check (auth.uid()=id);
drop policy if exists "players update self" on public.players;
create policy "players update self" on public.players for update to authenticated using (auth.uid()=id) with check (auth.uid()=id);
drop policy if exists "players delete self" on public.players;
create policy "players delete self" on public.players for delete to authenticated using (auth.uid()=id);
do $$ begin
 if not exists(select 1 from pg_publication_tables where pubname='supabase_realtime' and schemaname='public' and tablename='players') then
   alter publication supabase_realtime add table public.players;
 end if;
end $$;
