create or replace view view_restaurant_workdays
as
select r.*
from restaurants r join restaurant_workdays rw
on r.restaurant_id = rw.restaurant_id join workdays w
on rw.workday_id = w.workday_id
where w.workday_value = dayofweek(CONVERT_TZ(now(),'+00:00',r.time_zone_value))
and CONVERT_TZ(now(),'+00:00',r.time_zone_value) >= rw.from_hours 
and  CONVERT_TZ(now(),'+00:00',r.time_zone_value) < case
																								when rw.from_hours > to_hours then
                                                                                               str_to_date(concat(date_format(date_add(CONVERT_TZ(now(),'+00:00',r.time_zone_value), interval 1 day),'%Y-%m-%d'),' ', rw.to_hours), '%Y-%m-%d %H:%i:%s')
                                                                                                else 
                                                                                                str_to_date(concat(date_format(date_add(CONVERT_TZ(now(),'+00:00',r.time_zone_value), interval 0 day),'%Y-%m-%d'),' ', rw.to_hours), '%Y-%m-%d %H:%i:%s')
																							end;

create or replace view view_available_brands_workdays
as                                                                                            
select distinct b.*
from view_restaurant_workdays rw  join  brands b
on rw.brand_id = b.brand_id;


select *
from view_restaurant_workdays
where brand_id in (select brand_id from view_available_brands_workdays);

create or replace view view_banners
as
select *
from banners
where CONVERT_TZ(now(),'+00:00',time_zone_value) between active_at and expired_at;

create or replace view view_brands_categories
as
select c.* 
from categories c join brands_categories_details bcd
on c.category_id = bcd.category_id join brands b
on bcd.brand_id = b.brand_id













