// 2_AddressBook_migration.js

const Migration = artifacts.require("MemoryArray");

module.exports = function (deployer) {
  deployer.deploy(Migration);
};
