const cds = require("@sap/cds");
const debug = require("debug")("srv:catalog-service");

module.exports = cds.service.impl(async function () {
  const { Encontros } = this.entities;

  // this.after('READ', Encontros, (each) => {
  //     if (each.amount > 500) {
  //         each.criticality = 3;
  //         if (each.comments === null)
  //             each.comments = '';
  //         else
  //             each.comments += ' ';
  //         each.comments += 'Exceptional!';
  //         debug(each.comments, {"country": each.country, "amount": each.amount});
  //     } else if (each.amount < 150) {
  //         each.criticality = 1;
  //     } else {
  //         each.criticality = 2;
  //     }
  // });

  this.on("userInfo", (req) => {
    let results = {};
    results.user = req.user.id;
    if (req.user.hasOwnProperty("locale")) {
      results.locale = req.user.locale;
    }
    results.scopes = {};
    results.scopes.identified = req.user.is("identified-user");
    results.scopes.authenticated = req.user.is("authenticated-user");
    results.scopes.Viewer = req.user.is("Viewer");
    results.scopes.Admin = req.user.is("Admin");
    return results;
  });
});
