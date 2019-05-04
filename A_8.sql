/*    A.8 Secr´etariat p´edagogique   */
DROP TABLE RESULTAT ;
DROP TABLE EXAMEN ;
DROP TABLE PREREQUIS ;
DROP TABLE INSCRIPTION ;
DROP TABLE MODULE ;
DROP TABLE ETUDIANT ;
CREATE TABLE ETUDIANT
(numEtud number,
nom varchar2(40),
prenom varchar2(40),
datenaiss date,
civilite varchar2(4),
patronyme varchar2(40),
numsecu varchar2(15) NOT NULL);
CREATE TABLE MODULE
(codMod number,
nomMod varchar2(15),
effecMax number DEFAULT 30);
CREATE TABLE EXAMEN
( codMod number,
codExam number,
dateExam date ) ;
CREATE TABLE INSCRIPTION
(numEtud number,
codMod number,
dateInsc date default sysdate ) ;
CREATE TABLE PREREQUIS
(codMod number,
codModPrereq number,
noteMin number(4,2) NOT NULL) ;
CREATE TABLE RESULTAT
(codMod number,
codExam number,
numEtud number,
note number(4,2));
ALTER TABLE ETUDIANT ADD CONSTRAINT pk_ETUDIANT PRIMARY KEY(numEtud);
ALTER TABLE MODULE ADD CONSTRAINT pk_module PRIMARY KEY(codMod);
ALTER TABLE EXAMEN ADD CONSTRAINT pk_examen PRIMARY KEY(codMod,codExam);
ALTER TABLE PREREQUIS ADD CONSTRAINT pk_PREREQUIS PRIMARY KEY(codMod,codModPrereq);
ALTER TABLE INSCRIPTION ADD CONSTRAINT pk_INSCRIPTION PRIMARY KEY(codMod,numEtud);
ALTER TABLE RESULTAT ADD CONSTRAINT pk_RESULTAT PRIMARY KEY(codMod,numEtud,codExam);
ALTER TABLE INSCRIPTION ADD (CONSTRAINT fk_INSCRIPTION_ETUDIANT FOREIGN KEY(numEtud) REFERENCES ETUDIANT(numEtud),
CONSTRAINT fk_INSCRIPTION_module FOREIGN KEY(codMod) REFERENCES MODULE(codMod));
ALTER TABLE PREREQUIS ADD(CONSTRAINT fk_PREREQUIS_codmod FOREIGN KEY(codMod) REFERENCES MODULE(codMod),
CONSTRAINT fk_PREREQUIS_codmodprereq FOREIGN KEY(codModPrereq) REFERENCES MODULE(codMod));
ALTER TABLE EXAMEN ADD CONSTRAINT fk_examen FOREIGN KEY(codMod) REFERENCES MODULE(codMod);
ALTER TABLE RESULTAT ADD (CONSTRAINT fk_RESULTAT_examen FOREIGN KEY (codMod,codExam ) REFERENCES EXAMEN(codMod,codExam),
CONSTRAINT fk_RESULTAT_INSCRIPTION FOREIGN KEY(codMod,numEtud) REFERENCES INSCRIPTION(codMod,numEtud));

ALTER TABLE ETUDIANT ADD (CONSTRAINT ck_civilite CHECK(civilite IN ('Mr','Mme','Mlle')),
CONSTRAINT ck_civilite_numsecu CHECK(SUBSTR(numsecu,1,1) = '2' OR patronyme IS NULL),
CONSTRAINT ck_length_numsecu CHECK(length(numsecu)=15),
CONSTRAINT ck_annee_numsecu CHECK(to_char(datenaiss,'yy') = substr(numsecu,2,2)));
