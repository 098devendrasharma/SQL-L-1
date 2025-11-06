create database img_pdf;
use img_pdf;
-- create image table
CREATE TABLE images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_name VARCHAR(255),
    image_data LONGBLOB
);

INSERT INTO images (image_name, image_data)
VALUES ('image.jpg', LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 9.4/Uploads/image.jpg'));

select * 
from images;

CREATE TABLE `documents` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `filename` VARCHAR(255) NOT NULL,
  `pdf_data` MEDIUMBLOB NOT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO `documents` (`filename`,  `pdf_data`)
VALUES ('Basic_loop.pdf',  LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 9.4/Uploads/Basic_loop.pdf'));

select * from documents;
select LOAD_FILE('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Basic_loop.pdf');
SHOW VARIABLES LIKE 'secure_file_priv';
