function toggle_home_address() {
  const checked = $("input#form_inputs_home_address").prop("checked");
  $("fieldset#home-address-fields input").prop("disabled", !checked);
  $("fieldset#home-address-fields select").prop("disabled", !checked);
}

function toggle_parents_address() {
  const checked = $("input#form_inputs_parents_address").prop("checked");
  $("fieldset#parents-address-fields input").prop("disabled", !checked);
  $("fieldset#parents-address-fields select").prop("disabled", !checked);
}

