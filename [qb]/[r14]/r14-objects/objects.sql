CREATE TABLE objects (
    id int NOT NULL AUTO_INCREMENT,
    list LONGTEXT NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO objects (list)
VALUES ('[]');

INSERT INTO objects (list)
VALUES ('[]');
