-- ==========================================
-- 1. PROJECTIONS, SÉLECTIONS, TRI, MASQUES, IN, BETWEEN
-- ==========================================

-- 1.1 Liste des produits électroniques triés par prix décroissant
SELECT nom_produit, prix_de_vente 
FROM PRODUIT 
WHERE id_categorie = 1 
ORDER BY prix_de_vente DESC;

-- 1.2 Liste des clients dont le nom commence par 'M'
SELECT nom, prenom, email 
FROM CLIENT 
WHERE nom LIKE 'M%';

-- 1.3 Produits dont le prix est compris entre 100 et 800 euros
SELECT nom_produit, prix_de_vente 
FROM PRODUIT 
WHERE prix_de_vente BETWEEN 100 AND 800;

-- 1.4 Commandes passées par certains clients (exemple clients 1,2,3)
SELECT * 
FROM COMMANDE 
WHERE id_client IN (1,2,3);

-- 1.5 Liste des produits uniques vendus (évite les doublons)
SELECT DISTINCT nom_produit 
FROM PRODUIT;

-- ==========================================
-- 2. FONCTIONS D’AGRÉGATION + GROUP BY + HAVING
-- ==========================================

-- 2.1 Quantité totale commandée par produit
SELECT P.nom_produit, SUM(L.quantite_commandee) AS total_vendu
FROM PRODUIT P
JOIN LIGNE_COMMANDE L ON P.id_produit = L.id_produit
GROUP BY P.nom_produit;

-- 2.2 Montant total des commandes par client
SELECT C.nom, C.prenom, SUM(COM.montant_total) AS total_depense
FROM CLIENT C
JOIN COMMANDE COM ON C.id_client = COM.id_client
GROUP BY C.nom, C.prenom;

-- 2.3 Produits dont le total vendu dépasse 5 unités
SELECT P.nom_produit, SUM(L.quantite_commandee) AS total_vendu
FROM PRODUIT P
JOIN LIGNE_COMMANDE L ON P.id_produit = L.id_produit
GROUP BY P.nom_produit
HAVING SUM(L.quantite_commandee) > 5;

-- 2.4 Nombre de produits par catégorie
SELECT C.nom_categorie, COUNT(*) AS nb_produits
FROM PRODUIT P
JOIN CATEGORIE C ON P.id_categorie = C.id_categorie
GROUP BY C.nom_categorie;

-- 2.5 Stock total par magasin
SELECT M.nom_magasin, SUM(S.quantite_stock) AS stock_total
FROM STOCKER S
JOIN MAGASIN M ON S.id_magasin = M.id_magasin
GROUP BY M.nom_magasin;

-- ==========================================
-- 3. JOINTURES INTERNES, EXTERNES, MULTIPLES
-- ==========================================

-- 3.1 Produits et fournisseurs qui les fournissent
SELECT P.nom_produit, F.nom_fournisseur
FROM PRODUIT P
JOIN FOURNIR FO ON P.id_produit = FO.id_produit
JOIN FOURNISSEUR F ON FO.id_fournisseur = F.id_fournisseur;

-- 3.2 Magasins et produits en stock
SELECT M.nom_magasin, P.nom_produit, S.quantite_stock
FROM MAGASIN M
JOIN STOCKER S ON M.id_magasin = S.id_magasin
JOIN PRODUIT P ON S.id_produit = P.id_produit;

-- 3.3 Commandes et lignes de commande
SELECT COM.id_commande, C.nom, P.nom_produit, L.quantite_commandee
FROM COMMANDE COM
JOIN CLIENT C ON COM.id_client = C.id_client
JOIN LIGNE_COMMANDE L ON COM.id_commande = L.id_commande
JOIN PRODUIT P ON L.id_produit = P.id_produit;

-- 3.4 Produits avec promotions (LEFT JOIN pour inclure ceux sans promo)
SELECT P.nom_produit, PR.pourcentage_reduction
FROM PRODUIT P
LEFT JOIN APPLIQUER A ON P.id_produit = A.id_produit
LEFT JOIN PROMOTION PR ON A.id_promotion = PR.id_promotion;

-- 3.5 Magasins qui vendent un produit et le fournisseur correspondant
SELECT M.nom_magasin, P.nom_produit, F.nom_fournisseur
FROM VENDRE V
JOIN MAGASIN M ON V.id_magasin = M.id_magasin
JOIN PRODUIT P ON V.id_produit = P.id_produit
JOIN FOURNISSEUR F ON V.id_fournisseur = F.id_fournisseur;

-- ==========================================
-- 4. REQUÊTES IMBRIQUÉES (NOT IN, EXISTS, ANY, ALL)
-- ==========================================

-- 4.1 Produits qui ne sont pas en promotion
SELECT nom_produit
FROM PRODUIT
WHERE id_produit NOT IN (SELECT id_produit FROM APPLIQUER);

-- 4.2 Clients qui n’ont jamais passé de commande
SELECT nom, prenom
FROM CLIENT
WHERE id_client NOT IN (SELECT id_client FROM COMMANDE);

-- 4.3 Magasins qui ont au moins un produit fourni par le fournisseur 1
SELECT nom_magasin
FROM MAGASIN M
WHERE EXISTS (
    SELECT 1
    FROM VENDRE V
    WHERE V.id_magasin = M.id_magasin AND V.id_fournisseur = 1
);

-- 4.4 Produits dont le prix est supérieur à tous les produits d’une autre catégorie (exemple catégorie 4)
SELECT nom_produit, prix_de_vente
FROM PRODUIT
WHERE prix_de_vente > ALL (
    SELECT prix_de_vente 
    FROM PRODUIT
    WHERE id_categorie = 4
);

-- 4.5 Clients dont les commandes dépassent la dépense moyenne
SELECT C.nom, C.prenom, SUM(COM.montant_total) AS total_depense
FROM CLIENT C
JOIN COMMANDE COM ON C.id_client = COM.id_client
GROUP BY C.nom, C.prenom
HAVING SUM(COM.montant_total) > (
    SELECT AVG(montant_total) FROM COMMANDE
);