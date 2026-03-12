create table if not exists users (
  email text primary key,
  id text,
  name text,
  pass text,
  bio text default '',
  avatar text,
  avatar_bg boolean default true,
  created_at timestamptz default now()
);

create table if not exists posts (
  id text primary key,
  author_id text,
  author_name text,
  author_avatar text,
  author_avatar_bg boolean default true,
  caption text default '',
  image text,
  mood jsonb,
  tags jsonb default '[]',
  reactions jsonb default '{}',
  comments jsonb default '[]',
  moderated boolean default true,
  created_at timestamptz default now()
);

create table if not exists bookmarks (
  key text primary key,
  user_id text,
  post_id text,
  saved_at timestamptz default now()
);

create table if not exists notifications (
  id text primary key,
  user_id text,
  type text,
  emoji text,
  from_name text,
  from_avatar text,
  post_id text,
  post_image text,
  text text,
  read boolean default false,
  created_at timestamptz default now()
);

alter table users disable row level security;
alter table posts disable row level security;
alter table bookmarks disable row level security;
alter table notifications disable row level security;
alter table posts add column if not exists moderated boolean default true;
