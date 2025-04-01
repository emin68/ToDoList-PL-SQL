
INSERT INTO Utilisateur (
  ref_utilisateur, login, mot_de_passe, score, nom, prenom,
  adresse, pays, date_de_naissance, date_d_inscription, nom_programme
) 
VALUES (
  1, 'jdoe_23', 'MotDePasse123', 103, 'Doe', 'John',
  'johndoe@example.com', 'France', TO_DATE('1990-01-15', 'YYYY-MM-DD'), TO_DATE('2020-03-15', 'YYYY-MM-DD'),
  'ProgrammeA'
);


INSERT INTO Utilisateur (
  ref_utilisateur, login, mot_de_passe, score, nom, prenom,
  adresse, pays, date_de_naissance, date_d_inscription, nom_programme
) 
VALUES (
  2, 'msmith_45', 'PassWord789', 85, 'Smith', 'Michael',
  'michaelsmith@example.com', 'USA', TO_DATE('1985-06-20', 'YYYY-MM-DD'), TO_DATE('2019-11-05', 'YYYY-MM-DD'),
  'ProgrammeB'
);


INSERT INTO Utilisateur (
  ref_utilisateur, login, mot_de_passe, score, nom, prenom,
  adresse, pays, date_de_naissance, date_d_inscription, nom_programme
) 
VALUES (
  4, 'klee_99', 'SecurePwd456', 78, 'Lee', 'Katherine',
  'katherinelee@example.com', 'Australia', TO_DATE('1980-03-25', 'YYYY-MM-DD'), TO_DATE('2018-07-08', 'YYYY-MM-DD'),
  'ProgrammeD'
);


INSERT INTO Utilisateur (
  ref_utilisateur, login, mot_de_passe, score, nom, prenom,
  adresse, pays, date_de_naissance, date_d_inscription, nom_programme
) 
VALUES (
  6, 'jbrown_89', 'SafePwd123', 88, 'Brown', 'James',
  'jamesbrown@example.com', 'Germany', TO_DATE('1990-08-05', 'YYYY-MM-DD'), TO_DATE('2017-04-22', 'YYYY-MM-DD'),
  'ProgrammeF'
);

-- Utilisateur 7
INSERT INTO Utilisateur (
  ref_utilisateur, login, mot_de_passe, score, nom, prenom,
  adresse, pays, date_de_naissance, date_d_inscription, nom_programme
) 
VALUES (
  7, 'pierre_78', 'MotDePasse123', 92, 'Pierre', 'Jean',
  'jeanpierre@example.com', 'France', TO_DATE('1992-03-15', 'YYYY-MM-DD'), TO_DATE('2021-06-10', 'YYYY-MM-DD'),
  'ProgrammeC'
);

INSERT INTO Utilisateur (
  ref_utilisateur, login, mot_de_passe, score, nom, prenom,
  adresse, pays, date_de_naissance, date_d_inscription, nom_programme
) 
VALUES (
  8, 'martin_61', 'SecurePwd456', 78, 'Martin', 'Lucie',
  'luciemartin@example.com', 'France', TO_DATE('1961-08-25', 'YYYY-MM-DD'), TO_DATE('2018-04-22', 'YYYY-MM-DD'),
  'ProgrammeD'
);


INSERT INTO Utilisateur (
  ref_utilisateur, login, mot_de_passe, score, nom, prenom,
  adresse, pays, date_de_naissance, date_d_inscription, nom_programme
) 
VALUES (
  9, 'dupont_90', 'SafePwd123', 88, 'Dupont', 'Alice',
  'alicedupont@example.com', 'France', TO_DATE('1990-12-05', 'YYYY-MM-DD'), TO_DATE('2017-10-15', 'YYYY-MM-DD'),
  'ProgrammeE'
);


INSERT INTO Utilisateur (
  ref_utilisateur, login, mot_de_passe, score, nom, prenom,
  adresse, pays, date_de_naissance, date_d_inscription, nom_programme
) 
VALUES (
  3, 'louis_75', 'StrongPwd789', 95, 'Louis', 'Sophie',
  'sophielouis@example.com', 'France', TO_DATE('1975-05-18', 'YYYY-MM-DD'), TO_DATE('2016-02-28', 'YYYY-MM-DD'),
  'ProgrammeF'
);


INSERT INTO Tache (ref_tache) VALUES (10);
INSERT INTO Tache (ref_tache) VALUES (11);
INSERT INTO Tache (ref_tache) VALUES (12);
INSERT INTO Tache (ref_tache) VALUES (13);
INSERT INTO Tache (ref_tache) VALUES (14);
INSERT INTO Tache (ref_tache) VALUES (15);
INSERT INTO Tache (ref_tache) VALUES (16);
INSERT INTO Tache (ref_tache) VALUES (17);
INSERT INTO Tache (ref_tache) VALUES (18);
INSERT INTO Tache (ref_tache) VALUES (19);
INSERT INTO Tache (ref_tache) VALUES (20);
INSERT INTO Tache (ref_tache) VALUES (21);
INSERT INTO Tache (ref_tache) VALUES (22);
INSERT INTO Tache (ref_tache) VALUES (23);
INSERT INTO Tache (ref_tache) VALUES (24);


INSERT INTO Liste_tache (ref_liste, nom_categorie, ref_utilisateur) VALUES (30, 'Liste A', 1);
INSERT INTO Liste_tache (ref_liste, nom_categorie, ref_utilisateur) VALUES (31, 'Liste B', 2);
INSERT INTO Liste_tache (ref_liste, nom_categorie, ref_utilisateur) VALUES (32, 'Liste C', 1);
INSERT INTO Liste_tache (ref_liste, nom_categorie, ref_utilisateur) VALUES (33, 'Liste D', 6);
INSERT INTO Liste_tache (ref_liste, nom_categorie, ref_utilisateur) VALUES (34, 'Liste E', 4);


INSERT INTO Tache_en_cours (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  10, 'Tâche en cours 1', 'Description de la tâche en cours 1', 2, 'https://exemple.com',
  TO_TIMESTAMP('2024-01-10 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'En cours', 'Categorie A', 40, 1, NULL
);
INSERT INTO Tache_en_cours (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  11, 'Tâche en cours 2', 'Description de la tâche en cours 2', 1, 'https://exemple.com',
  TO_TIMESTAMP('2024-01-15 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'En cours', 'Categorie B', 43, 2, NULL
);

INSERT INTO Tache_en_cours (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  13, 'Tâche en cours 3', 'Description de la tâche en cours 3', 1, 'https://exemple.com',
  TO_TIMESTAMP('2024-01-20 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'En cours', 'Categorie B', 43, 7, NULL
);
INSERT INTO Tache_en_cours (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  14, 'Tâche en cours 4', 'Description de la tâche en cours 4', 3, 'https://exemple.com',
  TO_TIMESTAMP('2024-02-05 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'En cours', 'Categorie C', 44, 8, '2024-05-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'
);
INSERT INTO Tache_en_cours (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  15, 'Tâche en cours 5', 'Description de la tâche en cours 5', 2, 'https://exemple.com',
  TO_TIMESTAMP('2024-02-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'En cours', 'Categorie A', 43, 9, NULL
);
INSERT INTO Tache_en_cours (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  16, 'Tâche en cours 6', 'Description de la tâche en cours 6', 1, 'https://exemple.com',
  TO_TIMESTAMP('2024-02-15 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'En cours', 'Categorie B', 42, 3, '2024-05-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'
);
INSERT INTO Tache_en_cours (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  17, 'Tâche en cours 7', 'Description de la tâche en cours 7', 3, 'https://exemple.com',
  TO_TIMESTAMP('2024-03-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'En cours', 'Categorie C', 41, 7, '2024-05-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'
);
INSERT INTO Tache_en_cours (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  18, 'Tâche en cours 8', 'Description de la tâche en cours 8', 2, 'https://exemple.com',
  TO_TIMESTAMP('2024-03-05 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'En cours', 'Categorie A', 44, 9, NULL
);
INSERT INTO Tache_en_cours (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  19, 'Tâche en cours 9', 'Description de la tâche en cours 9', 1, 'https://exemple.com',
  TO_TIMESTAMP('2024-03-10 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'En cours', 'Categorie B', 43, 3, NULL
);





INSERT INTO Tache_fini (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  12, 'Tâche terminée 1', 'Description de la tâche terminée 1', 3, 'https://exemple.com',
  TO_TIMESTAMP('2024-01-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Terminée', 'Categorie C', 41, 4, TO_TIMESTAMP('2024-01-05 09:45:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO Tache_fini (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  20, 'Tâche terminée 2', 'Description de la tâche terminée 2', 2, 'https://exemple.com',
  TO_TIMESTAMP('2024-03-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Terminée', 'Categorie A', 41, 4, TO_TIMESTAMP('2024-03-15 09:45:00', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO Tache_fini (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  21, 'Tâche terminée 3', 'Description de la tâche terminée 3', 1, 'https://exemple.com',
  TO_TIMESTAMP('2024-03-20 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Terminée', 'Categorie B', 42, 1, TO_TIMESTAMP('2024-01-05 12:15:00', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO Tache_fini (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  22, 'Tâche terminée 4', 'Description de la tâche terminée 4', 3, 'https://exemple.com',
  TO_TIMESTAMP('2024-03-25 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Terminée', 'Categorie C', 43, 2, TO_TIMESTAMP('2024-01-05 14:45:00', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO Tache_fini (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  23, 'Tâche terminée 5', 'Description de la tâche terminée 5', 2, 'https://exemple.com',
  TO_TIMESTAMP('2024-03-30 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Terminée', 'Categorie A', 44, 7, TO_TIMESTAMP('2024-01-05 17:15:00', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO Tache_fini (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  24, 'Tâche terminée 6', 'Description de la tâche terminée 6', 1, 'https://exemple.com',
  TO_TIMESTAMP('2024-04-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Terminée', 'Categorie B', 42, 9, TO_TIMESTAMP('2024-01-05 10:45:00', 'YYYY-MM-DD HH24:MI:SS')
);


INSERT INTO Periodicite (ref_periodicite, date_debut, date_fin, periode) VALUES (40, TIMESTAMP '2024-01-01 00:00:00', TIMESTAMP '2024-01-07 23:59:59', INTERVAL '1' DAY);
INSERT INTO Periodicite (ref_periodicite, date_debut, date_fin, periode) VALUES (41, TIMESTAMP '2024-02-01 00:00:00', TIMESTAMP '2024-02-29 23:59:59', INTERVAL '1' DAY);
-- Insertion dans la table Periodicite
INSERT INTO Periodicite (ref_periodicite, date_debut, date_fin, periode) VALUES (42, TIMESTAMP '2024-05-01 00:00:00', NULL, NULL);
INSERT INTO Periodicite (ref_periodicite, date_debut, date_fin, periode) VALUES (43, TIMESTAMP '2024-06-01 00:00:00', NULL, NULL);
INSERT INTO Periodicite (ref_periodicite, date_debut, date_fin, periode) VALUES (44, TIMESTAMP '2024-07-01 00:00:00', NULL, NULL);

INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (30, 10);
INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (31, 11);
INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (32, 12);
INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (33, 10);
INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (34, 11);

INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Projet_A', 1);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Projet_B', 2);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Projet_C', 1);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Projet_D', 6);
INSERT INTO Travaille (nom_projet, ref_utilisateur) VALUES ('Projet_E', 4);


INSERT INTO Score_categorie_tache (ref_score_categorie_tache, termine, score, nom_categorie)
VALUES ('10', 'O', 10, 'Categorie A');

INSERT INTO Score_categorie_tache (ref_score_categorie_tache, termine, score, nom_categorie)
VALUES ('11', 'X', 5, 'Categorie B');

INSERT INTO Score_categorie_tache (ref_score_categorie_tache, termine, score, nom_categorie)
VALUES ('12', 'O', 8, 'Categorie C');


INSERT INTO Comporte (nom_programme, ref_score_categorie_tache) VALUES ('ProgrammeA', '10');
INSERT INTO Comporte (nom_programme, ref_score_categorie_tache) VALUES ('ProgrammeB', '11');
INSERT INTO Comporte (nom_programme, ref_score_categorie_tache) VALUES ('ProgrammeC', '12');


INSERT INTO Contient (nom_projet, ref_liste) VALUES ('Projet_A', 30);
INSERT INTO Contient (nom_projet, ref_liste) VALUES ('Projet_B', 31);
INSERT INTO Contient (nom_projet, ref_liste) VALUES ('Projet_C', 32);
INSERT INTO Contient (nom_projet, ref_liste) VALUES ('Projet_D', 33);
INSERT INTO Contient (nom_projet, ref_liste) VALUES ('Projet_E', 34);


INSERT INTO Depend_de (ref_tache_1, ref_tache_2) VALUES (10, 11);
INSERT INTO Depend_de (ref_tache_1, ref_tache_2) VALUES (11, 12);
INSERT INTO Depend_de (ref_tache_1, ref_tache_2) VALUES (12, 10);
INSERT INTO Depend_de (ref_tache_1, ref_tache_2) VALUES (10, 12);


INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (1, 10);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (2, 11);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (1, 12);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (6, 10);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (4, 11);

-------pour le select 1------------------------------------------------------------------------------------


INSERT INTO Liste_tache (ref_liste, nom_categorie, ref_utilisateur) VALUES (35, 'Liste F', 3);
INSERT INTO Liste_tache (ref_liste, nom_categorie, ref_utilisateur) VALUES (36, 'Liste G', 7);


--liste f
INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (35, 23);
INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (35, 24);
INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (35, 13);
INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (35, 14);
INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (35, 15);

--liste g
INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (36, 16);
INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (36, 17);
INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (36, 18);
INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (36, 19);
INSERT INTO Tache_appartenant_a_liste (ref_liste, ref_tache) VALUES (36, 20);


INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (3, 23);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (7, 24);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (8, 13);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (1, 14);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (9, 15);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (3, 16);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (7, 17);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (8, 18);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (2, 19);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (6, 20);





-- pl/sql 1 ------------------------------------------------------------------------------------




INSERT INTO Tache (ref_tache) VALUES (25);
INSERT INTO Tache (ref_tache) VALUES (26);
INSERT INTO Tache (ref_tache) VALUES (27);



INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (7, 25);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (9, 26);
INSERT INTO Est_assigne (ref_utilisateur, ref_tache) VALUES (7, 27);


INSERT INTO Score_categorie_tache (ref_score_categorie_tache, termine, score, nom_categorie)
VALUES ('25', 'O', 12, 'Categorie A');

INSERT INTO Score_categorie_tache (ref_score_categorie_tache, termine, score, nom_categorie)
VALUES ('26', 'X', 8, 'Categorie B');

INSERT INTO Score_categorie_tache (ref_score_categorie_tache, termine, score, nom_categorie)
VALUES ('27', 'X', 10, 'Categorie B');


INSERT INTO Comporte (nom_programme, ref_score_categorie_tache) VALUES ('Programme A', '25');
INSERT INTO Comporte (nom_programme, ref_score_categorie_tache) VALUES ('Programme B', '26');
INSERT INTO Comporte (nom_programme, ref_score_categorie_tache) VALUES ('Programme C', '27');

INSERT INTO Tache_fini (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  25, 'Tâche terminée 25', 'Description de la tâche terminée 75', 2, 'https://exemple.com',
  TO_TIMESTAMP('2024-03-30 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Terminée', 'Categorie A', 44, 7, TO_TIMESTAMP('2024-01-06 17:15:00', 'YYYY-MM-DD HH24:MI:SS')
);

INSERT INTO Tache_en_cours (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  26, 'Tâche en cours 27', 'Description de la tâche en cours 76', 1, 'https://exemple.com',
  TO_TIMESTAMP('2024-01-20 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'En cours', 'Categorie B', 43, 7, NULL
);
INSERT INTO Tache_en_cours (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  27, 'Tâche en cours 27', 'Description de la tâche en cours 77', 1, 'https://exemple.com',
  TO_TIMESTAMP('2024-01-20 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'En cours', 'Categorie B', 43, 7, NULL
);

