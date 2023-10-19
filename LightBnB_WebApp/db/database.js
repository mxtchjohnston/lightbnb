require('dotenv').config();
const properties = require("./json/properties.json");
const users = require("./json/users.json");

const { Pool } = require('pg');

//immediate invocation pattern
const db = function($) {
  return new Pool({
    user:     $.DB_USER,
    password: $.DB_PASS,
    host:     $.DB_HOST,
    database: $.DB_BASE
  })
}(process.env);

//could switch to a persistent log in future
const error = err => console.log(err.message);

//if exists then return first object element, otherwise return null.  
const getFirst = res => res[0] ? res.rows[0] : null;

const selectAll = 'SELECT * FROM $2 WHERE p = $1'

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function (email) {
  return db
    .query(selectAll, [email, 'users'])
    .then(getFirst)
    .catch(error);
};

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function (id) {
  return db
    .query(selectAll, [id, 'users'])
    .then(getFirst)
    .catch(error);
};

/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser = function (user) {
  const userId = Object.keys(users).length + 1;
  user.id = userId;
  users[userId] = user;
  return Promise.resolve(user);
};

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function (guest_id, limit = 10) {
  return getAllProperties(null, 2);
};

/// Properties

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function (options, limit = 10) {
  return db
    .query('SELECT * FROM properties LIMIT $1', [limit])
    .then(res => res.rows)
    .catch(error);
};

/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function (property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
};

module.exports = {
  getUserWithEmail,
  getUserWithId,
  addUser,
  getAllReservations,
  getAllProperties,
  addProperty,
};
