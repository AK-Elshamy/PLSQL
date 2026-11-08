create materialized view myposts as
   select accid,
          postid,
          postdate,
          posttext
     from posts
    where postdate = sysdate
      and ( posts.accid = :user_id
       or posts.accid in (
      select friendid
        from friendship
       where friendship.accid = :user_id
   ) );