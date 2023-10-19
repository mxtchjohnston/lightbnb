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

//could switch to a persistent log in future, A little curry action
const error = msg => err => console.log(msg ,err.message);

//if exists then return first object element, otherwise return null.  
const getFirst = res => res[0] ? res.rows[0] : null;
//NOT MEANT FOR USER INPUT, INTERNAL ONLY
const selectAll = config => `SELECT * FROM ${config.table} WHERE ${config.property} = $1`

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function (email) {
  return db
    .query(selectAll({table: 'users', property: 'email'}), [email])
    .then(getFirst)
    .catch(error('getUserWithEmail'));
};

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function (id) {
  return db
    .query(selectAll({table: 'user', property: 'id'}), [id])
    .then(getFirst)
    .catch(error('getUserWithId'));
};

/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser = function (user) {
  return db
    .query('INSERT INTO users (name, email, password) VALUES ($1, $2, $3) RETURNING *', [user.name, user.email, user.password])
    .catch(error);
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
