
# Users
INSERT INTO User (username, password, userType) VALUES ('JustineD','admin123','Admin');
INSERT INTO User (username, password, userType) VALUES ('AndyF','hello123','Admin');
INSERT INTO User (username, password, userType) VALUES ('admin','$2a$08$KRlqPEBYeNTRCtdx1vvpoeyGjyjyf0INv2H0i/xVtymAOcCtbKSQu','Admin');

INSERT INTO User (username, password, userType) VALUES ('JohanL','doctor123','Doctor');
INSERT INTO User (username, password, userType) VALUES ('EddieC','letmein123','Doctor');
INSERT INTO User (username, password, userType) VALUES ('doctor','$2a$08$GMBmlqp6uFX2xLyPMfcTQei2sTeh5wINJc3BtOcdGQRmQolcpuLHC','Doctor');

INSERT INTO User (username, password, userType) VALUES ('HarleyS','nurse123','Nurse');
INSERT INTO User (username, password, userType) VALUES ('AngelinaD','iloveyou','Nurse');
INSERT INTO User (username, password, userType) VALUES ('nurse','$2a$08$04EhoHt09ucTMEx/6aRAM.Gl8qLZbC09d2ZofxClWi8kvsC3csECi','Nurse');

INSERT INTO User (username, password, userType) VALUES ('JannaJ','secretary123','Secretary');
INSERT INTO User (username, password, userType) VALUES ('BreannaS','superman','Secretary');
INSERT INTO User (username, password, userType) VALUES ('secretary','$2a$08$M8NxswrRGphByIBR1n0YpO820ZcKSwcliM2BQ6/ZW87Uq/lf55k6m','Secretary');

# Admins
INSERT INTO Admin (firstname, lastname, dateofbirth, phone, email, UserId)
VALUES ('Justine', 'Dalton', '1972-05-20', '+46700000000', 'JustineD@gmail.com', 1);

INSERT INTO Admin (firstname, lastname, dateofbirth, phone, email, UserId)
VALUES ('Andy', 'Fredriksen', '1976-04-05', '+46700000001', 'AndyF@gmail.com', 2);

INSERT INTO Admin (firstname, lastname, dateofbirth, phone, email, UserId)
VALUES ('Jason', 'Walker', '1982-05-01', '+46700000002', 'JasonW@gmail.com', 3);

# Doctors
INSERT INTO Doctor (firstname, lastname, dateofbirth, phone, email, image, speciality, UserId)
VALUES ('Johan', 'Larsson', '1965-12-15', '+46700000003', 'JohanL@gmail.com', 'https://image.freepik.com/free-photo/doctor-smiling-with-stethoscope_1154-36.jpg', 'Cardiologist', 4);

INSERT INTO Doctor (firstname, lastname, dateofbirth, phone, email, image, speciality, UserId)
VALUES ('Eddie', 'Cruz', '1969-02-26', '+46700000004', 'EddieC@gmail.com', 'https://image.freepik.com/free-photo/doctor-with-his-arms-crossed-over-white-background_1368-5790.jpg', 'Hematologist', 5);

INSERT INTO Doctor (firstname, lastname, dateofbirth, phone, email, image, speciality, UserId)
VALUES ('Cole', 'Berg', '1968-07-20', '+46700000005', 'ColeB@gmail.com', 'https://image.freepik.com/free-photo/doctor-standing-with-a-folder-and-a-stethoscope_1291-16.jpg', 'Dermatologist', 6);

# Nurses
INSERT INTO Nurse (firstname, lastname, dateofbirth, phone, email, image, UserId)
VALUES ('Harley', 'Stephenson', '1985-04-27', '+46700000006', 'HarleyS@gmail.com', 'https://image.freepik.com/fotos-kostenlos/tragender-hut-und-maske-der-uberzeugten-weiblichen-medizinischen-arbeitskraft-die-zur-kamera-schaut_1301-7806.jpg', 7);

INSERT INTO Nurse (firstname, lastname, dateofbirth, phone, email, image, UserId)
VALUES ('Angelina', 'Davidsson', '1982-09-08', '+46700000007', 'AngelinaD@gmail.com', 'https://image.freepik.com/fotos-kostenlos/frau-mit-stethoskop-holding-eine-zwischenablage_1098-2502.jpg', 8);

INSERT INTO Nurse (firstname, lastname, dateofbirth, phone, email, image, UserId)
VALUES ('Melanie', 'Hunter', '1977-08-10', '+46700000008', 'BradH@gmail.com', 'https://image.freepik.com/fotos-kostenlos/arzt-im-krankenhaus_1398-3720.jpg', 9);

# Secretaries
INSERT INTO Secretary (firstname, lastname, dateofbirth, phone, email, UserId)
VALUES ('Janna', 'Jonsson', '1977-08-22', '+46700000009', 'JannaJ@gmail.com', 10);

INSERT INTO Secretary (firstname, lastname, dateofbirth, phone, email, UserId)
VALUES ('Breanna', 'Shea', '1974-02-25', '+46700000010', 'BreannaS@gmail.com', 11);

INSERT INTO Secretary (firstname, lastname, dateofbirth, phone, email, UserId)
VALUES ('Miley', 'Haley', '1972-01-09', '+46700000011', 'MileyH@gmail.com', 12);

# Patients
INSERT INTO Patient (gender, ssNbr, firstname, lastname, address, dateofbirth, phone, DoctorId)
VALUES (1, '8604090000', 'Alex', 'Bengtsson', 'Granvägen 22', '1986-04-09', '+46700000012', 1);

INSERT INTO Patient (gender, ssNbr, firstname, lastname, address, dateofbirth, phone, DoctorId)
VALUES (1, '7612140000', 'Robert', 'Gustavsson', 'Ostvägen 3', '1976-12-14', '+46700000013', 1);

INSERT INTO Patient (gender, ssNbr, firstname, lastname, address, dateofbirth, phone, DoctorId)
VALUES (0, '5812140000', 'Ingrid', 'Ingvarsson', 'Lyxvägen 4', '1958-12-14', '+46700000014', 2);

INSERT INTO Patient (gender, ssNbr, firstname, lastname, address, dateofbirth, phone, DoctorId)
VALUES (0, '9108270000', 'Melina', 'Ekberg', 'Frölundavägen 10', '1991-08-27', '+46700000015', 3);

# PatientInfo
INSERT INTO PatientInfo (bloodPressure, weight, description, PatientId)
VALUES ('135/85', 78, 'Patient is having a panic attack, but other than that he seems fine.', 1);

INSERT INTO PatientInfo (bloodPressure, weight, description, PatientId)
VALUES ('140/95', 78,
 'Patient says that he getd often panic attacks, but now he seems sick now since he does not have a panic attack', 1);

INSERT INTO PatientInfo (bloodPressure, weight, description, PatientId)
VALUES ('80/60', 74, 'Patient does not seem fine.', 2);

INSERT INTO PatientInfo (bloodPressure, weight, description, PatientId)
VALUES ('125/85', 73, 'Patient has had problems with bloodpressure before, but seems in good health now', 2);

INSERT INTO PatientInfo (bloodPressure, weight, description, PatientId)
VALUES ('140/95', 65, 'Patient seems sick.', 4);

# DiagnosisType
INSERT INTO DiagnosisType (name) VALUES ('pneumonia');
INSERT INTO DiagnosisType (name) VALUES ('endocarditis');
INSERT INTO DiagnosisType (name) VALUES ('myositis');
INSERT INTO DiagnosisType (name) VALUES ('chorditis');

# AllergyType
INSERT INTO AllergyType (name) VALUES ('milk');
INSERT INTO AllergyType (name) VALUES ('cadmium');
INSERT INTO AllergyType (name) VALUES ('latex');
INSERT INTO AllergyType (name) VALUES ('egg');

# TreatmentType
INSERT INTO TreatmentType (name) VALUES ('antibiotic');
INSERT INTO TreatmentType (name) VALUES ('corticosteroid');
INSERT INTO TreatmentType (name) VALUES ('speech therapy');

# Allergy
INSERT INTO Allergy (AllergyTypeId, PatientId) VALUES (1, 4);
INSERT INTO Allergy (AllergyTypeId, PatientId) VALUES (1, 1);
INSERT INTO Allergy (AllergyTypeId, PatientId) VALUES (2, 1);
INSERT INTO Allergy (AllergyTypeId, PatientId) VALUES (3, 2);

# Treatment
INSERT INTO Treatment (description, TreatmentTypeId)
VALUES ('2 tablets (5+5 = 10 mg) should be taken in the morning', 1);
INSERT INTO Treatment (description, TreatmentTypeId)
VALUES ('3 tablets (5+5+5 = 15 mg) should be taken in the evening', 1);
INSERT INTO Treatment (description, TreatmentTypeId)
VALUES ('1 tablet (2 mg) should be taken in the evening', 2);
INSERT INTO Treatment (description, TreatmentTypeId)
VALUES ('A speech therapist should be visited 3 times a week', 3);

# Diagnosis
INSERT INTO Diagnosis (imageurl, PatientId, DoctorId, DiagnosisTypeId, TreatmentId) VALUES ('https://www.go-imaging.com/wp-content/uploads/2017/07/x-ray.jpg',1, 1, 1, 1);
INSERT INTO Diagnosis (imageurl, PatientId, DoctorId, DiagnosisTypeId, TreatmentId) VALUES ('http://pulsemedicalimaging.com.au/wp/wp-content/uploads/2015/04/xray3.jpg',2, 3, 2, 2);
INSERT INTO Diagnosis (imageurl, PatientId, DoctorId, DiagnosisTypeId, TreatmentId) VALUES ('https://physicsworld.com/wp-content/uploads/2014/02/PW-2014-02-25-Cartlidge-hyper.jpg',3, 2, 3, 3);
INSERT INTO Diagnosis (imageurl, PatientId, DoctorId, DiagnosisTypeId, TreatmentId) VALUES ('http://bedsidexray.com/wp-content/uploads/2014/10/Chest-X-Ray-Image.jpg',4, 1, 4, 4);
