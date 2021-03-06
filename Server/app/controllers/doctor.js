const model = require('../models/');
const Sequelize = require('sequelize');
const app = require('../../server.js');
const online = require('./online.js');
const AuthCtrl = require('../controllers/auth.js');

module.exports.getDashboard = function(req, res){
		if(!AuthCtrl.isDoctor(req) && !AuthCtrl.isNurse(req)) {
				req.session.error = 'Only doctors & nurses can access this page.';
				req.session.errorcode = 403;
				res.redirect('/error/');
				return;
		}
		let usertype = req.session.user.userType;
		let typeModel = usertype === 'Doctor' ? model.Doctor : model.Nurse;

		Sequelize.Promise.all([
				model.Patient.findAll({
						attributes: ['firstname', 'lastname', 'id', 'dateofbirth'],
						limit: 20
				}),
				model.Nurse.findAll({
						attributes: ['id', 'firstname', 'lastname', 'UserId'],
						limit: 20,
						include: [
							{
								model: model.User
							}
						]
				}),
				model.Doctor.findAll({
						attributes: ['id', 'firstname', 'lastname', 'UserId'],
						limit: 20,
						include: [
							{
								model: model.User
							}
						]
				}),
				model.PatientInfo.findAll({
						where: {PatientId: '1'},
						attributes: ['bloodpressure','weight','PatientId', 'createdAt', 'description'],
					}),
				typeModel.findOne({
						where: {UserId: req.params.id},
						attributes: ['firstname', 'lastname']
				})
		]).spread((patients, nurses, doctors, patientInfo, username) => {
				res.render('dashboard', {
						patients: patients,
						nurses: nurses,
						doctors: doctors,
						patientInfo: patientInfo,
						username: username,
						usertype: usertype,
						onlineusers: online.getOnlineUsers,
						moment: require('moment')
				});

		}, err => {
			app.print(err);
			app.print("Internal Server Error");
			req.session.error = 'Internal Server Error.';
			req.session.errorcode = 500;
			res.redirect('/error/');
		});
};

module.exports.getDoctorProfile = function(req, res, next) {
	if(!AuthCtrl.isDoctor(req) && !AuthCtrl.isNurse(req)) {
			req.session.error = 'Only doctors & nurses can access this page.';
			req.session.errorcode = 403;
			res.redirect('/error/');
			return;
	}

	model.Doctor.findOne({
		where: {id: req.params.id},
	}).then(doctor => {
		res.render('doctorprofile', {doctor: doctor});
	}, err => {
		app.print(err);
		app.print("Internal Server Error");
		req.session.error = 'Internal Server Error.';
		req.session.errorcode = 500;
		res.redirect('/error/');
	});
};
