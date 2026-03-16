# ProjetDB_Moubarac_Snani
Ce projet consiste à concevoir une base de données en appliquant la méthode MERISE. À partir d’un domaine choisi, les étudiants analysent les besoins, créent un MCD, puis développent et interrogent la base via SQL, en utilisant un dépôt GitHub.

## Conception d’une base de données pour une entreprise de vente multimédia

## 1. Analyse des besoins

### Domaine choisi
Le projet consiste à concevoir une base de données pour une entreprise spécialisée dans la vente de produits multimédias et d’appareils électroniques.  
Cette entreprise vend différents types de produits comme des jeux vidéo, des consoles, des CD, ainsi que d’autres appareils électroniques.

Ce système est similaire à des enseignes comme **Fnac**, **Micromania**, **Boulanger** ou **Darty**.

Les données collectées concernent notamment :
- les produits
- les catégories de produits
- les marques
- les clients
- les commandes
- les paiements
- les magasins
- les stocks

---

# 2. Prompt utilisé (Framework RICARDO)

### R — Rôle
Tu es un expert en analyse des besoins et en conception de bases de données utilisant la méthode MERISE.

### I — Instructions
Analyse le fonctionnement d’une entreprise de vente de produits multimédias et électroniques.  
Identifie les règles de gestion des données de cette entreprise.  
Ensuite, à partir de ces règles, crée un dictionnaire de données correspondant aux informations à stocker dans la base de données.

### C — Contexte
Tu travailles dans le domaine du multimédia et des jeux vidéo.  
Ton entreprise a comme activité de vendre des appareils électroniques, des jeux vidéo, des CD et d’autres produits multimédias.

C’est une entreprise similaire à des enseignes comme Fnac, Micromania, Boulanger ou Darty.

### A — Contraintes additionnelles
Les règles de gestion doivent être présentées sous forme de liste à puces.  
Le dictionnaire de données doit contenir entre **25 et 35 données**.  
Chaque donnée doit être décrite avec sa signification, son type et sa taille.

### R — Références
Les informations doivent s’inspirer des sites suivants :

- https://www.fnac.com  
- https://www.micromania.fr  
- https://www.boulanger.com  
- https://www.darty.com  

### D — Rendement désiré
1. Une liste de règles de gestion sous forme de liste à puces.
2. Un dictionnaire de données présenté sous forme de tableau avec les colonnes suivantes :
   - signification de la donnée
   - type
   - taille en nombre de caractères ou de chiffres.

### O — Objectif
Fournir toutes les informations nécessaires pour concevoir ensuite le **Modèle Conceptuel de Données (MCD)** du système.

---

# 3. Règles de gestion

- Un produit est identifié par un identifiant unique.
- Un produit possède un nom, un prix et une description.
- Un produit appartient à une catégorie.
- Une catégorie peut contenir plusieurs produits.
- Un produit est fabriqué par une marque.
- Une marque peut fabriquer plusieurs produits.
- Un client peut acheter plusieurs produits.
- Une commande est passée par un seul client.
- Un client peut passer plusieurs commandes.
- Une commande contient un ou plusieurs produits.
- Chaque produit dans une commande possède une quantité.
- Une commande possède une date de commande.
- Une commande possède un montant total.
- Une commande possède un statut (validée, en cours, annulée).
- Un paiement est associé à une commande.
- Un paiement possède un mode de paiement.
- Un produit possède un stock disponible.
- Un produit peut être vendu dans plusieurs magasins.
- Un magasin possède un nom, une adresse et une ville.
- Un magasin peut vendre plusieurs produits.

---

# 4. Dictionnaire de données

| Signification de la donnée | Type | Taille |
|---|---|---|
| identifiant du produit | INT | 10 |
| nom du produit | VARCHAR | 100 |
| description du produit | VARCHAR | 255 |
| prix du produit | DECIMAL | 10 |
| stock du produit | INT | 10 |
| identifiant de la catégorie | INT | 10 |
| nom de la catégorie | VARCHAR | 100 |
| identifiant de la marque | INT | 10 |
| nom de la marque | VARCHAR | 100 |
| pays d’origine de la marque | VARCHAR | 50 |
| identifiant du client | INT | 10 |
| nom du client | VARCHAR | 50 |
| prénom du client | VARCHAR | 50 |
| email du client | VARCHAR | 100 |
| téléphone du client | VARCHAR | 15 |
| adresse du client | VARCHAR | 150 |
| identifiant de la commande | INT | 10 |
| date de commande | DATE | 10 |
| montant total de la commande | DECIMAL | 10 |
| statut de la commande | VARCHAR | 30 |
| identifiant du produit dans la commande | INT | 10 |
| quantité commandée | INT | 10 |
| identifiant du paiement | INT | 10 |
| mode de paiement | VARCHAR | 30 |
| date du paiement | DATE | 10 |
| identifiant du magasin | INT | 10 |
| nom du magasin | VARCHAR | 100 |
| adresse du magasin | VARCHAR | 150 |
| ville du magasin | VARCHAR | 50 |
| stock du produit dans un magasin | INT | 10 |

---

# 5. Modèle Conceptuel de Données (MCD)

Le MCD sera réalisé à l’aide d’un outil de modélisation tel que **Looping**.

Le modèle devra représenter :
- les entités
- les associations
- les attributs
- les identifiants
- les cardinalités

Une image du MCD sera ajoutée ci-dessous :
<img width="1305" height="589" alt="555294420-d013722f-2ea1-4621-bc75-09385705d2f6-2" src="https://github.com/user-attachments/assets/2b3745c9-e8c5-4226-967e-f618100eb5ba" />
