/*   A.9 Mariages   */

CREATE TABLE PERSONNE
( numpers number PRIMARY KEY,
nom varchar2 (30 ) NOT NULL,
prenom varchar2(30),
pere NUMBER CONSTRAINT pk_pere REFERENCES PERSONNE(numpers),
mere NUMBER CONSTRAINT pk_mere REFERENCES PERSONNE(numpers)
);
CREATE TABLE MARIAGE
(
nummari NUMBER CONSTRAINT fk_mar_nummari REFERENCES PERSONNE(numpers),
numfemme NUMBER CONSTRAINT fk_mar_numfemme  REFERENCES PERSONNE(numpers),
datemariage DATE DEFAULT SYSDATE ,
datedivorce DATE DEFAULT NULL,
CONSTRAINT pk_mariage PRIMARY KEY(nummari,numfemme,datemariage)
);
