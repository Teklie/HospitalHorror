const express = require('express');
const router = express.Router();


// controller
const AuthCtrl = require('../controllers/auth.js');
const PatientInfoCtrl = require('../controllers/patientinfo.js');
const PatientAllergyCtrl = require('../controllers/patientallergy.js');
const PatientCtrl = require('../controllers/patient.js')

// RESTful API

// Admin
router.post('/register', AuthCtrl.register);
router.post('/login', AuthCtrl.login);
router.post('/logout', AuthCtrl.logout);

// Patient
router.get('/doctor', PatientCtrl.getAllPatients);

// PatientInfo
router.post('/patientinfo', PatientInfoCtrl.create);
router.put('/patientinfo/:id', PatientInfoCtrl.edit);
router.delete('/patientinfo/:id', PatientInfoCtrl.delete);

// PatientAllergy
router.post('/patientallergy', PatientAllergyCtrl.create);
router.put('/patientallergy/:id', PatientAllergyCtrl.edit);
router.delete('/patientallergy/:id', PatientAllergyCtrl.delete);

// TODO: put function in a controller
router.get('/home/:id', function(req, res) {
	res.sendFile('./views/home.html', { root: __dirname + "./../.." });
});

router.get('/admin', function (req, res) {
	console.log('Admin logged in');
	res.sendFile('./views/admin.html', { root: __dirname + "./../.." });
});

// router.get('/doctor', function (req, res) {
// 	console.log('Doctor logged in');
// 	//res.sendFile('./views/doctor.pug', { root: __dirname + "./../.." });

// });

// frontend routes =========================================================
// route to handle all other requests
router.get('*', function(req, res) {
	res.sendFile('./views/index.html', { root: __dirname + "./../.." });
});



module.exports = router;
