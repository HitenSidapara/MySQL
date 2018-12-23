show databases;
use ig_clone;
select database();

show tables;

desc follows;

insert into follows(follower_id,followee_id)
values(4,4);




#create a trigger to prevent self follow


DELIMITER $$

create trigger prevent_self_follows
	before insert on follows for each row
    begin
		if NEW.follower_id = NEW.followee_id
        then
			signal sqlstate '45000'
            set message_text = 'you can not follow your self';
		end if;
    end;
$$
DELIMITER ;


insert into follows(follower_id,followee_id)
values(4,4);   #create  error the follow not your self 







#create a trigger unfollow feature



#create unfollow table




create table unfollows(
	follower_id int not null,
    followee_id int not null,
	created_at  timestamp default now(),
    foreign key(follower_id) references users(id),
    foreign key(followee_id) references users(id),
    primary key(follower_id,followee_id)            #one to one relation ship because not allow the duplicate value in table
);

desc unfollows;


#in this trigger when the any row delete in the follows table then this row is insert in unfollow table

DELIMITER $$

create trigger capture_unfollow
	after delete on follows for each row
    begin
		INSERT INTO unfollows
        SET follower_id=OLD.follower_id,
			followee_id=OLD.followee_id;
    end;
$$
DELIMITER ;


#how it work?

select * from follows  limit 5;

delete from follows where follower_id = 2 AND followee_id = 1; #delete row in follows table

select * from unfollows;#using above trigger the row is insert in unfollow table



#show the trigger are exist in our database

show triggers;

#delete the triggers

drop trigger prevent_self_follows;
