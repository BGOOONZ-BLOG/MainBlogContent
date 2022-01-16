/*global assert*/

var rfs = require("../lib/rfs");

exports.name = "fork-stepUpAndDown";
exports.landscape = "HTMLInputElement.stepUp(n) cannot cause the value to decrease and HTMLInputElement.stepDown(n) cannot cause the value to increase.";
exports.transform = function (data) {
    assert("value",
      $("#common-input-element-apis\\:concept-fe-value-21")).parent()
      .append(" Let <var>current value</var> be the same as <var>value</var>.");
    ;
    assert("allowed value step",
      $("#common-input-element-apis\\:concept-input-step-8")).parent()
      .after(data.newsteps);
    ;
};
exports.params = function () {
    return [{
        newsteps: rfs("res/the-input-element/stepUpAndDown.html")
    }];
};
