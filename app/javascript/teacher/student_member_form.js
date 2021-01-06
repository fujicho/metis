function toggle_home_address_fields() {
  const checked = $("input#form_inputs_home_address").prop("checked");
  $("fieldset#home-address-fields input").prop("disabled", !checked);
  $("fieldset#home-address-fields select").prop("disabled", !checked);
}

function toggle_parents_address_fields() {
  const checked = $("input#form_inputs_parents_address").prop("checked");
  $("fieldset#parents-address-fields input").prop("disabled", !checked);
  $("fieldset#parents-address-fields select").prop("disabled", !checked);
}

$(document).on("ready turbolinks:load", () => {
  toggle_home_address_fields();
  toggle_parents_address_fields();
  $("input#form_inputs_home_address").on("click", () => {
    toggle_home_address_fields();
  });
  $("input#form_inputs_parents_address").on("click", () => {
    toggle_parents_address_fields();
  });
});