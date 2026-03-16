ALTER TABLE Produit
ADD CONSTRAINT prix_positif
CHECK (prix_de_vente > 0);

ALTER TABLE Produit
ADD CONSTRAINT tva_valide
CHECK (taux_TVA >= 0 AND taux_TVA <= 100);

ALTER TABLE Stocker
ADD CONSTRAINT stock_positif
CHECK (quantite_stock >= 0);

ALTER TABLE Ligne_commande
ADD CONSTRAINT quantite_positive
CHECK (quantite_commandee > 0);

ALTER TABLE Promotion
ADD CONSTRAINT reduction_valide
CHECK (pourcentage_reduction > 0 AND pourcentage_reduction <= 100);

ALTER TABLE Client
ADD CONSTRAINT email_unique
UNIQUE (email);

ALTER TABLE Fournisseur
ADD CONSTRAINT siret_unique
UNIQUE (siret);