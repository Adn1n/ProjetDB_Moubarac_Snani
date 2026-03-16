CREATE DATABASE projetdb;
USE projetdb;

CREATE TABLE Categorie(
    id_categorie INT PRIMARY KEY,
    nom_categorie VARCHAR(100)
);

CREATE TABLE Fournisseur(
    id_fournisseur INT PRIMARY KEY,
    siret VARCHAR(14),
    nom_fournisseur VARCHAR(100)
);

CREATE TABLE Produit(
    id_produit INT PRIMARY KEY,
    reference_produit VARCHAR(100),
    nom_produit VARCHAR(100),
    description_produit TEXT,
    prix_de_vente DECIMAL(10,2),
    taux_TVA DECIMAL(5,2),
    duree_garantie INT,
    id_categorie INT,
    FOREIGN KEY (id_categorie) REFERENCES Categorie(id_categorie)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


CREATE TABLE Magasin(
    id_magasin INT PRIMARY KEY,
    nom_magasin VARCHAR(100),
    adresse_magasin VARCHAR(200),
    ville_magasin VARCHAR(100),
    code_postal VARCHAR(10)
);

CREATE TABLE Client(
    id_client INT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(100),
    telephone VARCHAR(20)
);

CREATE TABLE Employe(
    id_employe INT PRIMARY KEY,
    nom_employe VARCHAR(100),
    id_magasin INT,
    FOREIGN KEY (id_magasin) REFERENCES Magasin(id_magasin)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE Commande(
    id_commande INT PRIMARY KEY,
    date_commande DATE,
    statut_commande VARCHAR(50),
    montant_total DECIMAL(10,2),
    id_client INT,
    FOREIGN KEY (id_client) REFERENCES Client(id_client)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


CREATE TABLE Ligne_commande(
    id_commande INT,
    id_produit INT,
    quantite_commandee INT,
    PRIMARY KEY (id_commande, id_produit),
    FOREIGN KEY (id_commande) REFERENCES Commande(id_commande)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_produit) REFERENCES Produit(id_produit)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Stocker(
    id_produit INT,
    id_magasin INT,
    quantite_stock INT,
    PRIMARY KEY(id_produit, id_magasin),
    FOREIGN KEY (id_produit) REFERENCES Produit(id_produit)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_magasin) REFERENCES Magasin(id_magasin)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Fournir(
    id_produit INT,
    id_fournisseur INT,
    PRIMARY KEY(id_produit, id_fournisseur),
    FOREIGN KEY (id_produit) REFERENCES Produit(id_produit)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_fournisseur) REFERENCES Fournisseur(id_fournisseur)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Vendre(
    id_produit INT,
    id_magasin INT,
    id_fournisseur INT,
    PRIMARY KEY(id_produit, id_magasin, id_fournisseur),
    FOREIGN KEY (id_produit) REFERENCES Produit(id_produit)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_magasin) REFERENCES Magasin(id_magasin)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_fournisseur) REFERENCES Fournisseur(id_fournisseur)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Promotion(
    id_promotion INT PRIMARY KEY,
    pourcentage_reduction DECIMAL(5,2)
);

CREATE TABLE Appliquer(
    id_produit INT,
    id_promotion INT,
    PRIMARY KEY(id_produit, id_promotion),
    FOREIGN KEY (id_produit) REFERENCES Produit(id_produit)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (id_promotion) REFERENCES Promotion(id_promotion)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
