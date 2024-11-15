CREATE OR REPLACE VIEW DATAVAULT_WORKSHOP.TEAM_20.D_ZAM AS
SELECT
    hz.hk_zamestnanec_h
    ,hz.idzam
    ,sz.jmeno
    ,sz.prijmeni
    ,sz.titul
    ,sf.nazev
FROM DATAVAULT_WORKSHOP.TEAM_20.HUB_ZAMESTNANEC hz
JOIN DATAVAULT_WORKSHOP.TEAM_20.SATELLITE_ZAMESTNANEC sz
    ON hz.hk_zamestnanec_h = sz.hk_zamestnanec_h
JOIN DATAVAULT_WORKSHOP.TEAM_20.LINK_ZAMESTNANEC lz
    ON hz.hk_zamestnanec_h = lz.hk_zamestnanec_h
JOIN DATAVAULT_WORKSHOP.TEAM_20.SATELLITE_FUNKCE sf
    ON lz.hk_funkce_h = sf.hk_funkce_h;

CREATE OR REPLACE VIEW DATAVAULT_WORKSHOP.TEAM_20.D_POBOCKA AS
SELECT
    hp.hk_pobocka_h
    ,hp.idpob
    ,sp.nazev
FROM DATAVAULT_WORKSHOP.TEAM_20.HUB_POBOCKA hp
JOIN DATAVAULT_WORKSHOP.TEAM_20.SATELLITE_POBOCKA sp
    ON hp.hk_pobocka_h = sp.hk_pobocka_h;

CREATE OR REPLACE VIEW DATAVAULT_WORKSHOP.TEAM_20.F_MART AS
SELECT
    svms.datum
    ,svms.castka as castka_skutecnost
    ,svmp.castka as castka_plan
    ,lvms.hk_zamestnanec_h
    ,lz.hk_pobocka_h
FROM DATAVAULT_WORKSHOP.TEAM_20.HUB_POLOZKA_DENIKU hpd
JOIN DATAVAULT_WORKSHOP.TEAM_20.SATELLITE_VYDAJE_MZDY_SKUTECNOST svms
    ON hpd.hk_polozka_deniku_h = svms.hk_polozka_deniku_h
JOIN DATAVAULT_WORKSHOP.TEAM_20.LINK_VYDAJE_MZDY_SKUTECNOST lvms
    ON svms.hk_polozka_deniku_h = lvms.hk_polozka_deniku_h
JOIN DATAVAULT_WORKSHOP.TEAM_20.SATELLITE_VYDAJE_MZDY_PLAN svmp
    ON lvms.hk_polozka_deniku_plan_h = svmp.hk_polozka_deniku_h
JOIN DATAVAULT_WORKSHOP.TEAM_20.LINK_ZAMESTNANEC lz
    ON lz.hk_zamestnanec_h = lvms.hk_zamestnanec_h
;