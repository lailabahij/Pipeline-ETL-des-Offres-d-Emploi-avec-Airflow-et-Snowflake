# 🚀 Job Market Analytics – Data Engineering Pipeline

![Python](https://img.shields.io/badge/Python-3.12-blue?logo=python)
![Snowflake](https://img.shields.io/badge/Snowflake-Data%20Warehouse-29B5E8?logo=snowflake)
![dbt](https://img.shields.io/badge/dbt-Transformation-FF694B?logo=dbt)
![Airflow](https://img.shields.io/badge/Airflow-Orchestration-017CEE?logo=apacheairflow)
![Docker](https://img.shields.io/badge/Docker-Containers-2496ED?logo=docker)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi)
![SQL](https://img.shields.io/badge/SQL-Data-blue?logo=mysql)
![GitHub](https://img.shields.io/badge/GitHub-Version_Control-black?logo=github)
![GitHub last commit](https://img.shields.io/github/last-commit/lailabahij/Pipeline-ETL-des-Offres-d-Emploi-avec-Airflow-et-Snowflake)
![GitHub repo size](https://img.shields.io/github/repo-size/lailabahij/Pipeline-ETL-des-Offres-d-Emploi-avec-Airflow-et-Snowflake)
![GitHub stars](https://img.shields.io/github/stars/lailabahij/Pipeline-ETL-des-Offres-d-Emploi-avec-Airflow-et-Snowflake?style=social)
![GitHub license](https://img.shields.io/github/license/lailabahij/Pipeline-ETL-des-Offres-d-Emploi-avec-Airflow-et-Snowflake)
# 📑 Table des matières

- [📖 Présentation du projet](#-présentation-du-projet)
- [❓ Questions auxquelles répond le projet](#-questions-auxquelles-répond-le-projet)
- [🎯 Problématique](#-problématique)
- [🚀 Fonctionnalités principales](#-fonctionnalités-principales)
- [🏗️ Architecture du projet](#️-architecture-du-projet)
- [🏛️ Architecture Medallion](#️-architecture-medallion)
- [⭐ Modèle de données](#-modèle-de-données)
- [🌬️ Apache Airflow](#️-apache-airflow)
- [❄️ Snowflake](#️-snowflake)
- [📂 Structure du projet](#-structure-du-projet)
- [🛠️ Technologies utilisées](#️-technologies-utilisées)
- [📊 Tableau de bord Power BI](#-tableau-de-bord-power-bi)
- [⚙️ Installation](#️-installation)
- [📸 Captures d'écran](#-captures-décran)
- [📋 Gestion du projet avec Jira](#-gestion-du-projet-avec-jira)
- [🚧 Difficultés rencontrées](#-difficultés-rencontrées)
- [🔮 Améliorations futures](#-améliorations-futures)
- [👤 Auteur](#-auteur)
- [📄 Licence](#-licence)
  ---
## 📖 Présentation du projet

Job Market Analytics est un projet de Data Engineering permettant d'analyser le marché de l'emploi à partir d'un jeu de données LinkedIn.

Le projet met en place un pipeline ETL moderne permettant de collecter, charger, nettoyer, transformer et modéliser les données avant leur visualisation dans Power BI.

Il s'adresse principalement aux recruteurs, analystes de données, responsables RH et décideurs souhaitant analyser les tendances du marché de l'emploi.

L'objectif principal est de produire des tableaux de bord interactifs permettant d'analyser les offres d'emploi, les entreprises, les compétences et les salaires.

---
# 📦 Jeu de données

Le projet est basé sur le jeu de données **LinkedIn Job Postings Dataset**.

Il contient notamment :

- Offres d'emploi
- Entreprises
- Salaires
- Compétences
- Secteurs d'activité
- Localisations

---

# ❓ Questions auxquelles répond le projet

Ce projet permet de répondre aux questions suivantes :

- Quels secteurs d'activité recrutent le plus ?
- Quelles entreprises publient le plus d'offres d'emploi ?
- Quelles sont les compétences les plus recherchées ?
- Quel est le salaire moyen selon le secteur d'activité ?
- Quel est le salaire moyen selon le niveau d'expérience ?
- Quel est le salaire moyen selon le type de contrat ?
- Quelles villes proposent les salaires les plus élevés ?
- Quelle est la répartition des offres entre télétravail et travail sur site ?
- Quels types de contrat sont les plus proposés ?
- Comment les offres d'emploi sont-elles réparties géographiquement ?

---
# 🎯 Problématique

Les données du marché de l'emploi sont souvent volumineuses, hétérogènes et difficiles à exploiter directement.

Les entreprises et les analystes ont besoin d'informations fiables pour identifier les tendances de recrutement, les compétences les plus demandées et les niveaux de salaire.

Ce projet propose un pipeline Data Engineering automatisé permettant de transformer les données brutes en données analytiques prêtes à être exploitées dans Power BI.

---

# 🚀 Fonctionnalités principales

Le projet permet de :

- Collecter les données du marché de l'emploi
- Charger automatiquement les données dans Snowflake
- Nettoyer et transformer les données avec dbt
- Construire une architecture Medallion (Bronze, Silver, Gold)
- Orchestrer le pipeline avec Apache Airflow
- Générer des tableaux de bord interactifs avec Power BI

---

# 🏗️ Architecture du projet

<img width="537" height="542" alt="image" src="https://github.com/user-attachments/assets/50b4003b-8ba3-4a2a-bc79-320fae54b6f6" />


---

# 🏛️ Architecture Medallion

# 🥉 Couche Bronze

Stockage des données brutes provenant des fichiers CSV.

# 🥈 Couche Silver

La couche **Silver** prépare les données issues de la couche Bronze afin de les rendre fiables et cohérentes pour les analyses.

Les principales opérations réalisées sont :

- Suppression des doublons
- Traitement des valeurs manquantes
- Normalisation des données
- Conversion des types de données
- Nettoyage des colonnes textuelles
- Standardisation des valeurs
- Préparation des données pour la couche Gold

## Modèles Silver

### 📂 Companies

| Modèle | Description |
|--------|-------------|
| **silver_companies.sql** | Nettoie et standardise les informations des entreprises. |
| **silver_company_industries.sql** | Associe chaque entreprise à son secteur d'activité. |
| **silver_company_specialities.sql** | Prépare les spécialités des entreprises. |
| **silver_employee_counts.sql** | Nettoie les données relatives au nombre d'employés. |

### 📂 Jobs

| Modèle | Description |
|--------|-------------|
| **silver_postings.sql** | Nettoie les offres d'emploi et standardise les informations principales. |
| **silver_benefits.sql** | Prépare les avantages proposés dans les offres. |
| **silver_job_industries.sql** | Associe les offres d'emploi aux secteurs d'activité. |
| **silver_job_skills.sql** | Associe les compétences demandées à chaque offre. |
| **silver_salaries.sql** | Nettoie et prépare les informations salariales. |

### 📂 Mappings

| Modèle | Description |
|--------|-------------|
| **silver_industries.sql** | Nettoie et normalise les secteurs d'activité. |
| **silver_skills.sql** | Nettoie et standardise les compétences. |

---

## 📸 Structure de la couche Silver

<img width="368" height="329" alt="image" src="https://github.com/user-attachments/assets/53c15e19-d190-4fef-992c-dfae0ff2abc8" />


*Organisation des modèles SQL de la couche Silver.*

# 🥇 Couche Gold

Création des modèles métiers :

- Dimensions
- Tables de faits
- Data Marts

---

# ⭐ Modèle de données 

Le projet est basé sur une **architecture Galaxy Schema (Fact Constellation)**.

Ce modèle est composé de plusieurs tables de faits partageant des dimensions communes, ce qui permet d'analyser les données selon différents axes métier.

## 📌 Dimensions

| Table | Description |
|--------|-------------|
| **DIM_COMPANIES** | Informations sur les entreprises (nom, localisation, taille, secteur). |
| **DIM_JOBS** | Informations sur les offres d'emploi (titre, type de contrat, niveau d'expérience, télétravail). |
| **DIM_DATE** | Dimension temporelle (date, mois, trimestre, année). |
| **DIM_INDUSTRIES** | Secteurs d'activité des entreprises. |
| **DIM_SKILLS** | Compétences demandées dans les offres d'emploi. |

## 📌 Tables de faits

| Table | Description |
|--------|-------------|
| **FACT_JOB_POSTINGS** | Contient les mesures liées aux offres d'emploi (nombre d'offres, entreprises, localisation, etc.). |
| **FACT_JOB_SALARIES** | Contient les mesures liées aux salaires (minimum, maximum, moyen, devise). |

## 📌 Data Marts

| Table | Description |
|--------|-------------|
| **MART_COMPANY_HIRING_ACTIVITY** | Analyse de l'activité de recrutement par entreprise. |
| **MART_SALARY_INSIGHTS** | Analyse des salaires par secteur, entreprise, ville et niveau d'expérience. |
| **MART_SKILL_DEMAND** | Analyse des compétences les plus demandées sur le marché de l'emploi. |

---

## 📊 Schéma Galaxy

Le diagramme ci-dessous illustre le modèle Galaxy utilisé dans le projet.

<img width="356" height="310" alt="image" src="https://github.com/user-attachments/assets/c4684bb2-0098-41ca-949b-c93c885435a9" />

---
## 🌬️ Apache Airflow

Le pipeline ETL est orchestré avec Apache Airflow. Le DAG automatise le chargement des données, les transformations dbt et les différentes étapes du pipeline.

<img width="1894" height="702" alt="image" src="https://github.com/user-attachments/assets/48ea0c56-0566-4634-a0b7-ee4ede9eb658" />

---
## ❄️ Snowflake

Les données sont stockées dans Snowflake selon une architecture Medallion composée des couches Bronze, Silver et Gold.

<img width="357" height="779" alt="image" src="https://github.com/user-attachments/assets/0fb441f4-aa2e-48de-93a9-cb3253b62e23" />

---
## 🌿 Modèles dbt

Organisation des modèles Bronze, Silver et Gold.

<img width="324" height="379" alt="image" src="https://github.com/user-attachments/assets/9871be5c-36f0-47a7-8588-676da581032f" />


---

# 📂 Structure du projet

```text
full_rouge
│
├── airflow
│   ├── dags
│   ├── plugins
│   ├── logs
│   ├── Dockerfile
│   └── docker-compose.yml
│
├── data
│   ├── companies
│   ├── jobs
│   ├── mappings
│   └── postings.csv
│
├── docs
│
├── job_market
│   ├── analyses
│   ├── logs
│   ├── macros
│   └── models
│       ├── bronze
│       │
│       ├── silver
│       │   ├── companies
│       │   │   ├── silver_companies.sql
│       │   │   ├── silver_company_industries.sql
│       │   │   ├── silver_company_specialities.sql
│       │   │   └── silver_employee_counts.sql
│       │   │
│       │   ├── jobs
│       │   │   ├── silver_benefits.sql
│       │   │   ├── silver_job_industries.sql
│       │   │   ├── silver_job_skills.sql
│       │   │   └── silver_salaries.sql
│       │   │
│       │   ├── mappings
│       │   │   ├── silver_industries.sql
│       │   │   └── silver_skills.sql
│       │   │
│       │   └── silver_postings.sql
│       │
│       └── gold
│           ├── dimensions
│           │   ├── dim_companies.sql
│           │   ├── dim_date.sql
│           │   ├── dim_industries.sql
│           │   ├── dim_jobs.sql
│           │   └── dim_skills.sql
│           │
│           ├── facts
│           │   ├── fact_job_postings.sql
│           │   └── fact_job_salaries.sql
│           │
│           └── marts
│               ├── mart_company_hiring_activity.sql
│               ├── mart_salary_insights.sql
│               └── mart_skill_demand.sql
│
├── notebooks
│   ├── 01_exploration.ipynb
│   └── 02_data_quality.ipynb
│
├── snapshots
├── seeds
├── target
├── tests
├── requirements.txt
├── dbt_project.yml
└── README.md
├── power_bi
│   └── Job_Market_Analytics.pbix
├── screenshots
├── LICENSE
```

---

# 🛠️ Technologies utilisées

| Technologie | Utilisation |
|-------------|-------------|
| Python | Extraction et chargement des données |
| Snowflake | Data Warehouse |
| SQL | Manipulation des données |
| dbt | Transformation des données |
| Apache Airflow | Orchestration du pipeline |
| Docker | Conteneurisation |
| Power BI | Visualisation |
|Jira | Gestion du projet, planification des sprints et suivi des tâches |
| Git & GitHub | Gestion des versions |
| Jupyter Notebook | Analyse exploratoire |

---

# 📊 Tableau de bord Power BI

Le dashboard est composé de plusieurs pages :

## 📌 Vue d'ensemble

- Nombre d'offres
- Nombre d'entreprises
- Salaire moyen
- Nombre de secteurs
- Nombre de compétences

---

## 📌 Analyse des offres

- Top secteurs
- Répartition des contrats
- Répartition géographique
- Entreprises qui recrutent
- Télétravail
- Niveau d'expérience

---

## 📌 Analyse des salaires

- Salaire moyen par secteur
- Salaire moyen par entreprise
- Salaire moyen par expérience
- Salaire moyen par type de contrat
- Top villes

---

## 📌 Analyse des entreprises

- Entreprises qui recrutent
- Taille des entreprises
- Répartition géographique
- Nombre d'employés
- Secteurs

---

## 📌 Analyse des compétences

- Compétences les plus demandées
- Répartition des compétences
- Entreprises recrutant ces compétences
- Secteurs concernés
- Répartition par type de contrat

---

# ⚙️ Installation

Suivez les étapes ci-dessous pour installer et exécuter le projet en local.

---

## 📋 Prérequis

Avant de commencer, assurez-vous d'avoir installé les outils suivants :

- Python 3.12 ou version supérieure
- Git
- Docker Desktop
- Snowflake (compte et entrepôt configurés)
- dbt Core et dbt-snowflake
- Power BI Desktop
- Visual Studio Code (recommandé)

Vérifiez les versions installées :

```bash
python --version
git --version
docker --version
docker compose version
dbt --version
```

---

## 📥 Cloner le dépôt

Clonez le projet depuis GitHub :

```bash
git clone https://github.com/lailabahij/Pipeline-ETL-des-Offres-d-Emploi-avec-Airflow-et-Snowflake.git
```

---

## 📂 Accéder au projet

```bash
cd Pipeline-ETL-des-Offres-d-Emploi-avec-Airflow-et-Snowflake
```

---

## 🐍 Créer un environnement virtuel (recommandé)

Windows :

```bash
python -m venv venv
```

Activer l'environnement :

PowerShell

```powershell
.\venv\Scripts\Activate.ps1
```

Invite de commandes (CMD)

```cmd
venv\Scripts\activate
```

---

## 📦 Installer les dépendances

```bash
pip install -r requirements.txt
```

Vérifier les packages installés :

```bash
pip list
```

---

## ⚙️ Configurer les variables d'environnement

Créer un fichier `.env` à la racine du projet.

Exemple :

```env
SNOWFLAKE_ACCOUNT=your_account

SNOWFLAKE_USER=your_user

SNOWFLAKE_PASSWORD=your_password

SNOWFLAKE_DATABASE=JOB_MARKET_DB

SNOWFLAKE_SCHEMA=BRONZE

SNOWFLAKE_WAREHOUSE=COMPUTE_WH

SNOWFLAKE_ROLE=ACCOUNTADMIN
```

⚠️ Ne jamais publier ce fichier sur GitHub.

---

## 🐳 Démarrer Docker et Airflow

Depuis le dossier `airflow`, lancer les conteneurs :

```bash
cd airflow
```

```bash
docker compose up -d
```

Vérifier que tous les services sont démarrés :

```bash
docker compose ps
```

Pour afficher les journaux :

```bash
docker compose logs
```

Pour arrêter les conteneurs :

```bash
docker compose down
```

---

## 🌬️ Accéder à Apache Airflow

Ouvrir votre navigateur :

```
http://localhost:8081
```

Identifiants par défaut :

```
Nom d'utilisateur : airflow

Mot de passe : airflow
```

---

## ❄️ Exécuter les modèles dbt

Depuis le dossier `job_market` :

```bash
cd ../job_market
```

Vérifier la connexion à Snowflake :

```bash
dbt debug
```

Exécuter tous les modèles :

```bash
dbt run
```

Exécuter les tests :

```bash
dbt test
```

Générer la documentation dbt :

```bash
dbt docs generate
```

Lancer la documentation :

```bash
dbt docs serve
```

---

## 📊 Ouvrir le tableau de bord Power BI

Après l'exécution complète du pipeline :

1. Ouvrir **Power BI Desktop**.
2. Ouvrir le fichier `.pbix` du projet.
3. Actualiser les données.
4. Explorer les différents tableaux de bord :
   - Vue d'ensemble
   - Analyse des offres
   - Analyse des salaires
   - Analyse des entreprises
   - Analyse des compétences

---

## ✅ Vérification

Si toutes les étapes se sont déroulées correctement :

- ✅ Les données sont chargées dans Snowflake.
- ✅ Les modèles dbt Bronze, Silver et Gold sont créés.
- ✅ Le DAG Airflow est opérationnel.
- ✅ Les tableaux de bord Power BI affichent les données.
---

# 📸 Captures d'écran

## 📊 Vue d'ensemble

Cette page présente les principaux indicateurs (KPI) du marché de l'emploi, notamment le nombre d'offres, le nombre d'entreprises, le salaire moyen, le nombre de secteurs d'activité et le nombre de compétences.

<img width="1244" height="807" alt="Vue d'ensemble" src="https://github.com/user-attachments/assets/e2e0df73-8c80-4d68-92c2-d4f4f2960660" />

---

## 💼 Analyse des offres

Cette page permet d'analyser les offres d'emploi selon plusieurs dimensions, telles que les secteurs d'activité, les types de contrat, les niveaux d'expérience, la répartition géographique et les offres en télétravail.

<img width="1072" height="803" alt="Analyse des offres" src="https://github.com/user-attachments/assets/ee6aa25d-489b-4fc2-85f2-f7f6ea8b1688" />

---

## 💰 Analyse des salaires

Cette page présente une analyse détaillée des salaires en fonction des secteurs d'activité, des entreprises, des niveaux d'expérience, des types de contrat et des localisations.

<img width="1128" height="804" alt="Analyse des salaires" src="https://github.com/user-attachments/assets/240e1105-9418-4f0b-a0df-8ceb0d4b1dd4" />

---

## 🏢 Analyse des entreprises

Cette page met en évidence les entreprises les plus actives sur le marché de l'emploi, leur taille, leur secteur d'activité, leur localisation ainsi que leur activité de recrutement.

<img width="1072" height="808" alt="Analyse des entreprises" src="https://github.com/user-attachments/assets/c0a96058-f4a3-42f1-9a88-9c0d1fa6e5b4" />

---

## 🛠️ Analyse des compétences

Cette page présente les compétences les plus recherchées par les employeurs, leur répartition par secteur d'activité ainsi que les entreprises qui recrutent ces compétences.

<img width="1076" height="807" alt="Analyse des compétences" src="https://github.com/user-attachments/assets/9b40c2c2-8600-4acb-996d-77efc8865d9e" />
---
# 📁 Fichier Power BI

Le tableau de bord Power BI est disponible dans :

```text
power_bi/
└── Job_Market_Analytics.pbix
```
---
# 📋 Gestion du projet avec Jira

Le projet a été organisé selon une approche Agile en utilisant **Jira** pour :

- Planifier les sprints
- Créer et suivre les User Stories
- Organiser les tâches de développement
- Suivre l'avancement du projet

<img width="1591" height="604" alt="image" src="https://github.com/user-attachments/assets/8c356f74-1adc-41bd-b19a-6083126979d3" />
🔗 **Jira Board**

👉 https://lailabahij336.atlassian.net/jira/software/projects/PEDODAAES/boards/536/timeline
--- 
# 👩‍💻 Contribution personnelle

Dans ce projet, j'ai réalisé l'ensemble des tâches suivantes :

- Conception de l'architecture Data Engineering
- Développement du pipeline ETL en Python
- Chargement des données dans Snowflake
- Développement des modèles dbt Bronze, Silver et Gold
- Création des Dimensions, Facts et Data Marts
- Développement du DAG Apache Airflow
- Conception du tableau de bord Power BI
- Tests et validation du pipeline

---

# 🚧 Difficultés rencontrées

## Configuration Docker

### Problème

Les conteneurs Airflow ne démarraient pas correctement.

### Solution

Vérification de Docker Desktop, de WSL et du fichier docker-compose.yml.

### Ce que j'ai appris

Le fonctionnement des conteneurs Docker et l'orchestration avec Airflow.

---

## Connexion Snowflake

### Problème

Erreurs de connexion entre dbt et Snowflake.

### Solution

Configuration correcte du fichier profiles.yml et des variables d'environnement.

### Ce que j'ai appris

Le fonctionnement de dbt avec Snowflake.

---

# 🔮 Améliorations futures

Dans une prochaine version, le projet pourra être amélioré en :

- ajoutant des tests dbt automatiques ;
- mettant en place une intégration continue (CI/CD) avec GitHub Actions ;
- déployant le pipeline sur Microsoft Azure ;
- automatisant la mise à jour quotidienne des données ;
- enrichissant le tableau de bord avec des prévisions basées sur le Machine Learning.

Ces améliorations permettront d'améliorer la qualité, l'automatisation et l'évolutivité du projet.

---
# 🙏 Remerciements

Je remercie toutes les personnes et les communautés qui ont contribué, directement ou indirectement, à la réalisation de ce projet.

Mes remerciements s'adressent notamment à :

- LinkedIn pour le jeu de données utilisé dans ce projet.
- La communauté **dbt** pour sa documentation et ses bonnes pratiques.
- Les équipes **Snowflake**, **Apache Airflow** et **Power BI** pour leurs outils et leur documentation.
- Les communautés **Python** et **GitHub** pour leurs ressources open source.
- Mes formateurs et encadrants pour leurs conseils et leur accompagnement tout au long de ce projet.
---
# 🧠 Compétences mises en œuvre

- Data Engineering
- ETL Development
- Python
- SQL
- Snowflake
- dbt
- Apache Airflow
- Docker
- Power BI
- Data Modeling
- Git & GitHub
- Jira
---
# 👤 Auteur

**Laila Bahij**

Data Analyst | Aspiring Data Engineer

Passionnée par le Data Engineering, le Cloud et la Business Intelligence.

---
# 🎉 Conclusion

Ce projet illustre la mise en œuvre d'un pipeline Data Engineering complet, depuis le chargement des données jusqu'à leur visualisation dans Power BI, en utilisant une architecture Medallion moderne avec Python, Snowflake, dbt et Apache Airflow.

---
# 📄 Licence

Ce projet est distribué sous la licence **MIT**.

Vous êtes libre d'utiliser, copier, modifier et distribuer ce projet, à condition de conserver la mention de copyright et le texte de la licence.

Consultez le fichier [LICENSE](LICENSE) pour le texte officiel de la licence.

---
# 📌 Statut du projet

✅ Projet terminé

Version : 1.0.0

