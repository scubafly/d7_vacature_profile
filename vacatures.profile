<?php
/**
 * @file
 * Enables modules and site configuration for vacatures installation
 */

/**
 * Implements hook_form_FORM_ID_alter() for install_configure_form()
 *
 * Allows the profile to alter the sit configuration
 */
function vacatures_form_install_configure_form_alter(&$form, $form_state) {
	// Pre-populate the site name with the server name.
	$form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
}

function vacatures_install_tasks() {
  $enable = array(
    'theme_default' => 'at_biz',
    'admin_theme' => 'seven',
    //'zen'
  );
  theme_enable($enable);

  foreach ($enable as $var => $theme) {
    if (!is_numeric($var)) {
      variable_set($var, $theme);
    }
  }

  // Disable the default Bartik theme
  theme_disable(array('bartik'));
}
