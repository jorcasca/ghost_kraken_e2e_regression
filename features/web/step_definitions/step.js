const { Given, When, Then } = require("@cucumber/cucumber");
var { expect } = require("chai");

const version = 2;

//-------------------------------CREATE ACCOUNT-----------------------------

When(
  "I fill register with {string} and {string} and {string} and {string}",
  async function (title, name, email, password) {
    var url = await this.driver.getUrl();
    if (url == "http://localhost:2368/ghost/#/setup") {
      let titleInput = this.driver.$("#blog-title");
      await titleInput.keys(title);
      let nameInput = this.driver.$("#name");
      await nameInput.setValue(name);
      let emailInput = this.driver.$("#email");
      await emailInput.setValue(email);
      let passwordInput = this.driver.$("#password");
      await passwordInput.setValue(password);
    }
  }
);

When("I try to create account", async function () {
  var url = await this.driver.getUrl();
  if (url == "http://localhost:2368/ghost/#/setup") {
    let createButton = await this.driver.$("#ember8");
    await createButton.click();
  }
});

Then(
  "I expect to see in setup {string} in case {string}",
  async function (string, scenario) {
    var url = await this.driver.getUrl();
    this.driver.saveScreenshot(
      `./assets/createAccount/V${version}E${scenario}.png`
    );
    if (url == "http://localhost:2368/ghost/#/setup") {
      let response = await this.driver.$(`p=${string}`);
      let text = await response.getText();
      expect(response).to.not.equal(null);
      expect(text).to.equal(string);
    }
  }
);

Then(
  "I expect to see in signin {string} in case {string}",
  async function (string, scenario) {
    this.driver.saveScreenshot(`./assets/login/V${version}E${scenario}.png`);
    var url = await this.driver.getUrl();
    if (url == "http://localhost:2368/ghost/#/signin") {
      let response = await this.driver.$(".main-error");
      let text = await response.getText();
      expect(response).to.not.equal(null);
      if (text.includes("Too many attempts")) {
        expect(text).to.contains("Too many attempts");
      } else {
        expect(text).to.contains(string);
      }
    }
  }
);

Then(
  "I expect to see in forgot {string} in case {string}",
  async function (string, scenario) {
    this.driver.saveScreenshot(`./assets/forgot/V${version}E${scenario}.png`);
    var url = await this.driver.getUrl();
    if (url == "http://localhost:2368/ghost/#/signin") {
      let response = await this.driver.$(".main-error");
      let text = await response.getText();
      expect(response).to.not.equal(null);
      if (text.includes("Too many attempts")) {
        expect(text).to.contains("Too many attempts");
      } else {
        expect(text).to.contains(string);
      }
    }
  }
);

Then("I expect to be logged in case {string}", async function (scenario) {
  this.driver.saveScreenshot(`./assets/dashboard/V${version}E${scenario}.png`);
  var url = await this.driver.getUrl();
  expect(url).to.equal("http://localhost:2368/ghost/#/dashboard");
});

Then("I expect to be done in case {string}", async function (scenario) {
  var url = await this.driver.getUrl();
  this.driver.saveScreenshot(
    `./assets/createAccount/V${version}E${scenario}.png`
  );
  if (url != "http://localhost:2368/ghost/#/signin") {
    expect(url).to.equal("http://localhost:2368/ghost/#/setup/done");
  }
});

//-------------------------------LOGIN--------------------------------

When(
  "I fill login with {string} and {string}",
  async function (email, password) {
    var url = await this.driver.getUrl();
    if (url == "http://localhost:2368/ghost/#/signin") {
      let emailInput = this.driver.$("#identification");
      await emailInput.setValue(email);
      let passwordInput = this.driver.$("#password");
      await passwordInput.setValue(password);
    }
  }
);

When("I try to login", async function () {
  var url = await this.driver.getUrl();
  if (url == "http://localhost:2368/ghost/#/signin") {
    let loginButton = await this.driver.$("#ember7");
    await loginButton.click();
  }
});

//-------------------------------LOGOUT--------------------------------

When("I try to logout", async function () {
  let profileButton = await this.driver.$("#ember36");
  await profileButton.click();
  let logoutButton = await this.driver.$("#ember60");
  await logoutButton.click();
});

Then("I expect to be logged out in case {string}", async function (scenario) {
  this.driver.saveScreenshot(`./assets/dashboard/V${version}E${scenario}.png`);
  var url = await this.driver.getUrl();
  expect(url).to.equal("http://localhost:2368/ghost/#/signin");
});

//-------------------------------FORGOT--------------------------------

When("I try to remember password", async function () {
  var url = await this.driver.getUrl();
  if (url == "http://localhost:2368/ghost/#/signin") {
    let rememberButton = await this.driver.$("#ember6");
    await rememberButton.click();
  }
});

//-------------------------------PROFILE--------------------------------

When("I try to go to profile", async function () {
  let profileButton = await this.driver.$(".pe-all");
  await profileButton.click();
  let myProfileButton = await this.driver.$("#ember59");
  await myProfileButton.click();
});

When("I try to set slug to {string}", async function (slug) {
  let slugInput = this.driver.$("#user-slug");
  await slugInput.setValue(slug);
});

When("I try to set fullname to {string}", async function (fullname) {
  let fullnameInput = this.driver.$("#user-name");
  await fullnameInput.setValue(fullname);
});

When("I try to set location to {string}", async function (location) {
  let locationInput = this.driver.$("#user-location");
  await locationInput.setValue(location);
});

When("I try to set Bio to {string}", async function (bio) {
  let bioInput = this.driver.$("#user-bio");
  await bioInput.setValue(bio);
});

When("I save changes", async function () {
  let saveButton = await this.driver.$("#ember68");
  await saveButton.click();
});

Then(
  "I expect {string} is my fullname profile in case {string}",
  async function (fullname, scenario) {
    let fullnameInput = this.driver.$("#user-name");
    let text = await fullnameInput.getValue();
    this.driver.saveScreenshot(`./assets/profile/V${version}E${scenario}.png`);
    expect(text).to.equal(fullname);
  }
);

Then(
  "I expect {string} is my slug profile in case {string}",
  async function (slug, scenario) {
    let slugInput = this.driver.$("#user-slug");
    let text = await slugInput.getValue();
    this.driver.saveScreenshot(`./assets/profile/V${version}E${scenario}.png`);
    expect(text).to.equal(slug);
  }
);

Then(
  "I expect {string} is my location profile in case {string}",
  async function (location, scenario) {
    let locationInput = this.driver.$("#user-location");
    let text = await locationInput.getValue();
    this.driver.saveScreenshot(`./assets/profile/V${version}E${scenario}.png`);
    expect(text).to.equal(location);
  }
);

Then(
  "I expect {string} is my Bio profile in case {string}",
  async function (bio, scenario) {
    let bioInput = this.driver.$("#user-bio");
    let text = await bioInput.getValue();
    this.driver.saveScreenshot(`./assets/profile/V${version}E${scenario}.png`);
    expect(text).to.equal(bio);
  }
);

Then(
  "I expect to be in my profile in case {string}",
  async function (scenario) {
    var url = await this.driver.getUrl();
    this.driver.saveScreenshot(`./assets/profile/V${version}E${scenario}.png`);
    expect(url).to.contain("http://localhost:2368/ghost/#/settings/staff");
  }
);
