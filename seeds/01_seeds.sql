INSERT INTO users (id, name, email, password) VALUES (1, 'Nataniel Teaze', 'nteaze0@tiny.cc', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (id, name, email, password) VALUES (2, 'Read Calf', 'rcalf1@skyrock.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (id, name, email, password) VALUES (3, 'Lee Alliban', 'lalliban2@lycos.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (id, name, email, password) VALUES (4, 'Di Kilford', 'dkilford3@cmu.edu', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (id, name, email, password) VALUES (5, 'Melinda Ormes', 'mormes4@toplist.cz', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (id, owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active) VALUES (1, 1, 'elementum', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.', 'http://dummyimage.com/100x100.png/ff4444/ffffff', 'http://dummyimage.com/x100.png/ff4444/ffffff', 4756, 2, 1, 1, 'Canada', '62 Barnett Hill', 'Espanola', 'ON', 'P5E', false);
INSERT INTO properties (id, owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active) VALUES (2, 2, 'orci', 'Vivamus tortor.', 'http://dummyimage.com/100x100.png/dddddd/000000', 'http://dummyimage.com/x100.png/dddddd/000000', 3442, 5, 5, 2, 'Canada', '0 Northview Place', 'Smoky Lake', 'AB', 'N8V', false);
INSERT INTO properties (id, owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active) VALUES (3, 3, 'rutrum', 'Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/100x100.png/cc0000/ffffff', 'http://dummyimage.com/x100.png/5fa2dd/ffffff', 1340, 1, 2, 2, 'Canada', '84 Parkside Road', 'Lambton Shores', 'ON', 'J5T', true);
INSERT INTO properties (id, owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active) VALUES (4, 4, 'nec', 'Curabitur convallis.', 'http://dummyimage.com/100x100.png/dddddd/000000', 'http://dummyimage.com/x100.png/5fa2dd/ffffff', 3734, 3, 1, 5, 'Canada', '66 Jenna Point', 'Prévost', 'QC', 'T7Z', false);
INSERT INTO properties (id, owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active) VALUES (5, 5, 'nulla', 'Etiam justo. Etiam pretium iaculis justo.', 'http://dummyimage.com/100x100.png/dddddd/000000', 'http://dummyimage.com/x100.png/dddddd/000000', 4783, 4, 1, 0, 'Canada', '5137 Forest Dale Trail', 'Saskatoon', 'SK', 'S7W', true);

INSERT INTO reservations (id, start_date, end_date, property_id, guest_id) VALUES (1, '2023-07-01', '2023-05-06', 5, 3);
INSERT INTO reservations (id, start_date, end_date, property_id, guest_id) VALUES (2, '2023-01-04', '2023-05-12', 4, 2);
INSERT INTO reservations (id, start_date, end_date, property_id, guest_id) VALUES (3, '2023-01-02', '2023-06-02', 3, 3);
INSERT INTO reservations (id, start_date, end_date, property_id, guest_id) VALUES (4, '2023-09-05', '2023-06-14', 2, 5);
INSERT INTO reservations (id, start_date, end_date, property_id, guest_id) VALUES (5, '2023-10-13', '2023-04-04', 5, 4);

INSERT INTO property_reviews (id, property_id, guest_id, reservation_id, rating, message) VALUES (1, 5, 3, 1, 5, 'message');
INSERT INTO property_reviews (id, property_id, guest_id, reservation_id, rating, message) VALUES (2, 4, 2, 2, 5, 'message');
INSERT INTO property_reviews (id, property_id, guest_id, reservation_id, rating, message) VALUES (3, 3, 3, 3, 5, 'message');
INSERT INTO property_reviews (id, property_id, guest_id, reservation_id, rating, message) VALUES (4, 2, 5, 4, 5, 'message');
INSERT INTO property_reviews (id, property_id, guest_id, reservation_id, rating, message) VALUES (5, 5, 4, 5, 5, 'message');
