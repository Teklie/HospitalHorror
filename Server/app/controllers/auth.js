const model = require('../models/');
const controller = require('../controllers/patient.js');
const  bCrypt= require('bcryptjs');

module.exports.login = function(req, res, next) {
	// debug
	// console.log(req.body);
	model.User.findOne({
		where: {
			username: req.body.username,
			password: req.body.password // encryptPassword(req.body.password)
		}

	}).then(user => {

		if (user) {
			// set the session cookie
			req.session.user = user;

			let userinfo = user.get({plain: true});
			console.log(userinfo);
			if (userinfo.userType === 'Admin')
				res.redirect('/admin/');
			else if (userinfo.userType === 'Doctor')
				res.redirect('/doctor/');
			else if (userinfo.userType === 'Nurse')
				res.redirect('/doctor/');
			else
				res.redirect('/secretary/');

		} else {
			console.log("Wrong login-credentials");
			// TODO: display error message in frontend
			req.session.error = 'Username or password is wrong.';
			req.session.errorcode = 401;
			res.redirect('/error/');
		}

	}, err => {
		console.log("Error logging in");
		console.log(err);
		req.session.error = 'There was an error logging in. Please try again later.';
		req.session.errorcode = 500;
		res.redirect('/error/');
	});
};


module.exports.register = function (req, res, next) {
	if (!isAdmin(req)) {
		req.session.error = 'Admin privileges not found. User not created.';
		req.session.errorcode = 403;
		res.redirect('/error/');
		return;
	}

	model.User.findOrCreate({
		where: {username: req.body.username},
		defaults: {password: req.body.password, userType: req.body.usertype}
	}).spread((user, created) => {
		//Check if user was created or if it already exists
		if (created) {
			console.log('User successfully created');
			console.log(req.body.username + ' ' + req.body.password);

			//Check user type and create corresponding model
			if (req.body.usertype === 'Doctor') {
				model.Doctor.create({
					firstname: req.body.firstname, lastname: req.body.lastname,
					dateofbirth: req.body.dateofbirth, phone: req.body.phone,
					email: req.body.email, UserId: user.id
				}).then(doctor => {
					// let info = doctor.get({plain:true})
					console.log('Doctor created');
					req.session.destroy();
					// TODO: redirect to appropriate page
					res.redirect('/');
				}, err => {
					console.log(err);
					req.session.error = 'There was an error creating your account. Please try again later.';
					req.session.errorcode = 500;
					res.redirect('/error/');
				});
			}

			else if (req.body.usertype === 'Nurse') {
				model.Nurse.create({
						firstname: req.body.firstname, lastname: req.body.lastname,
						dateofbirth: req.body.dateofbirth, phone: req.body.phone,
						email: req.body.email, UserId: user.id
					}).then(nurse => {
						// let info = nurse.get({plain:true})
						console.log('Nurse created');
						req.session.destroy();
						// TODO: redirect to appropriate page
						res.redirect('/');
					}, err => {
						console.log(err);
						req.session.error = 'There was an error creating your account. Please try again later.';
						req.session.errorcode = 500;
						res.redirect('/error/');
					});
				}

			else {
				model.Secretary.create({
					firstname: req.body.firstname, lastname: req.body.lastname,
					dateofbirth: req.body.dateofbirth, phone: req.body.phone,
					email: req.body.email, UserId: user.id
				}).then(secretary => {
					// let info = secretary.get({plain:true})
					console.log('Secretary created');
					req.session.destroy();
					// TODO: redirect to appropriate page
					res.redirect('/');
				}, err => {
					console.log(err);
					req.session.error = 'There was an error creating your account. Please try again later.';
					req.session.errorcode = 500;
					res.redirect('/error/');
				});
			}

		}
		else {
			console.log('User with this username already found');
			req.session.error = 'Username taken. Please try something else.';
			req.session.errorcode = 400;
			res.redirect('/error/');
		}
	});

};

module.exports.logout = function(req, res, next) {
	console.log(req.session.user);
	res.clearCookie('connect.sid');
	req.session.destroy();
	res.redirect('/');
};

function isAdmin(req) {
	return req.session.user && req.session.user.userType === 'Admin';
}
module.exports.isAdmin = isAdmin;

function isDoctor(req) {
	return req.session.user && req.session.user.userType === 'Doctor';
}
module.exports.isDoctor = isDoctor;

function isNurse(req) {
	return req.session.user && req.session.user.userType === 'Nurse';
}
module.exports.isNurse = isNurse;

function isSecretary(req) {
	return req.session.user && req.session.user.userType === 'Secretary';
}
module.exports.isSecretary = isSecretary;

function encryptPassword(password) {
    return bCrypt.hashSync(password, bCrypt.genSaltSync(8), null);
}
module.exports.encryptPassword = encryptPassword;
