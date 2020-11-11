/* Formatted on 12-20-2018 1:38:29 PM (QP5 v5.126.903.23003) */
/*
"C:\Program Files (x86)\pgAdmin 4\v3\runtime\pg_dump" --host localhost --port 5432 --username postgres --verbose --table=WKF.WKF_APPRVR_GROUPS --data-only --column-inserts psdc_live > WKF.WKF_APPRVR_GROUPS.sql
*/
set define off;
TRUNCATE TABLE WKF.WKF_APPRVR_GROUPS CASCADE;


INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (70, 'Bank of Ghana Approvers', 'Bank of Ghana Approvers', 75, 1, '1', 116, '2016-07-13 08:28:09', 116, '2016-07-13 08:28:09');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (71, 'Access Bank (Ghana) Limited Approvers', 'Access Bank (Ghana) Limited Approvers', 77, 1, '1', 116, '2016-07-13 08:28:09', 116, '2016-07-13 08:28:09');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (72, 'ADB Bank Limited Approvers', 'ADB Bank Limited Approvers', 78, 1, '1', 116, '2016-07-13 08:28:10', 116, '2016-07-13 08:28:10');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (73, 'Airtel Ghana Limited Approvers', 'Airtel Ghana Limited Approvers', 109, 1, '1', 116, '2016-07-13 08:28:10', 116, '2016-07-13 08:28:10');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (74, 'ARB Apex Bank Ltd Approvers', 'ARB Apex Bank Ltd Approvers', 79, 1, '1', 116, '2016-07-13 08:28:11', 116, '2016-07-13 08:28:11');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (75, 'Bank of Africa Ghana Ltd Approvers', 'Bank of Africa Ghana Ltd Approvers', 87, 1, '1', 116, '2016-07-13 08:28:11', 116, '2016-07-13 08:28:11');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (76, 'Bank of Baroda (Ghana) Limited Approvers', 'Bank of Baroda (Ghana) Limited Approvers', 81, 1, '1', 116, '2016-07-13 08:28:12', 116, '2016-07-13 08:28:12');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (77, 'Barclays Bank of Ghana Ltd Approvers', 'Barclays Bank of Ghana Ltd Approvers', 82, 1, '1', 116, '2016-07-13 08:28:12', 116, '2016-07-13 08:28:12');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (78, 'BSIC Ghana Limited (Bank) Approvers', 'BSIC Ghana Limited (Bank) Approvers', 86, 1, '1', 116, '2016-07-13 08:28:13', 116, '2016-07-13 08:28:13');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (79, 'CAL Bank Limited Approvers', 'CAL Bank Limited Approvers', 89, 1, '1', 116, '2016-07-13 08:28:13', 116, '2016-07-13 08:28:13');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (80, 'Capital Bank Limited Approvers', 'Capital Bank Limited Approvers', 91, 1, '1', 116, '2016-07-13 08:28:14', 116, '2016-07-13 08:28:14');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (81, 'Ecobank Ghana Limited Approvers', 'Ecobank Ghana Limited Approvers', 93, 1, '1', 116, '2016-07-13 08:28:14', 116, '2016-07-13 08:28:14');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (82, 'Energy Bank (Ghana) Ltd Approvers', 'Energy Bank (Ghana) Ltd Approvers', 94, 1, '1', 116, '2016-07-13 08:28:15', 116, '2016-07-13 08:28:15');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (83, 'eTranzact Ghana Limited Approvers', 'eTranzact Ghana Limited Approvers', 111, 1, '1', 116, '2016-07-13 08:28:15', 116, '2016-07-13 08:28:15');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (84, 'FBN Bank Ghana Ltd Approvers', 'FBN Bank Ghana Ltd Approvers', 98, 1, '1', 116, '2016-07-13 08:28:16', 116, '2016-07-13 08:28:16');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (85, 'Fidelity Bank Limited Approvers', 'Fidelity Bank Limited Approvers', 100, 1, '1', 116, '2016-07-13 08:28:16', 116, '2016-07-13 08:28:16');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (86, 'First Atlantic Bank Ltd Approvers', 'First Atlantic Bank Ltd Approvers', 96, 1, '1', 116, '2016-07-13 08:28:17', 116, '2016-07-13 08:28:17');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (87, 'First National Bank Ghana Ltd Approvers', 'First National Bank Ghana Ltd Approvers', 101, 1, '1', 116, '2016-07-13 08:28:17', 116, '2016-07-13 08:28:17');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (88, 'GCB Bank Limited Approvers', 'GCB Bank Limited Approvers', 103, 1, '1', 116, '2016-07-13 08:28:17', 116, '2016-07-13 08:28:17');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (89, 'GN Bank Limited Approvers', 'GN Bank Limited Approvers', 104, 1, '1', 116, '2016-07-13 08:28:18', 116, '2016-07-13 08:28:18');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (90, 'Guaranty Trust Bank (Ghana) Limited Approvers', 'Guaranty Trust Bank (Ghana) Limited Approvers', 105, 1, '1', 116, '2016-07-13 08:28:18', 116, '2016-07-13 08:28:18');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (91, 'HFC Bank Ghana Ltd Approvers', 'HFC Bank Ghana Ltd Approvers', 102, 1, '1', 116, '2016-07-13 08:28:19', 116, '2016-07-13 08:28:19');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (92, 'Millicom Ghana Limited (Tigo) Approvers', 'Millicom Ghana Limited (Tigo) Approvers', 106, 1, '1', 116, '2016-07-13 08:28:19', 116, '2016-07-13 08:28:19');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (93, 'MTN Ghana Limited Approvers', 'MTN Ghana Limited Approvers', 108, 1, '1', 116, '2016-07-13 08:28:20', 116, '2016-07-13 08:28:20');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (94, 'National Investment Bank Ltd Approvers', 'National Investment Bank Ltd Approvers', 99, 1, '1', 116, '2016-07-13 08:28:20', 116, '2016-07-13 08:28:20');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (95, 'Prudential Bank Limited Approvers', 'Prudential Bank Limited Approvers', 97, 1, '1', 116, '2016-07-13 08:28:21', 116, '2016-07-13 08:28:21');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (96, 'Societe General Ghana Limited (Bank) Approvers', 'Societe General Ghana Limited (Bank) Approvers', 92, 1, '1', 116, '2016-07-13 08:28:21', 116, '2016-07-13 08:28:21');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (97, 'Stanbic Bank Ghana Ltd Approvers', 'Stanbic Bank Ghana Ltd Approvers', 90, 1, '1', 116, '2016-07-13 08:28:21', 116, '2016-07-13 08:28:21');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (98, 'Standard Chartered Bank (Ghana) Limited Approvers', 'Standard Chartered Bank (Ghana) Limited Approvers', 95, 1, '1', 116, '2016-07-13 08:28:22', 116, '2016-07-13 08:28:22');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (99, 'The Royal Bank Limited Approvers', 'The Royal Bank Limited Approvers', 88, 1, '1', 116, '2016-07-13 08:28:22', 116, '2016-07-13 08:28:22');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (100, 'uniBank Ghana Ltd Approvers', 'uniBank Ghana Ltd Approvers', 83, 1, '1', 116, '2016-07-13 08:28:23', 116, '2016-07-13 08:28:23');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (101, 'United Bank for Africa (Ghana) Ltd Approvers', 'United Bank for Africa (Ghana) Ltd Approvers', 84, 1, '1', 116, '2016-07-13 08:28:23', 116, '2016-07-13 08:28:23');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (102, 'Universal Merchant Bank (Ghana) Ltd Approvers', 'Universal Merchant Bank (Ghana) Ltd Approvers', 85, 1, '1', 116, '2016-07-13 08:28:24', 116, '2016-07-13 08:28:24');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (103, 'UT Bank Limited Approvers', 'UT Bank Limited Approvers', 80, 1, '1', 116, '2016-07-13 08:28:24', 116, '2016-07-13 08:28:24');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (104, 'Vodafone Ghana Limited Approvers', 'Vodafone Ghana Limited Approvers', 107, 1, '1', 116, '2016-07-13 08:28:25', 116, '2016-07-13 08:28:25');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (105, 'Zeepay Ghana Limited Approvers', 'Zeepay Ghana Limited Approvers', 110, 1, '1', 116, '2016-07-13 08:28:25', 116, '2016-07-13 08:28:25');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (106, 'Zenith Bank (Ghana) Limited Approvers', 'Zenith Bank (Ghana) Limited Approvers', 76, 1, '1', 116, '2016-07-13 08:28:25', 116, '2016-07-13 08:28:25');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (107, 'Bank of Ghana Reviewers', 'Bank of Ghana Reviewers', 75, 1, '1', 116, '2016-07-14 12:39:36', 116, '2016-07-14 12:39:36');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (108, 'Soverign Bank Ghana Limited Approvers', 'Soverign Bank Ghana Limited Approvers', 112, 1, '1', 116, '2016-07-29 08:56:33', 116, '2016-07-29 08:56:33');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (109, 'OmniBank Ghana Approvers', 'OmniBank Ghana Approvers', 114, 1, '1', 116, '2017-02-06 09:21:05', 116, '2017-02-06 09:21:05');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (110, 'Premium Bank Approvers', 'Premium Bank Approvers', 113, 1, '1', 116, '2017-02-06 09:21:06', 116, '2017-02-06 09:21:06');
INSERT INTO wkf.wkf_apprvr_groups (apprvr_group_id, group_name, group_description, linked_firm_id, org_id, is_enabled, created_by, creation_date, last_update_by, last_update_date) VALUES (111, 'Heritage Bank Limited Approvers', 'Heritage Bank Limited Approvers', 115, 1, '1', 285, '2017-08-15 11:16:56', 285, '2017-08-15 11:16:56');



COMMIT;
EXEC SYS.SEQUENCE_NEWVALUE( 'WKF', 'WKF_APPRVR_GROUPS_SEQ', 115 );
COMMIT;
