
--requete sql

--1)----------
CREATE INDEX idx_liste_tache_ref_utilisateur ON Liste_tache(ref_utilisateur);
CREATE INDEX idx_utilisateur_ref_utilisateur ON Utilisateur(ref_utilisateur);

SELECT DISTINCT LT.ref_liste, LT.nom_categorie, LT.ref_utilisateur
FROM Liste_tache LT
JOIN Utilisateur UT ON LT.ref_utilisateur = UT.ref_utilisateur
WHERE UT.pays = 'France'
AND LT.ref_liste IN (
    SELECT ref_liste
    FROM (
        SELECT ref_liste, COUNT(*) AS nombre_de_taches
        FROM Tache_appartenant_a_liste
        GROUP BY ref_liste
        HAVING COUNT(*) >= 5
    ) TAL
);



--2)----------

CREATE INDEX idx_comporte_ref_score_categorie_tache ON Comporte(ref_score_categorie_tache);
CREATE INDEX idx_score_categorie_tache_ref_score_categorie_tache ON Score_categorie_tache(ref_score_categorie_tache);
CREATE INDEX idx_tache_fini_nom_categorie ON Tache_fini(nom_categorie);

SELECT
    c.nom_programme,
    SUM(sct.score) AS total_points
FROM
    Comporte c
JOIN
    Score_categorie_tache sct ON c.ref_score_categorie_tache = sct.ref_score_categorie_tache
JOIN
    Tache_fini tf ON sct.nom_categorie = tf.nom_categorie
WHERE
    tf.statut = 'Terminée'
GROUP BY
    c.nom_programme
ORDER BY
    total_points DESC
FETCH FIRST 10 ROWS ONLY; -- Utilisation de FETCH FIRST pour limiter les résultats



--3)----------

CREATE INDEX idx_utilisateur_ref_utilisateur_te ON Tache_en_cours(ref_utilisateur);
CREATE INDEX idx_utilisateur_ref_utilisateur_tf ON Tache_fini(ref_utilisateur);

SELECT
  U.login,
  U.nom,
  U.prenom,
  U.adresse,
  COUNT(DISTINCT TE.ref_tache) + COUNT(DISTINCT TF.ref_tache) AS nombre_taches_total,
  COUNT(DISTINCT TE.ref_tache) AS nombre_taches_en_cours,
  COUNT(DISTINCT TF.ref_tache) AS nombre_taches_terminées
FROM
  Utilisateur U
LEFT JOIN
  Tache_en_cours TE ON U.ref_utilisateur = TE.ref_utilisateur
LEFT JOIN
  Tache_fini TF ON U.ref_utilisateur = TF.ref_utilisateur
GROUP BY
  U.login, U.nom, U.prenom, U.adresse, U.ref_utilisateur
ORDER BY
  U.login;



--4)----------

CREATE INDEX idx_tache_ref ON Tache(ref_tache);
CREATE INDEX idx_depend_de_ref_tache_2 ON Depend_de(ref_tache_2);

SELECT
  T.ref_tache,
  COUNT(DISTINCT DD.ref_tache_1) AS nombre_dependances
FROM
  Tache T
LEFT JOIN
  Depend_de DD ON T.ref_tache = DD.ref_tache_2
GROUP BY
  T.ref_tache
ORDER BY
  T.ref_tache;



--5)----------

CREATE INDEX idx_utilisateur_ref_tf ON Tache_fini(ref_utilisateur);
CREATE INDEX idx_score_categorie_tache_nom_categorie ON Score_categorie_tache(nom_categorie);
SELECT
    U.ref_utilisateur,
    U.login,
    U.nom,
    U.prenom,
    U.adresse,
    U.score,
    COALESCE(SUM(SC.score) OVER (PARTITION BY U.ref_utilisateur), 0) AS points_gagnes_semaine
FROM
    Utilisateur U
LEFT JOIN
    Tache_fini TF ON U.ref_utilisateur = TF.ref_utilisateur
LEFT JOIN
    Score_categorie_tache SC ON TF.nom_categorie = SC.nom_categorie AND TF.statut = SC.termine
WHERE
    TF.date_realisation >= TRUNC(SYSDATE, 'IW') -- début de la semaine en cours
    AND TF.date_realisation < TRUNC(SYSDATE, 'IW') + 7 -- fin de la semaine en cours
ORDER BY
    points_gagnes_semaine DESC
FETCH FIRST 10 ROWS ONLY;
------------------------------------
pour changer la date au 5 janvier 2024 
UPDATE Tache_fini
SET date_realisation = TO_TIMESTAMP('2024-01-05 09:45:00', 'YYYY-MM-DD HH24:MI:SS')
WHERE ref_tache = 20;

UPDATE Tache_fini
SET date_realisation = TO_TIMESTAMP('2024-01-05 09:45:00', 'YYYY-MM-DD HH24:MI:SS')
WHERE ref_tache = 21;

UPDATE Tache_fini
SET date_realisation = TO_TIMESTAMP('2024-01-05 09:45:00', 'YYYY-MM-DD HH24:MI:SS')
WHERE ref_tache = 22;

    
--pl/sql--------------------------------------------------------------------------------  



--1)-----------

CREATE OR REPLACE PROCEDURE CalculerScoreUtilisateur(p_ref_utilisateur INT) IS
  v_score INT;
BEGIN
  --Calculer la somme des scores des tâches assignées et terminées par l'utilisateur
  --au cours des 7 derniers jours, avec malus de 2 points pour les tâches non terminées
  SELECT COALESCE(SUM(
                    CASE
                      WHEN tf.statut = 'Terminée' THEN sct.score
                      WHEN tf.statut IS NULL AND tf.date_d_echeance >= SYSDATE - INTERVAL '7' DAY THEN -2
                      ELSE 0
                    END
                  ), 0)
  INTO v_score
  FROM Est_assigne ea
  LEFT JOIN Tache_fini tf ON ea.ref_tache = tf.ref_tache
  LEFT JOIN Score_categorie_tache sct ON tf.ref_tache = sct.ref_score_categorie_tache
  WHERE ea.ref_utilisateur = p_ref_utilisateur
    AND (tf.statut = 'Terminée' OR (tf.statut IS NULL AND (tf.date_d_echeance IS NULL OR tf.date_d_echeance >= SYSDATE - INTERVAL '7' DAY)));

 --Afficher le score calculé
  DBMS_OUTPUT.PUT_LINE('Le score total de l''utilisateur ' || p_ref_utilisateur || ' est : ' || v_score);
END CalculerScoreUtilisateur;

--pour executer----
SET SERVEROUTPUT ON;

DECLARE
  v_utilisateur_id INT := 7; --Remplacez 7 par l'utilisateur souhaité
BEGIN
  CalculerScoreUtilisateur(v_utilisateur_id);
END;



--2)---------

CREATE OR REPLACE PROCEDURE archiver_taches_passees
IS
BEGIN
  -- Mettre à jour le statut des tâches passées de Tache_fini à 'Archivée'
  UPDATE Tache_fini
  SET statut = 'Archivée'
  WHERE date_realisation < TRUNC(SYSDATE, 'IW') - 7;

  -- Mettre à jour le statut des tâches passées de Tache_en_cours à 'Archivée'
  UPDATE Tache_en_cours
  SET statut = 'Archivée'
  WHERE date_d_echeance < TRUNC(SYSDATE, 'IW') - 7 AND statut = 'En cours';

  COMMIT;
END archiver_taches_passees;


-- Appeler la procédure pour archiver les tâches passées
BEGIN
  archiver_taches_passees;
END;




--3)----------
	
CREATE OR REPLACE PROCEDURE TrouverUtilisateursSimilaires(
    p_ref_utilisateur INT,
    p_nombre_taches_similaires INT,
    p_nombre_mots_communs INT
)
IS
    v_ref_utilisateur_similaire INT;
    v_ref_tache_similaire INT;
    v_intitule_tache_similaire VARCHAR2(255);

    CURSOR cur_utilisateurs_similaires IS
        SELECT DISTINCT ea.ref_utilisateur
        FROM Est_assigne ea
        JOIN Est_assigne ea_principal ON ea.ref_tache = ea_principal.ref_tache
        WHERE ea_principal.ref_utilisateur = p_ref_utilisateur
        AND ea.ref_utilisateur <> p_ref_utilisateur
        GROUP BY ea.ref_utilisateur
        HAVING COUNT(DISTINCT ea.ref_tache) >= p_nombre_taches_similaires;

    CURSOR cur_taches_similaires IS
        SELECT DISTINCT ea.ref_tache, nvl(tec.intitule, tf.intitule) as intitule
        FROM Est_assigne ea
        LEFT JOIN Tache_en_cours tec ON ea.ref_tache = tec.ref_tache
        LEFT JOIN Tache_fini tf ON ea.ref_tache = tf.ref_tache
        WHERE ea.ref_utilisateur = v_ref_utilisateur_similaire
        AND EXISTS (
            SELECT 1
            FROM Est_assigne ea_principal
            WHERE ea_principal.ref_utilisateur = p_ref_utilisateur
            AND ea_principal.ref_tache = ea.ref_tache
            HAVING COUNT(DISTINCT ea_principal.ref_tache) >= p_nombre_mots_communs
        );

BEGIN
    OPEN cur_utilisateurs_similaires;
    LOOP
        FETCH cur_utilisateurs_similaires INTO v_ref_utilisateur_similaire;
        EXIT WHEN cur_utilisateurs_similaires%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Utilisateur Similaire : ' || v_ref_utilisateur_similaire);

        -- Tâches similaires
        OPEN cur_taches_similaires;
        LOOP
            FETCH cur_taches_similaires INTO v_ref_tache_similaire, v_intitule_tache_similaire;
            EXIT WHEN cur_taches_similaires%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE('Tâche Suggérée : ' || v_ref_tache_similaire || ', Intitulé : ' || v_intitule_tache_similaire);
        END LOOP;
        CLOSE cur_taches_similaires;
    END LOOP;

    CLOSE cur_utilisateurs_similaires;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erreur : ' || SQLERRM);
END TrouverUtilisateursSimilaires;

--pour tester--
EXEC TrouverUtilisateursSimilaires(p_ref_utilisateur => 2, p_nombre_taches_similaires => 1, p_nombre_mots_communs => 1);

--exemple d'affichage
--Utilisateur Similaire : 4 (l'utilisateur 4)
--Tâche Suggérée : 11 (la tache numero 11) , Intitulé : Tâche en cours 2




-- trigger-------------------------------------------------------------------------------------------



--1)-----------

CREATE OR REPLACE TRIGGER MAJ_SCORE_UTILISATEUR
AFTER INSERT OR UPDATE ON Tache_fini
FOR EACH ROW
BEGIN
  IF :NEW.statut = 'Terminée' THEN
    -- Mise à jour du score en fonction du statut "Terminée"
    UPDATE Utilisateur
    SET score = COALESCE(score, 0) + score
    WHERE ref_utilisateur = :NEW.ref_utilisateur;
  ELSIF :NEW.statut = 'Archivée' THEN
    -- Mise à jour du score en fonction du statut "Archivée"
    UPDATE Utilisateur
    SET score = COALESCE(score, 0) - 2
    WHERE ref_utilisateur = :NEW.ref_utilisateur;
  END IF;
END MAJ_SCORE_UTILISATEUR;

--pour tester

INSERT INTO Tache_fini (
  ref_tache, intitule, description, priorite, url, date_d_echeance,
  statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation
) VALUES (
  123, 'Tâche terminée 123', 'Description de la tâche terminée 123', 1, 'https://exemple.com',
  TO_TIMESTAMP('2024-04-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Terminée', 'Categorie B', 42, 1, TO_TIMESTAMP('2024-01-05 10:45:00', 'YYYY-MM-DD HH24:MI:SS')
);



--2)-------------


CREATE OR REPLACE TRIGGER TRIG_CREATION_TACHES_PERIODIQUES
AFTER INSERT OR UPDATE ON Periodicite
FOR EACH ROW
DECLARE
    v_start_date TIMESTAMP;
    v_end_date TIMESTAMP;
    v_interval INTERVAL DAY TO SECOND;
    v_current_date TIMESTAMP;
    v_hour INTEGER;
    v_ref_utilisateur INT;
BEGIN
    -- Vérifier si la périodicité a une date de fin
    IF :NEW.date_fin IS NOT NULL THEN
        v_start_date := :NEW.date_debut;
        v_end_date := :NEW.date_fin;
        v_interval := :NEW.periode;
        v_hour := EXTRACT(HOUR FROM :NEW.date_debut);

        -- Récupérer ref_utilisateur à partir de Tache_en_cours
        SELECT ref_utilisateur INTO v_ref_utilisateur
        FROM Tache_en_cours
        WHERE ref_tache = :NEW.ref_periodicite
        AND ROWNUM = 1;

        -- Boucle pour créer les tâches associées en fonction de la périodicité
        v_current_date := v_start_date;
        WHILE v_current_date <= v_end_date LOOP
            -- Insérer ou mettre à jour la tâche associée avec la date actuelle
            MERGE INTO Tache_en_cours tc
            USING DUAL
            ON (tc.ref_tache = :NEW.ref_periodicite)
            WHEN MATCHED THEN
                UPDATE SET
                    intitule = 'Tâche périodique mise à jour',
                    description = 'Description mise à jour',
                    date_d_echeance = v_current_date,
                    statut = 'En cours',
                    nom_categorie = 'Catégorie par défaut',
                    date_realisation = NULL
            WHEN NOT MATCHED THEN
                INSERT (ref_tache, intitule, description, date_d_echeance, statut, nom_categorie, ref_periodicite, ref_utilisateur, date_realisation)
                VALUES (:NEW.ref_periodicite, 'Tâche périodique', 'Description de la tâche périodique', v_current_date, 'En cours', 'Catégorie par défaut', :NEW.ref_periodicite, v_ref_utilisateur, NULL);

            -- Incrémenter la date actuelle en fonction de l'interval
            v_current_date := v_current_date + v_interval;
        END LOOP;
    END IF;
END TRIG_CREATION_TACHES_PERIODIQUES;

--pour tester
INSERT INTO Periodicite (ref_periodicite, date_debut, date_fin, periode) VALUES (105, TIMESTAMP '2024-01-07 00:00:00', TIMESTAMP '2024-01-15 00:00:00', NULL);



