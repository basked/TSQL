﻿/*********************************************
**************-=SELECT=- *********************
*********************************************/
IF EXISTS(SELECT 1
	FROM sys.tables
	WHERE object_id = OBJECT_ID('Employees'))
BEGIN;
	DROP TABLE [Employees];
END;
GO

CREATE TABLE [Employees] ( [Id]         INTEGER NOT NULL IDENTITY(1, 1)
,                          [FName]      VARCHAR(255) NULL
,                          [LName]      VARCHAR(255) NULL
,                          [Phone]      VARCHAR(100) NULL
,                          [EMail]      VARCHAR(255) NULL
,                          [BirthDate]  DATE
,                          [Department] VARCHAR(255) NULL
,                          [Address]    VARCHAR(255) NULL
,                          [Salary]     DECIMAL(10,4) NULL
,                          PRIMARY KEY ([Id]) );
GO
TRUNCATE TABLE  Employees
go

INSERT INTO Employees ( [FName],      [LName],      [Phone],        [EMail],                                          [BirthDate],  [Department],                  [Address],                                [Salary] )
VALUES                ( 'Melanie',    'Chandler',   '072-247-7280', 'porttitor.tellus.non@CraspellentesqueSed.net',   '07/08/1987', 'SUPPLY',                      '427-1407 Vel Avenue',                    '10000'  )
,                     ( 'Francesca',  'Jarvis',     '022-475-6735', 'turpis.Nulla@enimdiamvel.org',                   '29/03/1987', 'SALES',                       '387-2130 Sit Rd.',                       '7000'   )
,                     ( 'Heather',    'Gaines',     '049-799-3650', 'blandit.at@tristique.co.uk',                     '18/06/1995', 'LOGISTICS',                   'Ap #522-1013 Risus Rd.',                 '9000'   )
,                     ( 'Jakeem',     'Perry',      '004-776-9218', 'elementum@tellusfaucibusleo.org',                '14/12/1981', 'ADMINISTRATION & SUPPORT',    'Ap #356-2366 Dis Avenue',                '10000'  )
,                     ( 'Ella',       'Clayton',    '019-155-8217', 'hendrerit.id.ante@lobortisultrices.edu',         '04/03/1979', 'PRODUCTION & ENGINEERING',    'P.O. Box 771, 8699 Netus Avenue',        '5000'   )
,                     ( 'Winter',     'Cantrell',   '035-932-4526', 'nibh.Donec@fringillacursuspurus.edu',            '08/12/1980', 'PLANNED-ECONOMIC',            '621-5915 Pede Road',                     '5000'   )
,                     ( 'Adele',      'Fletcher',   '046-173-2765', 'luctus.et.ultrices@est.org',                     '17/04/1993', 'HR MANAGEMENT',               '4812 Ut St.',                            '5000'   )
,                     ( 'Mollie',     'Pate',       '064-317-7981', 'ac.libero@sitamet.net',                          '29/12/1982', 'LOGISTICS',                   '6533 Ut, Ave',                           '7000'   )
,                     ( 'Silas',      'Acevedo',    '002-675-9781', 'nisl.elementum.purus@utpharetrased.co.uk',       '02/02/1991', 'LAW',                         '527-5115 Ac St.',                        NULL     )
,                     ( 'Emma',       'Roman',      '090-343-8857', 'lorem@odiotristique.net',                        '14/08/1979', 'LOGISTICS',                   'Ap #955-7018 Arcu. Av.',                 '9000'   )
,                     ( 'Dora',       'Brown',      '070-126-0788', 'lacus@odio.edu',                                 '23/12/1988', 'SALES',                       '956-9584 Accumsan Street',               NULL     )
,                     ( 'Fitzgerald', 'Gardner',    '053-341-4738', 'vitae.velit@ipsumprimisin.ca',                   '02/06/1979', 'LOGISTICS',                   'Ap #749-7533 Fringilla Road',            '6000'   )
,                     ( 'Richard',    'Schneider',  '061-406-9308', 'velit.dui.semper@nisinibhlacinia.net',           '15/10/1982', 'PRODUCTION & ENGINEERING',    'Ap #940-6450 Ornare, Street',            '4000'   )
,                     ( 'Carter',     'Lloyd',      '065-247-9717', 'at@gravidamolestie.co.uk',                       '15/08/1991', 'LAW',                         'Ap #376-7504 Risus Avenue',              '9000'   )
,                     ( 'Brynn',      'Johnson',    '030-375-5413', 'ultrices.sit.amet@ut.com',                       '09/03/1984', 'FINANCE & ACCOUNTING',        'Ap #972-2994 Metus Road',                '6000'   )
,                     ( 'Evelyn',     'Colon',      '075-514-3543', 'elit@velitdui.org',                              '23/02/1979', 'PRODUCTION & ENGINEERING',    '226-2025 Eget St.',                      NULL     )
,                     ( 'Sigourney',  'Bradshaw',   '007-905-5284', 'erat.semper.rutrum@quisturpisvitae.org',         '30/07/1988', 'HR MANAGEMENT',               'Ap #861-3112 Sapien, Street',            '7000'   )
,                     ( 'Gil',        'Jacobson',   '089-255-7891', 'In@tellus.net',                                  '12/03/1993', 'SALES',                       '319-4405 In Rd.',                        '6000'   )
,                     ( 'Angelica',   'Butler',     '062-772-2733', 'a@volutpatNulla.org',                            '16/03/1987', 'ADMINISTRATION & SUPPORT',    'P.O. Box 910, 5957 Dui. St.',            '9000'   )
,                     ( 'Uriah',      'Pope',       '062-858-8720', 'Nunc@MorbivehiculaPellentesque.edu',             '01/04/1988', 'LAW',                         '638 Dis St.',                            '7000'   )
,                     ( 'Beverly',    'Conley',     '043-945-8933', 'Suspendisse@Aeneansedpede.ca',                   '13/02/1989', 'SALES',                       'P.O. Box 597, 5329 Eu Rd.',              '7000'   )
,                     ( 'Kyle',       'Gilliam',    '004-729-1965', 'risus@nonvestibulum.org',                        '19/07/1988', 'PRODUCTION & ENGINEERING',    'P.O. Box 334, 2625 Tortor. St.',         '10000'  )
,                     ( 'Amethyst',   'Cabrera',    '098-799-7451', 'eu.dolor@imperdiet.co.uk',                       '08/10/1982', 'ADMINISTRATION & SUPPORT',    'P.O. Box 396, 1079 Sed Avenue',          '8000'   )
,                     ( 'Marshall',   'Emerson',    '043-675-3538', 'consectetuer.cursus@duiSuspendisseac.co.uk',     '05/12/1989', 'PLANNED-ECONOMIC',            'P.O. Box 804, 9174 Blandit Road',        '7000'   )
,                     ( 'Bruno',      'Miranda',    '009-488-9793', 'Mauris@amet.net',                                '24/02/1984', 'ADMINISTRATION & SUPPORT',    '296-6188 Dictum Street',                 '9000'   )
,                     ( 'Dustin',     'Osborn',     '051-645-9866', 'nec@Integervitae.org',                           '20/08/1987', 'SALES',                       'P.O. Box 114, 4650 Luctus. Road',        '5000'   )
,                     ( 'Frances',    'Reilly',     '046-443-1891', 'lectus.justo@id.co.uk',                          '03/12/1988', 'HR MANAGEMENT',               '3545 Ac Rd.',                            '8000'   )
,                     ( 'Roanna',     'Farley',     '036-125-6360', 'amet.lorem@risusodioauctor.net',                 '01/10/1989', 'MARKETING',                   'P.O. Box 990, 8498 Ut St.',              '10000'  )
,                     ( 'Germane',    'Arnold',     '005-278-5377', 'Pellentesque.habitant@Aliquamrutrumlorem.net',   '22/01/1992', 'SUPPLY',                      'Ap #415-970 Metus. St.',                 '9000'   )
,                     ( 'Kylie',      'Crosby',     '031-501-5067', 'Donec.egestas@egetvariusultrices.org',           '23/12/1989', 'PRODUCTION & ENGINEERING',    'Ap #131-1422 Luctus Av.',                '4000'   )
,                     ( 'Ryder',      'Fox',        '037-346-6031', 'nec.leo@Sedid.org',                              '13/09/1986', 'PRODUCTION & ENGINEERING',    '9177 Orci St.',                          NULL     )
,                     ( 'Arden',      'Cooley',     '063-001-3259', 'habitant.morbi.tristique@erat.co.uk',            '10/03/1981', 'PRODUCTION & ENGINEERING',    '776-5053 Quis, Road',                    '5000'   )
,                     ( 'Halla',      'Miles',      '059-870-7474', 'sodales.at.velit@Nullamfeugiat.org',             '29/11/1980', 'SALES',                       '237-3434 Pellentesque Av.',              '5000'   )
,                     ( 'Clarke',     'Erickson',   '015-401-8447', 'a.dui.Cras@Nuncmauris.co.uk',                    '15/02/1993', 'ADMINISTRATION & SUPPORT',    '1639 Vel Avenue',                        '10000'  )
,                     ( 'Sebastian',  'Pennington', '079-205-2414', 'elementum.dui.quis@tempusloremfringilla.com',    '12/10/1980', 'SUPPLY',                      '7381 At Road',                           '4000'   )
,                     ( 'Chelsea',    'Crosby',     '063-984-9232', 'penatibus.et@utquamvel.ca',                      '12/09/1979', 'SUPPLY',                      'Ap #610-4796 Amet St.',                  '7000'   )
,                     ( 'Channing',   'Robles',     '003-565-8807', 'In@asollicitudin.ca',                            '19/01/1986', 'PRODUCTION & ENGINEERING',    'P.O. Box 321, 9092 Primis Street',       '7000'   )
,                     ( 'Debra',      'Hardin',     '075-722-3873', 'id.ante.dictum@amet.org',                        '22/09/1987', 'SUPPLY',                      '4144 Convallis Av.',                     '8000'   )
,                     ( 'Perry',      'Sanders',    '041-731-6906', 'vel.vulputate@ante.org',                         '18/03/1980', 'SALES',                       'P.O. Box 760, 7173 Quis Ave',            '6000'   )
,                     ( 'Stone',      'Slater',     '094-294-9156', 'erat.neque@sit.ca',                              '09/07/1981', 'SUPPLY',                      '3578 Nulla Rd.',                         '9000'   )
,                     ( 'Edan',       'Blevins',    '030-021-1822', 'lobortis@adipiscinglobortis.co.uk',              '23/09/1991', 'SUPPLY',                      '885-6097 Commodo Avenue',                '7000'   )
,                     ( 'Hamilton',   'Russell',    '096-736-0878', 'ornare@Donecfringilla.ca',                       '08/02/1980', 'MARKETING',                   'P.O. Box 523, 4903 In, Ave',             '7000'   )
,                     ( 'Gary',       'Knox',       '051-124-7854', 'elit.Curabitur.sed@nonjusto.com',                '21/02/1989', 'SALES',                       '5610 Mauris Rd.',                        '7000'   )
,                     ( 'Alika',      'Stevens',    '086-036-0030', 'penatibus.et.magnis@Quisquetinciduntpede.edu',   '10/09/1982', 'LOGISTICS',                   '878 Vestibulum Rd.',                     '4000'   )
,                     ( 'Connor',     'Rodgers',    '045-936-4974', 'sed@Cumsociis.com',                              '30/08/1988', 'SALES',                       'Ap #752-7751 Cursus. Road',              '4000'   )
,                     ( 'Gray',       'Joyner',     '014-632-0942', 'non.lorem.vitae@Crassedleo.net',                 '24/08/1992', 'PRODUCTION & ENGINEERING',    'Ap #533-3149 Donec Av.',                 '9000'   )
,                     ( 'Quinn',      'Mcmillan',   '023-689-2512', 'amet@velitduisemper.co.uk',                      '04/09/1989', 'SALES',                       'Ap #323-1500 Phasellus Street',          '7000'   )
,                     ( 'Bradley',    'Gould',      '001-417-8555', 'mattis.semper.dui@fermentumfermentum.org',       '01/02/1984', 'PRODUCTION & ENGINEERING',    'Ap #751-6712 Ac Rd.',                    '4000'   )
,                     ( 'Nayda',      'Pittman',    '009-529-7327', 'ipsum.Suspendisse@feugiat.com',                  '11/09/1994', 'QUALITY ASSURANCE & CONTROL', 'Ap #616-1566 Commodo Rd.',               NULL     )
,                     ( 'Aquila',     'Cantu',      '005-110-3982', 'non.bibendum@elementumduiquis.co.uk',            '28/04/1990', 'PLANNED-ECONOMIC',            '199-9516 Integer St.',                   '5000'   )
,                     ( 'Kieran',     'Morse',      '063-264-1960', 'amet@convallisligula.ca',                        '17/10/1980', 'MARKETING',                   '9674 Egestas Avenue',                    '6000'   )
,                     ( 'Yolanda',    'Mcgowan',    '012-280-3793', 'vel@sapiencursus.net',                           '18/07/1991', 'LAW',                         '328-3564 Convallis Rd.',                 '5000'   )
,                     ( 'Holmes',     'Hodges',     '042-202-7174', 'blandit@vestibulumnequesed.ca',                  '11/10/1982', 'LAW',                         '106-3332 Ornare, St.',                   '7000'   )
,                     ( 'Pandora',    'Kim',        '040-161-8455', 'Sed.diam@Donec.net',                             '03/01/1990', 'ADMINISTRATION & SUPPORT',    'P.O. Box 341, 7759 Mattis. St.',         '5000'   )
,                     ( 'Shafira',    'Malone',     '087-236-7220', 'Integer@eu.org',                                 '09/05/1982', 'HR MANAGEMENT',               '9968 Pellentesque Av.',                  '9000'   )
,                     ( 'Inez',       'Pate',       '069-185-2566', 'feugiat.Lorem.ipsum@aptenttacitisociosqu.edu',   '08/06/1984', 'LOGISTICS',                   '831-6642 Faucibus St.',                  '10000'  )
,                     ( 'Macaulay',   'Vega',       '051-451-0570', 'tristique.aliquet@placerat.com',                 '23/08/1991', 'ADMINISTRATION & SUPPORT',    'Ap #209-2940 Magnis St.',                '10000'  )
,                     ( 'Xavier',     'Suarez',     '026-239-3181', 'leo@nonenimcommodo.net',                         '27/11/1986', 'SALES',                       'P.O. Box 771, 1679 Mi St.',              '9000'   )
,                     ( 'Nora',       'Ochoa',      '004-001-1314', 'parturient@Fuscemollis.co.uk',                   '05/02/1994', 'PRODUCTION & ENGINEERING',    'P.O. Box 373, 8120 Eget Avenue',         '6000'   )
,                     ( 'Alec',       'Good',       '058-738-4059', 'vulputate@egestasAliquamfringilla.co.uk',        '27/04/1980', 'LAW',                         '269-7032 Nam Rd.',                       '8000'   )
,                     ( 'Wade',       'Mckay',      '075-068-3413', 'Curabitur.ut.odio@molestieintempus.co.uk',       '27/02/1995', 'SALES',                       '296-4977 Et Av.',                        '10000'  )
,                     ( 'Kerry',      'Pope',       '084-749-6590', 'ut.erat.Sed@eueleifend.edu',                     '25/05/1978', 'LAW',                         '4143 Ad Rd.',                            '5000'   )
,                     ( 'Lee',        'Herrera',    '066-894-8661', 'eget.dictum@tellus.com',                         '21/10/1988', 'FINANCE & ACCOUNTING',        'P.O. Box 638, 6162 Suspendisse Ave',     '8000'   )
,                     ( 'Baxter',     'Wall',       '006-288-7734', 'volutpat.Nulla@Nuncpulvinar.org',                '02/05/1989', 'MARKETING',                   'Ap #721-3781 Id Avenue',                 '6000'   )
,                     ( 'Melodie',    'Delaney',    '011-380-1062', 'Donec.vitae@ridiculus.org',                      '06/04/1979', 'SUPPLY',                      'Ap #943-5032 Sem, Avenue',               '9000'   )
,                     ( 'Isadora',    'Tyson',      '052-549-0207', 'ridiculus.mus@eratEtiam.edu',                    '02/04/1987', 'HR MANAGEMENT',               'P.O. Box 993, 1126 Consectetuer Street', '4000'   )
,                     ( 'Zane',       'Mcfarland',  '027-081-0471', 'ipsum@auctorMauris.ca',                          '15/02/1990', 'MARKETING',                   '469-6286 Sagittis. St.',                 '4000'   )
,                     ( 'Madonna',    'Ashley',     '043-418-2583', 'dui.nec@sapienAenean.net',                       '10/06/1993', 'ADMINISTRATION & SUPPORT',    'P.O. Box 161, 989 Quis, St.',            '4000'   )
,                     ( 'Jocelyn',    'Charles',    '012-673-4905', 'velit@SeddictumProin.org',                       '04/01/1990', 'FINANCE & ACCOUNTING',        'Ap #463-8479 Ac Rd.',                    '4000'   )
,                     ( 'Joan',       'Parsons',    '090-961-5227', 'orci.luctus@fringillaporttitorvulputate.org',    '13/02/1989', 'LOGISTICS',                   '8842 Massa. St.',                        '8000'   )
,                     ( 'Marcia',     'Mckay',      '029-380-1632', 'Curabitur.massa@Quisqueliberolacus.net',         '09/05/1990', 'LOGISTICS',                   'P.O. Box 342, 9580 Amet Av.',            '6000'   )
,                     ( 'Omar',       'Blevins',    '038-908-2268', 'nulla@magnaSuspendissetristique.org',            '17/07/1983', 'HR MANAGEMENT',               '458 Placerat, Rd.',                      '5000'   )
,                     ( 'Hoyt',       'Hernandez',  '006-137-8862', 'sed.facilisis.vitae@quisaccumsanconvallis.edu',  '26/10/1986', 'PLANNED-ECONOMIC',            '2272 Nunc Ave',                          '10000'  )
,                     ( 'Inez',       'Solomon',    '067-778-5796', 'velit.egestas@sapienimperdietornare.edu',        '05/12/1985', 'LAW',                         'Ap #233-7666 At, Road',                  '5000'   )
,                     ( 'Beau',       'Winters',    '055-062-5817', 'ac.sem@leoelementum.net',                        '27/02/1992', 'FINANCE & ACCOUNTING',        'Ap #290-8271 Luctus Ave',                '4000'   )
,                     ( 'Aphrodite',  'Floyd',      '065-094-8464', 'eu@senectuset.net',                              '13/02/1993', 'PRODUCTION & ENGINEERING',    'P.O. Box 188, 5839 Tincidunt, Avenue',   '7000'   )
,                     ( 'Forrest',    'Serrano',    '082-012-5069', 'imperdiet@fringillaest.com',                     '09/03/1991', 'PLANNED-ECONOMIC',            'P.O. Box 551, 8431 Risus Rd.',           '10000'  )
,                     ( 'Denton',     'Padilla',    '032-943-1360', 'Curabitur.egestas.nunc@dictumplacerataugue.net', '01/08/1987', 'SALES',                       'Ap #179-5349 Fames Ave',                 '5000'   )
,                     ( 'Christian',  'Ferguson',   '059-965-2510', 'arcu.ac.orci@consequatlectus.co.uk',             '15/03/1990', 'SUPPLY',                      '145-848 Dolor St.',                      NULL     )
,                     ( 'Charlotte',  'Chavez',     '077-071-4541', 'tempus@convalliserat.ca',                        '20/05/1983', 'PLANNED-ECONOMIC',            '6730 Mi. Rd.',                           '9000'   )
,                     ( 'Lucy',       'Macias',     '018-644-6686', 'arcu.Sed.et@Donec.co.uk',                        '09/08/1979', 'LAW',                         '591-5164 Posuere St.',                   '7000'   )
,                     ( 'Griffith',   'Finley',     '002-656-3616', 'urna.et@ornaresagittisfelis.com',                '02/11/1993', 'LOGISTICS',                   'Ap #336-579 Ligula Rd.',                 NULL     )
,                     ( 'Alfonso',    'Pennington', '010-641-2141', 'luctus.aliquet@cursusaenim.ca',                  '28/07/1989', 'SALES',                       'P.O. Box 429, 5862 Phasellus St.',       '4000'   )
,                     ( 'Tamekah',    'Soto',       '074-143-1290', 'diam@risusDonec.com',                            '07/12/1991', 'PRODUCTION & ENGINEERING',    'P.O. Box 195, 5257 Placerat Ave',        '8000'   )
,                     ( 'Paul',       'Goodwin',    '039-300-8966', 'non.sapien.molestie@Nullatempor.ca',             '11/12/1985', 'LOGISTICS',                   '765-3608 Sed Av.',                       '7000'   )
,                     ( 'Keelie',     'Poole',      '028-723-0296', 'Duis.gravida@lobortisnisi.org',                  '22/11/1983', 'SALES',                       'P.O. Box 357, 4106 Enim, St.',           NULL     )
,                     ( 'Stuart',     'Roman',      '060-833-1730', 'risus@senectus.edu',                             '11/09/1985', 'LOGISTICS',                   'P.O. Box 773, 9216 Porta Ave',           '7000'   )
,                     ( 'Helen',      'Clayton',    '070-818-1910', 'pede@placerat.org',                              '04/06/1983', 'MARKETING',                   'Ap #851-4338 Nonummy St.',               '7000'   )
,                     ( 'Lucian',     'Black',      '030-960-2141', 'Nullam.velit@augue.org',                         '23/11/1987', 'FINANCE & ACCOUNTING',        '655-608 Morbi St.',                      NULL     )
,                     ( 'Troy',       'Velasquez',  '090-115-2192', 'sed.pede@Donec.co.uk',                           '14/04/1979', 'LAW',                         'P.O. Box 461, 1015 Lorem Avenue',        '4000'   )
,                     ( 'Castor',     'Glass',      '020-002-5837', 'porttitor.interdum@uterat.com',                  '30/12/1989', 'PRODUCTION & ENGINEERING',    'Ap #553-286 Proin Avenue',               '6000'   )
,                     ( 'Ora',        'Simmons',    '064-460-9185', 'tellus.faucibus@Praesenteudui.net',              '16/02/1978', 'HR MANAGEMENT',               'Ap #850-6201 Eget Ave',                  '10000'  )
,                     ( 'Mohammad',   'Higgins',    '094-701-3101', 'conubia.nostra.per@disparturient.net',           '04/09/1986', 'ADMINISTRATION & SUPPORT',    '817-9872 Diam. Av.',                     '9000'   )
,                     ( 'Lani',       'Moss',       '078-791-6171', 'sed@Nuncsedorci.com',                            '12/04/1989', 'SUPPLY',                      '5460 Quisque St.',                       '9000'   )
,                     ( 'Macaulay',   'Scott',      '027-055-9516', 'imperdiet.erat@eu.net',                          '21/06/1990', 'SUPPLY',                      '380-2378 Porttitor Street',              NULL     )
,                     ( 'Rylee',      'Poole',      '039-758-6332', 'Pellentesque.ultricies@est.org',                 '16/08/1987', 'PLANNED-ECONOMIC',            '394-9885 Vehicula St.',                  NULL     )
,                     ( 'Carla',      'Crawford',   '044-316-9118', 'libero.lacus@aliquam.co.uk',                     '12/08/1991', 'SALES',                       'P.O. Box 991, 645 Litora Ave',           '10000'  )
,                     ( 'Ralph',      'Franco',     '038-164-5040', 'vulputate@quamelementumat.co.uk',                '17/04/1991', 'LOGISTICS',                   '748 Non Road',                           '4000'   )
,                     ( 'Britanney',  'Barr',       '027-475-2484', 'hymenaeos.Mauris@acarcuNunc.org',                '17/07/1978', 'LAW',                         '8731 Neque Rd.',                         '5000'   )
,                     ( 'Maxine',     'Baker',      '089-750-1809', 'consequat@senectusetnetus.edu',                  '02/03/1981', 'LOGISTICS',                   '229-7613 Tristique Street',              '6000');
   