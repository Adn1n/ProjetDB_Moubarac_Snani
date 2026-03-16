-- ==========================
-- 1. TABLES SANS CLÉS ÉTRANGÈRES
-- ==========================

-- Table CATEGORIE
INSERT INTO CATEGORIE(id_categorie, nom_categorie) VALUES
(1, 'Électronique'),
(2, 'Informatique'),
(3, 'Jeux vidéo'),
(4, 'Livres'),
(5, 'Musique'),
(6, 'Films & Séries'),
(7, 'Photo & Vidéo'),
(8, 'Maison'),
(9, 'Téléphonie'),
(10, 'Bricolage');

-- Table FOURNISSEUR
INSERT INTO FOURNISSEUR(id_fournisseur, siret, nom_fournisseur) VALUES
(1, '12345678900011', 'TechDistrib'),
(2, '22345678900022', 'BookSupply'),
(3, '32345678900033', 'GameWorld'),
(4, '42345678900044', 'ElectroPlus'),
(5, '52345678900055', 'HomeComfort'),
(6, '62345678900066', 'PhotoPro'),
(7, '72345678900077', 'MusicFactory'),
(8, '82345678900088', 'MovieHub'),
(9, '92345678900099', 'PhoneLine'),
(10, '10345678900100', 'BricolageExpress');

-- Table MAGASIN
INSERT INTO MAGASIN(id_magasin, nom_magasin, adresse_magasin, ville_magasin, code_postal) VALUES
(1, 'Fnac Paris Opéra', '30 Boulevard Haussmann', 'Paris', '75009'),
(2, 'Fnac Lyon Part-Dieu', '17 Rue Dr Bouchut', 'Lyon', '69003'),
(3, 'Darty Marseille', '12 Rue Saint-Ferréol', 'Marseille', '13001'),
(4, 'Fnac Lille', '1 Rue de Béthune', 'Lille', '59000'),
(5, 'Darty Toulouse', '24 Rue d’Alsace Lorraine', 'Toulouse', '31000'),
(6, 'Fnac Bordeaux', '2 Cours de l’Intendance', 'Bordeaux', '33000'),
(7, 'Darty Nice', '14 Avenue Jean Médecin', 'Nice', '06000'),
(8, 'Fnac Strasbourg', '5 Rue des Grandes Arcades', 'Strasbourg', '67000'),
(9, 'Darty Nantes', '8 Rue Crébillon', 'Nantes', '44000'),
(10, 'Fnac Montpellier', '10 Place de la Comédie', 'Montpellier', '34000');

-- Table CLIENT
INSERT INTO CLIENT(id_client, nom, prenom, email, telephone) VALUES
(1, 'Dupont', 'Alice', 'alice.dupont@email.com', '0601020304'),
(2, 'Martin', 'Paul', 'paul.martin@email.com', '0602030405'),
(3, 'Bernard', 'Sophie', 'sophie.bernard@email.com', '0603040506'),
(4, 'Petit', 'Julien', 'julien.petit@email.com', '0604050607'),
(5, 'Moreau', 'Emma', 'emma.moreau@email.com', '0605060708'),
(6, 'Lefevre', 'Lucas', 'lucas.lefevre@email.com', '0606070809'),
(7, 'Roux', 'Clara', 'clara.roux@email.com', '0607080910'),
(8, 'Fournier', 'Louis', 'louis.fournier@email.com', '0608091011'),
(9, 'Girard', 'Ines', 'ines.girard@email.com', '0609101112'),
(10, 'Mercier', 'Hugo', 'hugo.mercier@email.com', '0610111213');

-- Table PRODUIT
INSERT INTO PRODUIT(id_produit, reference_produit, nom_produit, description_produit, prix_de_vente, taux_TVA, duree_garantie, id_categorie) VALUES
(1, 'ELEC001', 'TV Samsung 55"', 'Télévision 4K UHD, Smart TV', 799.99, 20, 24, 1),
(2, 'INFO001', 'PC Portable HP', 'Ordinateur portable i7, 16Go RAM', 1199.00, 20, 24, 2),
(3, 'JEUX001', 'PS5 Console', 'Console Sony PlayStation 5', 499.99, 20, 24, 3),
(4, 'LIV001', 'Le Petit Prince', 'Livre de Saint-Exupéry', 12.50, 5.5, 0, 4),
(5, 'MUS001', 'Guitare Fender', 'Guitare électrique Fender Stratocaster', 699.00, 20, 12, 5),
(6, 'FILM001', 'Matrix DVD', 'Film Matrix version DVD', 9.99, 5.5, 0, 6),
(7, 'PHOTO001', 'Appareil photo Canon', 'Canon EOS 250D, 24MP', 499.00, 20, 24, 7),
(8, 'MAIS001', 'Aspirateur Dyson', 'Aspirateur sans fil Dyson V11', 599.00, 20, 24, 8),
(9, 'TEL001', 'iPhone 15', 'Smartphone Apple iPhone 15', 1099.00, 20, 24, 9),
(10, 'BRIC001', 'Perceuse Bosch', 'Perceuse à percussion 18V', 129.99, 20, 24, 10);

-- Table EMPLOYE
INSERT INTO EMPLOYE(id_employe, nom_employe, id_magasin) VALUES
(1, 'Durand', 1),
(2, 'Morel', 2),
(3, 'Blanc', 3),
(4, 'Garnier', 4),
(5, 'Faure', 5),
(6, 'Lemoine', 6),
(7, 'Renaud', 7),
(8, 'Perrin', 8),
(9, 'Noel', 9),
(10, 'Chevalier', 10);

-- ==========================
-- 2. TABLES AVEC CLÉS ÉTRANGÈRES
-- ==========================

-- Table COMMANDE
INSERT INTO COMMANDE(id_commande, date_commande, statut_commande, montant_total, id_client) VALUES
(1, '2026-03-01', 'En cours', 1212.49, 1),
(2, '2026-03-02', 'Livrée', 499.99, 2),
(3, '2026-03-03', 'Annulée', 12.50, 3),
(4, '2026-03-04', 'Livrée', 1199.00, 4),
(5, '2026-03-05', 'En cours', 699.00, 5),
(6, '2026-03-06', 'Livrée', 599.00, 6),
(7, '2026-03-07', 'Livrée', 1099.00, 7),
(8, '2026-03-08', 'En cours', 129.99, 8),
(9, '2026-03-09', 'Livrée', 499.00, 9),
(10, '2026-03-10', 'Livrée', 9.99, 10);

-- Table LIGNE_COMMANDE
INSERT INTO LIGNE_COMMANDE(id_commande, id_produit, quantite_commandee) VALUES
(1, 1, 1),
(1, 4, 1),
(2, 3, 1),
(3, 4, 1),
(4, 2, 1),
(5, 5, 1),
(6, 8, 1),
(7, 9, 1),
(8, 10, 1),
(9, 7, 1);

-- Table STOCKER
INSERT INTO STOCKER(id_produit, id_magasin, quantite_stock) VALUES
(1, 1, 10),
(2, 2, 5),
(3, 3, 7),
(4, 4, 20),
(5, 5, 3),
(6, 6, 15),
(7, 7, 8),
(8, 8, 6),
(9, 9, 12),
(10, 10, 9);

-- Table FOURNIR
INSERT INTO FOURNIR(id_produit, id_fournisseur) VALUES
(1, 1),
(2, 1),
(3, 3),
(4, 2),
(5, 7),
(6, 8),
(7, 6),
(8, 5),
(9, 9),
(10, 10);

-- Table VENDRE
INSERT INTO VENDRE(id_produit, id_magasin, id_fournisseur) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 3),
(4, 4, 2),
(5, 5, 7),
(6, 6, 8),
(7, 7, 6),
(8, 8, 5),
(9, 9, 9),
(10, 10, 10);

-- Table PROMOTION
INSERT INTO PROMOTION(id_promotion, pourcentage_reduction) VALUES
(1, 10),
(2, 15),
(3, 20),
(4, 5),
(5, 25),
(6, 30),
(7, 12),
(8, 18),
(9, 8),
(10, 22);

-- Table APPLIQUER
INSERT INTO APPLIQUER(id_produit, id_promotion) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);