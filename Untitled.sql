CREATE TABLE "REGION" (
  "reg_code" VARCHAR(3) PRIMARY KEY NOT NULL,
  "reg_nom" VARCHAR(50) NOT NULL
);

CREATE TABLE "DEPARTEMENT" (
  "dep_code" VARCHAR(3) PRIMARY KEY NOT NULL,
  "dep_nom" VARCHAR(50) NOT NULL,
  "reg_code" VARCHAR(3) NOT NULL
);

CREATE TABLE "COMMUNE" (
  "id_codedep_codecommune" VARCHAR(5) PRIMARY KEY NOT NULL,
  "dep_code" VARCHAR(3) NOT NULL,
  "code_postal" VARCHAR(5),
  "nom_commune" VARCHAR(50) NOT NULL,
  "pmun" INTEGER,
  "ptot" INTEGER
);

CREATE TABLE "BIEN" (
  "id_bien" INTEGER PRIMARY KEY NOT NULL,
  "id_codedep_codecommune" VARCHAR(5) NOT NULL,
  "no_voie" INTEGER,
  "btq" VARCHAR(1),
  "type_voie" VARCHAR(4),
  "voie" VARCHAR(50),
  "type_local" VARCHAR(50),
  "surface_reelle_bati" INTEGER,
  "nb_pieces_principales" INTEGER,
  "surface_terrain" INTEGER
);

CREATE TABLE "VENTE" (
  "id_vente" INTEGER PRIMARY KEY NOT NULL,
  "id_bien" INTEGER NOT NULL,
  "date_mutation" DATE NOT NULL,
  "nature_mutation" VARCHAR(50),
  "valeur_fonciere" FLOAT NOT NULL
);

ALTER TABLE "DEPARTEMENT" ADD FOREIGN KEY ("reg_code") REFERENCES "REGION" ("reg_code") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "COMMUNE" ADD FOREIGN KEY ("dep_code") REFERENCES "DEPARTEMENT" ("dep_code") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "BIEN" ADD FOREIGN KEY ("id_codedep_codecommune") REFERENCES "COMMUNE" ("id_codedep_codecommune") DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "VENTE" ADD FOREIGN KEY ("id_bien") REFERENCES "BIEN" ("id_bien") DEFERRABLE INITIALLY IMMEDIATE;
