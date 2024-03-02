CREATE TABLE categories
(
    id   INTEGER IDENTITY (1,1) PRIMARY KEY,
    name NVARCHAR(30),
    active BIT DEFAULT 1
)
GO
INSERT INTO categories (name)
VALUES ('Flowering Plants'),
       ('Succulents'),
       ('Trees'),
       ('Shrubs'),
       ('Perennials'),
       ('Annuals'),
       ('Herbs'),
       ('Vegetables'),
       ('Fruits'),
       ('Indoor Plants'),
       ('Outdoor Plants'),
       ('Bonsai'),
       ('Cacti'),
       ('Aquatic Plants'),
       ('Climbers'),
       ('Groundcovers'),
       ('Ornamental Grasses'),
       ('Ferns'),
       ('Medicinal Plants'),
       ('Aromatic Plants'),
       ('Shade-loving Plants'),
       ('Sun-loving Plants'),
       ('Drought-tolerant Plants'),
       ('Tropical Plants'),
       ('Alpine Plants'),
       ('Rock Garden Plants'),
       ('Xerophytic Plants'),
       ('Bamboo'),
       ('Hanging Plants'),
       ('Moss'),
       ('Edible Plants'),
       ('Foliage Plants'),
       ('Bulbs'),
       ('Vines'),
       ('Pollinator-friendly Plants'),
       ('Winter-blooming Plants'),
       ('Summer-blooming Plants'),
       ('Fall-blooming Plants'),
       ('Spring-blooming Plants'),
       ('Xerophyte Plants')

GO
CREATE TABLE tags
(
    id   INTEGER IDENTITY (1,1) PRIMARY KEY,
    name NVARCHAR(30),
    active BIT DEFAULT 1
)
GO
INSERT INTO tags (name)
VALUES ('Flowering'),
       ('Fragrant'),
       ('Indoor'),
       ('Outdoor'),
       ('Low Maintenance'),
       ('Colorful'),
       ('Edible'),
       ('Medicinal'),
       ('Shade-loving'),
       ('Drought-tolerant'),
       ('Succulent'),
       ('Tropical'),
       ('Perennial'),
       ('Annual'),
       ('Climber'),
       ('Groundcover'),
       ('Foliage Plants'),
       ('Fruit-bearing'),
       ('Aromatic'),
       ('Native'),
       ('Herb'),
       ('Bamboo'),
       ('Ornamental Grass'),
       ('Bonsai'),
       ('Exotic'),
       ('Aquatic'),
       ('Pollinator-friendly'),
       ('Humidity-loving'),
       ('Rock Garden'),
       ('Winter-blooming'),
       ('Summer-blooming'),
       ('Fall-blooming'),
       ('Spring-blooming'),
       ('Alpine'),
       ('Xerophytic'),
       ('Thorny'),
       ('Hanging Plants'),
       ('Moss'),
       ('Variegated'),
       ('Xerophyte');

GO
CREATE TABLE plants
(
    id           INTEGER IDENTITY (1,1) PRIMARY KEY,
    title        NVARCHAR(30) NOT NULL,
    description  NVARCHAR(MAX),
    image_link   VARCHAR(MAX),
    color        NVARCHAR(30),

    unit_price   DECIMAL(5, 2) DEFAULT 0,

    quantity     INT,
    sale_opening DATE,
    stock_status VARCHAR(30)   DEFAULT 'In Stock',
    active       BIT           DEFAULT 1,
)
GO
INSERT INTO plants (title, description, image_link, color, unit_price, quantity, sale_opening, stock_status)
VALUES ('Rose', 'Beautiful red roses',
        'https://cdn.blossominggifts.com/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/r/e/red-rose-plant-dark-grey-pot.webp',
        'Red', 10.99, 50, '2024-02-01', 'In Stock'),
       ('Tulip', 'Colorful tulips for your garden',
        'https://cdn.blossominggifts.com/media/catalog/product/cache/7/image/9df78eab33525d08d6e5fb8d27136e95/1/0/100-springtime-tulips-vase.webp',
        'Various', 8.99, 75, '2024-02-10', 'In Stock'),
       ('Sunflower', 'Bright and sunny sunflowers',
        'https://purpleflowers.ro/wp-content/uploads/2023/02/15-floarea-soarelui.jpg', 'Yellow', 12.99, 30,
        '2024-03-01', 'In Stock'),
       ('Lavender', 'Fragrant lavender plants',
        'https://m.media-amazon.com/images/I/71AOzpBIX-S._AC_UF894,1000_QL80_.jpg', 'Purple', 9.99, 40, '2024-03-15',
        'In Stock'),
       ('Daisy', 'Classic white daisies', 'https://www.dpartificialflowers.com/wp-content/uploads/2022/11/30.jpg',
        'White', 7.99, 60, '2024-04-01', 'In Stock'),
       ('Orchid', 'Elegant orchids for your home',
        'https://m.media-amazon.com/images/I/71ictJ9K7fS._AC_UF1000,1000_QL80_.jpg', 'Pink', 15.99, 25, '2024-04-10',
        'In Stock'),
       ('Fern', 'Lush green ferns for your garden',
        'https://toastandhoney.com.au/cdn/shop/products/boston-fern-20cm-basket-925758_1080x.jpg?v=1652557621', 'Green',
        11.99, 45, '2024-05-01', 'In Stock'),
       ('Cactus', 'Low-maintenance cactus plants',
        'https://www.ugaoo.com/cdn/shop/files/SpiroCeramicPot-Pink_50bcfff5-8b5d-4221-8321-8d387a1cc844.jpg?v=1683182182&width=1500',
        'Green', 8.99, 80, '2024-05-15', 'In Stock'),
       ('Hydrangea', 'Color-changing hydrangea flowers',
        'https://img.crocdn.co.uk/images/products2/pb/20/00/03/55/pb2000035537.jpg?width=940&height=940', 'Blue', 14.99,
        35, '2024-06-01', 'In Stock'),
       ('Lily', 'Fragrant lilies in various colors',
        'https://www.novablooms.com/cdn/shop/products/PinkOrientalLillies_1200x1200.jpg?v=1617957889', 'Various', 11.99,
        50, '2024-06-10', 'In Stock'),
       ('Bamboo', 'Lucky bamboo for good vibes',
        'https://bloomr.ae/cdn/shop/products/bloomr-trees-artificial-bamboo-tree-artificial-flowers-artificial-trees-artificial-plants-dubai-saudi-arabia-uae-18899251724450_2024x2024.jpg?v=1627131099',
        'Green', 9.99, 20, '2024-07-01', 'In Stock'),
       ('Poinsettia', 'Festive poinsettias for the holidays',
        'https://www.flowersforeveryone.com.au/cdn-cgi/image/fit=contain,width=1000,format=auto/images/products/large/large-poinsettia.jpg',
        'Red', 12.99, 70, '2024-07-15', 'In Stock'),
       ('Maple Tree', 'Beautiful maple trees for your backyard',
        'https://asset.i-fulfilment.co.uk/images/unid/59e06f6e3c574/render/1000/image.jpeg', 'Orange', 11.99, 15,
        '2024-08-01', 'In Stock'),
       ('Succulent', 'Assorted succulents for small spaces',
        'https://www.succulentsandsunshine.com/wp-content/uploads/2021/05/arrange-colorful-succulents-textured-pot-455x455.jpg',
        'Various', 11.99, 90, '2024-08-10', 'In Stock'),
       ('Aloe Vera', 'Aloe vera plants for health benefits',
        'https://m.media-amazon.com/images/I/61pdnefwnhS._AC_UF1000,1000_QL80_.jpg', 'Green', 10.99, 25, '2024-09-01',
        'In Stock'),
       ('Carnation', 'Colorful carnations for any occasion',
        'https://www.snowseed.co.jp/wp/wp-content/uploads/products/fluto_1.jpg', 'Pink', 14.99, 40, '2024-09-15',
        'In Stock'),
       ('Cherry Blossom', 'Cherry blossom trees in full bloom',
        'https://media.homecentre.com/i/homecentre/159777684-159777684-HC16092022_04-2100.jpg?fmt=auto&$quality-standard$&sm=c&$prodimg-m-sqr-pdp-2x$',
        'Pink', 13.99, 50, '2024-10-01', 'In Stock'),
       ('Bougainvillea', 'Vibrant bougainvillea for a splash of color',
        'https://en.flowy.be/cdn/shop/files/bougainvillier-grimpant-treillis_NP_x700.jpg?v=1683290661', 'Pink', 14.99,
        60, '2024-10-10', 'In Stock'),
       ('Palm Tree', 'Exotic palm trees for a tropical feel', 'https://m.media-amazon.com/images/I/71BBHqOYFRL.jpg',
        'Green', 15.99, 30, '2024-11-01', 'In Stock'),
       ('Crocus', 'Early blooming crocus flowers',
        'https://images.thdstatic.com/productImages/e2ef12b6-e72b-4b06-8355-a798a21ed7e0/svn/garden-state-bulb-flower-bulbs-ecf-11-100-31_600.jpg',
        'Purple', 14.99, 45, '2024-11-15', 'In Stock'),
       ('Fuchsia', 'Dangling fuchsia flowers for hanging baskets',
        'https://thisismygarden.com/wp-content/uploads/2022/04/shade-fuchsia.jpg', 'Pink', 16.99, 55, '2024-12-01',
        'In Stock'),
       ('African Violet', 'Delicate African violets for indoor beauty',
        'https://planterhoma.com/cdn/shop/products/3_0a04df69-a1b9-4db5-9b0d-8ce726ce8a4f_800x.jpg?v=1652857057',
        'Purple', 17.99, 20, '2024-12-10', 'In Stock'),
       ('Hibiscus', 'Tropical hibiscus flowers for a splash of color',
        'https://americanplantexchange.com/cdn/shop/products/pinkhib-1.jpg?v=1672881148', 'Red', 18.99, 70,
        '2025-01-01', 'In Stock'),
       ('Zinnia', 'Bright and cheerful zinnia flowers',
        'https://www.selectseeds.com/cdn/shop/products/407-3-1000_1000x.jpg?v=1687467172', 'Various', 19.99, 25,
        '2025-01-15', 'In Stock'),
       ('Ficus', 'Indoor ficus plants for air purification',
        'https://www.plantandpot.nz/wp-content/uploads/2021/12/Ficus-Louis-in-Rounded-White-Pot.jpg', 'Green', 20.99,
        40, '2025-02-01', 'In Stock'),
       ('Daffodil', 'Sunny daffodils for a touch of spring',
        'https://i.pinimg.com/originals/d2/4f/ee/d24fee993517d167ddfd59af27c3fbb0.jpg', 'Yellow', 20.99, 60,
        '2025-02-10', 'In Stock'),
       ('Geranium', 'Classic geraniums for window boxes',
        'https://www.countrydoor.com/dw/image/v2/BBVM_PRD/on/demandware.static/-/Sites-colony-master-catalog/default/dwb754c7dd/large/sub_43/300380.png?sw=680&sh=680&sm=fit',
        'Red', 21.99, 35, '2025-03-01', 'In Stock'),
       ('Chrysanthemum', 'Colorful chrysanthemum flowers',
        'https://image.floranext.com/shared/catalog/product/F/C/FCP-37-White-Chrysanthemum-Plant-Wood.jpg.webp?h=700&w=700&r=255&g=255&b=255',
        'White', 22.99, 50, '2025-03-15', 'In Stock'),
       ('Spider Plant', 'Easy-care spider plants for beginners',
        'https://www.beardsanddaisies.co.uk/cdn/shop/products/Beards-Daises-27.9.220111copy.jpg?v=1664959425', 'Green',
        23.99, 80, '2025-04-01', 'In Stock'),
       ('Columbine', 'Unique columbine flowers for your garden',
        'https://mobileimages.lowes.com/productimages/f3ac973c-eea9-485d-916b-8d012b281982/02111099.jpg?size=pdhism',
        'Various', 24.99, 30, '2025-04-10', 'In Stock'),
       ('Snake Plant', 'Hardy snake plants for air purification',
        'https://images.squarespace-cdn.com/content/v1/54fbb611e4b0d7c1e151d22a/1610074066643-OP8HDJUWUH8T5MHN879K/Snake+Plant.jpg?format=2500w',
        'Green', 25.99, 45, '2025-05-01', 'In Stock'),
       ('Peony', 'Lush peony flowers in various colors', 'https://www.therange.co.uk/media/0/3/1671540211_12_3591.jpg',
        'Various', 26.99, 55, '2025-05-15', 'In Stock'),
       ('Azalea', 'Colorful azalea bushes for landscaping',
        'https://flowercompany.ca/cdn/shop/products/potted-azalea-plant-toronto-flower-co-822484.jpg?v=1676627243',
        'Various', 27.99, 65, '2025-06-01', 'In Stock'),
       ('Clematis', 'Beautiful clematis vines for trellises',
        'https://www.thompson-morgan.com/product_images/100/optimised/CLEM-T71512-B_h.jpg', 'Various', 28.99, 75,
        '2025-06-10', 'In Stock'),
       ('Morning Glory', 'Vibrant morning glory flowers for fences',
        'https://img.ssww.com/cs_srgb/q_90/w_512/cs_srgb/q_90/v1547740778/2c/ob/SWGP3312cob.jpg', 'Various', 29.99, 85,
        '2025-07-01', 'In Stock'),
       ('Camellia', 'Elegant camellia flowers in various hues',
        'https://en-gb.bakker.com/cdn/shop/products/59043-01-BAKIE.jpg?v=1639537655&width=1946', 'Various', 30.99, 95,
        '2025-07-15', 'In Stock'),
       ('Dahlia', 'Showy dahlias in a variety of colors',
        'https://h2.commercev3.net/cdn.brecks.com/images/800/62773.jpg', 'Various', 31.99, 40, '2025-08-01',
        'In Stock'),
       ('Pansy', 'Cheerful pansies for cool-season gardening',
        'https://treemart.org/wp-content/uploads/2023/03/Pansy.jpg', 'Various', 32.99, 30, '2025-08-10',
        'In Stock');
-- GO
-- UPDATE pronia_shop.dbo.plants
-- SET description = N'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incidid ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
GO
CREATE TABLE plant_categories
(
    id          INTEGER IDENTITY (1,1) PRIMARY KEY,
    plant_id    INTEGER FOREIGN KEY REFERENCES plants (id),
    category_id INTEGER FOREIGN KEY REFERENCES categories (id),
)
GO
INSERT INTO plant_categories (plant_id, category_id)
VALUES (1, 1),
       (2, 1),
       (3, 3),
       (4, 5),
       (5, 2),
       (6, 8),
       (7, 4),
       (8, 6),
       (9, 3),
       (10, 2),
       (11, 11),
       (12, 7),
       (13, 3),
       (14, 10),
       (15, 9),
       (16, 5),
       (17, 1),
       (18, 1),
       (19, 12),
       (20, 13),
       (21, 14),
       (22, 9),
       (23, 6),
       (24, 4),
       (25, 12),
       (26, 1),
       (27, 4),
       (28, 6),
       (29, 2),
       (30, 15),
       (31, 1),
       (32, 5),
       (33, 2),
       (34, 3),
       (35, 4),
       (36, 11),
       (37, 7),
       (38, 8),
       (1, 40),
       (2, 39),
       (3, 38),
       (4, 37),
       (5, 36),
       (6, 35),
       (7, 34),
       (8, 33),
       (9, 32),
       (10, 31),
       (11, 30),
       (12, 29),
       (13, 28),
       (14, 27),
       (15, 26),
       (16, 25),
       (17, 24),
       (18, 23),
       (19, 22),
       (20, 21),
       (21, 20),
       (22, 19),
       (23, 18),
       (24, 17),
       (25, 16),
       (26, 15),
       (27, 14),
       (28, 13),
       (29, 12),
       (30, 11),
       (31, 10),
       (32, 9),
       (33, 8),
       (34, 7),
       (35, 6),
       (36, 5),
       (37, 4),
       (38, 3)
GO
CREATE TABLE plant_tags
(
    id       INTEGER IDENTITY (1,1) PRIMARY KEY,
    plant_id INTEGER FOREIGN KEY REFERENCES plants (id),
    tag_id   INTEGER FOREIGN KEY REFERENCES tags (id),
)
GO
INSERT INTO plant_tags (plant_id, tag_id)
VALUES (1, 1),
       (2, 1),
       (3, 3),
       (4, 5),
       (5, 2),
       (6, 8),
       (7, 4),
       (8, 6),
       (9, 3),
       (10, 2),
       (11, 11),
       (12, 7),
       (13, 3),
       (14, 10),
       (15, 9),
       (16, 5),
       (17, 1),
       (18, 1),
       (19, 12),
       (20, 13),
       (21, 14),
       (22, 9),
       (23, 6),
       (24, 4),
       (25, 12),
       (26, 1),
       (27, 4),
       (28, 6),
       (29, 2),
       (30, 15),
       (31, 1),
       (32, 5),
       (33, 2),
       (34, 3),
       (35, 4),
       (36, 11),
       (37, 7),
       (38, 8),
       (1, 40),
       (2, 39),
       (3, 38),
       (4, 37),
       (5, 36),
       (6, 35),
       (7, 34),
       (8, 33),
       (9, 32),
       (10, 31),
       (11, 30),
       (12, 29),
       (13, 28),
       (14, 27),
       (15, 26),
       (16, 25),
       (17, 24),
       (18, 23),
       (19, 22),
       (20, 21),
       (21, 20),
       (22, 19),
       (23, 18),
       (24, 17),
       (25, 16),
       (26, 15),
       (27, 14),
       (28, 13),
       (29, 12),
       (30, 11),
       (31, 10),
       (32, 9),
       (33, 8),
       (34, 7),
       (35, 6),
       (36, 5),
       (37, 4),
       (38, 3)
GO
CREATE TABLE user_roles
(
    id   INTEGER IDENTITY (1,1) PRIMARY KEY,
    name NVARCHAR(30),
)
GO
INSERT INTO user_roles (name)
VALUES ('Admin'),
       ('Customer')
GO
CREATE TABLE users
(
    id             INTEGER IDENTITY (1,1) PRIMARY KEY,
    first_name     NVARCHAR(30),
    last_name      NVARCHAR(30),

    email_address  NVARCHAR(30),
    password       VARCHAR(30),

    country        NVARCHAR(20) NOT NULL,
    street_address VARCHAR(128) NOT NULL,
    apartment      VARCHAR(128),

    city           VARCHAR(128) NOT NULL,
    postcode       VARCHAR(128) NOT NULL,

    phone          VARCHAR(11)  NOT NULL,
    active         BIT          DEFAULT 1,
    role_id        INTEGER FOREIGN KEY REFERENCES user_roles (id),
)
GO
INSERT INTO users (first_name, last_name, email_address, password, country, street_address, apartment, city, postcode,
                   phone, role_id)
VALUES ('Hoang Anh', 'Quoc', 'anhquoc5.1.2003.q@gmail.com', '123456', 'Viet Nam', 'Thach Hoa - Thach That',
        'YoungHouse', 'Ha Noi', '123456', '0859159180', 1),
       ('Nguyen Thi', 'A', 'nguyenthiA1873@gmail.com', '123456', 'Viet Nam', 'Trieu Son', '', 'Thanh Hoa', '123456',
        '0859159180', 2),
       ('John', 'Doe', 'john.doe@example.com', 'password123', 'USA', '123 Main St', 'Apt 456', 'New York', '10001',
        '555-1234', 2),
       ('Jane', 'Smith', 'jane.smith@example.com', 'pass456', 'Canada', '789 Maple Ave', 'Suite 789', 'Toronto',
        'M1M 1M1', '555-5678', 2),
       ('Michael', 'Johnson', 'michael.johnson@example.com', 'pass789', 'UK', '456 Oak Lane', 'Apt 101', 'London',
        'SW1A 1AA', '555-8765', 2),
       ('Sophie', 'Taylor', 'sophie.taylor@example.com', 'secure123', 'Australia', '789 Elm Street', 'Unit 23',
        'Sydney', '2000', '555-4321', 2),
       ('Carlos', 'Rodriguez', 'carlos.rodriguez@example.com', 'pass123', 'Spain', 'Calle Principal', 'Piso 3',
        'Barcelona', '08001', '555-9876', 2),
       ('Anna', 'Lopez', 'anna.lopez@example.com', 'password456', 'Italy', 'Via Roma', 'Appartamento 5', 'Rome',
        '00100', '555-6543', 2),
       ('Makoto', 'Sato', 'makoto.sato@example.com', 'pass789', 'Japan', '1-2-3 Shinjuku', 'Apartment 101', 'Tokyo',
        '160-0022', '555-7890', 2),
       ('Yuki', 'Tanaka', 'yuki.tanaka@example.com', 'secure123', 'Japan', '4-5-6 Shibuya', 'Unit 203', 'Tokyo',
        '150-0043', '555-0123', 2)
GO
CREATE VIEW user_view AS
SELECT users.*, user_roles.name AS role_name
FROM users
         JOIN user_roles ON users.role_id = user_roles.id
GO


CREATE TABLE user_sessions
(
    id          INTEGER IDENTITY (1,1) PRIMARY KEY,
    session_id  VARCHAR(128) NOT NULL UNIQUE,
    user_id     INTEGER FOREIGN KEY REFERENCES users (id),
    time_created DATETIME DEFAULT CURRENT_TIMESTAMP,
    valid_until DATETIME DEFAULT CURRENT_TIMESTAMP,
    active      BIT DEFAULT 1,
)
GO


CREATE TABLE order_status
(
    id   INTEGER IDENTITY (1,1) PRIMARY KEY,
    name NVARCHAR(20),
)
GO
INSERT INTO order_status (name)
VALUES ('Pending'),
       ('Processing'),
       ('Delivered'),
       ('Cancelled'),
       ('Returned')
GO
CREATE TABLE orders
(
    id              INTEGER IDENTITY (1,1) PRIMARY KEY,

    country         NVARCHAR(20)  NOT NULL,
    street_address  VARCHAR(128)  NOT NULL,
    apartment       VARCHAR(128),

    city            VARCHAR(128)  NOT NULL,
    postcode        VARCHAR(128)  NOT NULL,

    total_price     DECIMAL(5, 2) NOT NULL DEFAULT 0,
    order_date      DATE,
    order_status_id INTEGER FOREIGN KEY REFERENCES order_status (id),
    customer_id     INTEGER FOREIGN KEY REFERENCES users (id),
)
GO
INSERT INTO orders (country, street_address, apartment, city, postcode, total_price, order_date, order_status_id,
                    customer_id)
VALUES ('Viet Nam', 'Trieu Son', '', 'Thanh Hoa', '123456', 0, '2021-01-01', 1, 2),
       ('USA', '123 Main St', 'Apt 456', 'New York', '10001', 0, '2021-02-15', 2, 4),
       ('Canada', '789 Maple Ave', 'Suite 789', 'Toronto', 'M1M 1M1', 0, '2021-03-01', 3, 5),
       ('UK', '456 Oak Lane', 'Apt 101', 'London', 'SW1A 1AA', 0, '2021-04-15', 4, 6),
       ('Australia', '789 Elm Street', 'Unit 23', 'Sydney', '2000', 0, '2021-05-01', 5, 7),
       ('Spain', 'Calle Principal', 'Piso 3', 'Barcelona', '08001', 0, '2021-06-15', 1, 8),
       ('Italy', 'Via Roma', 'Appartamento 5', 'Rome', '00100', 0, '2021-07-01', 2, 9),
       ('Japan', '1-2-3 Shinjuku', 'Apartment 101', 'Tokyo', '160-0022', 0, '2021-08-15', 3, 3),
       ('Japan', '4-5-6 Shibuya', 'Unit 203', 'Tokyo', '150-0043', 0, '2021-09-01', 4, 2),
       ('Germany', 'Hauptstrasse', 'Wohnung 7', 'Berlin', '10115', 0, '2021-10-10', 1, 2)

GO
CREATE TABLE order_detail
(
    id         INTEGER IDENTITY (1,1) PRIMARY KEY,

    product_id INTEGER REFERENCES plants (id),
    quantity   INTEGER NOT NULL,
    order_id   INTEGER FOREIGN KEY REFERENCES orders (id),
)
GO
CREATE TRIGGER update_total_price_of_order
    ON order_detail
    AFTER INSERT
    AS
    UPDATE orders
    SET total_price = (SELECT SUM(plants.unit_price * order_detail.quantity)
                       FROM plants
                                JOIN order_detail ON plants.id = order_detail.product_id
                       WHERE order_detail.order_id = orders.id)
    WHERE orders.id = (SELECT order_id FROM inserted)

GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (1, 1, 1)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (2, 2, 1)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (3, 3, 1)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (4, 2, 1)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (7, 1, 1)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (4, 2, 2)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (5, 3, 3)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (6, 2, 4)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (38, 3, 3)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (37, 4, 4)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (36, 2, 5)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (35, 4, 6)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (34, 1, 7)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (33, 2, 8)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (32, 3, 9)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (31, 3, 10)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (30, 3, 1)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (29, 2, 2)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (28, 2, 3)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (27, 4, 4)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (26, 2, 5)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (25, 2, 6)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (24, 3, 7)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (23, 2, 8)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (22, 2, 9)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (21, 2, 10)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (20, 2, 1)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (19, 2, 2)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (18, 3, 3)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (17, 1, 4)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (16, 2, 5)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (15, 3, 6)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (14, 2, 7)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (13, 2, 8)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (12, 2, 9)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (11, 3, 10)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (10, 3, 1)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (9, 3, 2)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (8, 2, 3)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (7, 3, 4)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (6, 2, 5)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (5, 3, 6)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (4, 4, 7)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (3, 2, 8)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (2, 3, 9)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (1, 3, 10)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (38, 2, 1)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (37, 2, 2)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (36, 2, 3)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (35, 2, 4)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (34, 3, 5)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (33, 2, 6)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (31, 2, 8)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (30, 1, 9)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (29, 2, 10)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (28, 2, 1)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (27, 3, 2)
GO
INSERT INTO order_detail (product_id, quantity, order_id)
VALUES (26, 2, 3)
GO
CREATE VIEW order_view AS
SELECT orders.id,
       orders.country,
       orders.street_address,
       orders.apartment,
       orders.city,
       orders.postcode,
       orders.total_price,
       orders.order_date,
       order_status.name AS order_status,
       orders.customer_id,
       users.first_name +' '+ users.last_name AS customer_name,
       users.email_address,
       users.phone
FROM orders
         JOIN order_status ON orders.order_status_id = order_status.id
         JOIN users ON orders.customer_id = users.id
GO
CREATE VIEW order_detail_view AS
SELECT order_detail.id,
       order_detail.product_id,
       plants.title AS product_name,
       order_detail.quantity,
       plants.unit_price,
       order_detail.quantity * plants.unit_price AS sub_total_price,
       order_detail.order_id
FROM order_detail
         JOIN plants ON order_detail.product_id = plants.id
GO


-- CREATE TABLE cart_status
-- (
--     id   INTEGER IDENTITY (1,1) PRIMARY KEY,
--     name VARCHAR(30),
-- )
-- GO
CREATE TABLE carts
(
    id          INTEGER IDENTITY (1,1) PRIMARY KEY,
    customer_id INTEGER FOREIGN KEY REFERENCES users (id),
    total_price DECIMAL(5, 2) NOT NULL DEFAULT 0,
)
GO
INSERT INTO carts (customer_id) SELECT id FROM users;
GO
CREATE TABLE cart_detail
(
    id         INTEGER IDENTITY (1,1) PRIMARY KEY,
    product_id INTEGER FOREIGN KEY REFERENCES plants (id),
    quantity   INTEGER NOT NULL,
    cart_id    INTEGER FOREIGN KEY REFERENCES carts (id),
    sub_total  DECIMAL(5, 2) NOT NULL DEFAULT 0,
)
GO
-- GO
-- CREATE TABLE wish_list
-- (
--     id          INTEGER IDENTITY (1,1) PRIMARY KEY,
--     customer_id INTEGER FOREIGN KEY REFERENCES users (id),
-- )
-- GO
-- CREATE TABLE wish_list_detail
-- (
--     id           INTEGER IDENTITY (1,1) PRIMARY KEY,
--     product_id   INTEGER FOREIGN KEY REFERENCES plants (id),
--     wish_list_id INTEGER FOREIGN KEY REFERENCES wish_list (id),
-- )
-- GO



CREATE VIEW plant_with_categories_view AS
SELECT plants.id,
       plants.title,
       plants.description,
       plants.image_link,
       plants.color,
       plants.unit_price,
       plants.quantity,
       plants.sale_opening,
       plants.stock_status,
       categories.id   AS category_id,
       categories.name AS category_name,
       categories.active

FROM plants
         JOIN plant_categories ON plants.id = plant_categories.plant_id
         JOIN categories ON plant_categories.category_id = categories.id
GO
CREATE VIEW plant_with_tags_view AS
SELECT plants.id,
       plants.title,
       plants.description,
       plants.image_link,
       plants.color,
       plants.unit_price,
       plants.quantity,
       plants.sale_opening,
       plants.stock_status,
       tags.id AS tag_id,
       tags.name AS tag_name,
       tags.active

FROM plants
         JOIN plant_tags ON plants.id = plant_tags.plant_id
         JOIN tags ON plant_tags.tag_id = tags.id

--
-- SELECT TOP 8 *
-- FROM plants
-- ORDER BY plants.sale_opening DESC
--
-- SELECT DISTINCT plants.color
-- FROM plants


