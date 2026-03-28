CREATE TRIGGER follows_trigger BEFORE INSERT ON follows FOR EACH ROW BEGIN 
  IF NEW.follower_id=NEW.followee_id
  THEN 
  SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT='Nah! You cannot follow your self!!!';
  END IF;
END