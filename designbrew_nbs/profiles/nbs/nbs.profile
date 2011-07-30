<?php

/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * @return
 *   An array of modules to enable.
 */
function nbs_profile_modules() {
  return array('color', 'comment', 'help', 'menu', 'taxonomy', 'dblog',
		// other modules
		'path', 'token', 'pathauto', 'tinymce', 'imce', 'champion', 'partner', 'news', 'main',
	);
}

/**
 * Return a description of the profile for the initial installation screen.
 *
 * @return
 *   An array with keys 'name' and 'description' describing this profile,
 *   and optional 'language' to override the language selection for
 *   language-specific profiles.
 */
function nbs_profile_details() {
  return array(
    'name' => 'NBS',
    'description' => 'This is a customed profile installer for No Bag, Salamat!'
  );
}

/**
 * Return a list of tasks that this profile supports.
 *
 * @return
 *   A keyed array of tasks the profile will perform during
 *   the final stage. The keys of the array will be used internally,
 *   while the values will be displayed to the user in the installer
 *   task list.
 */
function nbs_profile_task_list() {
}

/**
 * Perform any final installation tasks for this profile.
 *
 * The installer goes through the profile-select -> locale-select
 * -> requirements -> database -> profile-install-batch
 * -> locale-initial-batch -> configure -> locale-remaining-batch
 * -> finished -> done tasks, in this order, if you don't implement
 * this function in your profile.
 *
 * If this function is implemented, you can have any number of
 * custom tasks to perform after 'configure', implementing a state
 * machine here to walk the user through those tasks. First time,
 * this function gets called with $task set to 'profile', and you
 * can advance to further tasks by setting $task to your tasks'
 * identifiers, used as array keys in the hook_profile_task_list()
 * above. You must avoid the reserved tasks listed in
 * install_reserved_tasks(). If you implement your custom tasks,
 * this function will get called in every HTTP request (for form
 * processing, printing your information screens and so on) until
 * you advance to the 'profile-finished' task, with which you
 * hand control back to the installer. Each custom page you
 * return needs to provide a way to continue, such as a form
 * submission or a link. You should also set custom page titles.
 *
 * You should define the list of custom tasks you implement by
 * returning an array of them in hook_profile_task_list(), as these
 * show up in the list of tasks on the installer user interface.
 *
 * Remember that the user will be able to reload the pages multiple
 * times, so you might want to use variable_set() and variable_get()
 * to remember your data and control further processing, if $task
 * is insufficient. Should a profile want to display a form here,
 * it can; the form should set '#redirect' to FALSE, and rely on
 * an action in the submit handler, such as variable_set(), to
 * detect submission and proceed to further tasks. See the configuration
 * form handling code in install_tasks() for an example.
 *
 * Important: Any temporary variables should be removed using
 * variable_del() before advancing to the 'profile-finished' phase.
 *
 * @param $task
 *   The current $task of the install system. When hook_profile_tasks()
 *   is first called, this is 'profile'.
 * @param $url
 *   Complete URL to be used for a link or form action on a custom page,
 *   if providing any, to allow the user to proceed with the installation.
 *
 * @return
 *   An optional HTML string to display to the user. Only used if you
 *   modify the $task, otherwise discarded.
 */
function nbs_profile_tasks(&$task, $url) {
  // Insert default user-defined node types into the database. For a complete
  // list of available node type attributes, refer to the node type API
  // documentation at: http://api.drupal.org/api/HEAD/function/hook_node_info.
  $types = array(
    array(
      'type' => 'page',
      'name' => st('Page'),
      'module' => 'node',
      'description' => st("A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site's initial home page."),
      'custom' => TRUE,
      'modified' => TRUE,
      'locked' => FALSE,
      'help' => '',
      'min_word_count' => '',
    ),
    /*
    array(
      'type' => 'story',
      'name' => st('Story'),
      'module' => 'node',
      'description' => st("A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site's initial home page, and provides the ability to post comments."),
      'custom' => TRUE,
      'modified' => TRUE,
      'locked' => FALSE,
      'help' => '',
      'min_word_count' => '',
    ),
    */
  );

  foreach ($types as $type) {
    $type = (object) _node_type_set_defaults($type);
    node_type_save($type);
  }

  // Default page to not be promoted and have comments disabled.
  variable_set('node_options_page', array('status'));
  variable_set('comment_page', COMMENT_NODE_DISABLED);

  // Don't display date and author information for page nodes by default.
  $theme_settings = variable_get('theme_settings', array());
  $theme_settings['toggle_node_info_page'] = FALSE;
  variable_set('theme_settings', $theme_settings);

  // set themes
  variable_set('admin_theme', 'garland');
  variable_set('node_admin_theme', 1);
  variable_set('theme_default', 'green');

  // set permissions
  db_query("UPDATE {permission} SET perm = 'access comments, access content, post comments, post comments without approval, access tinymce, administer tinymce' WHERE rid = 2");

  // initialize tinymce
  $edit = array(
    'name' => 'default',
    'rids' => array(2 => '2'),
    'default' => 'true',
    'user_choose' => 'false',
    'show_toggle' => 'true',
    'theme' => advanced,
    'language' => 'en',
    'safari_message' => 'false',
    'access' => 1,
    'access_pages' => 'node/*
user/*
comment/*
admin/settings/champions
admin/settings/partners',
    'buttons' => array('default-cut' => '1',
      'default-copy' => '1',
      'default-paste' => '1',
      'default-bold' => '1',
      'default-italic' => '1',
      'default-underline' => '1',
      'default-justifyleft' => '1',
      'default-justifycenter' => '1',
      'default-justifyright' => '1',
      'default-justifyfull' => '1',
      'default-bullist' => '1',
      'default-numlist' => '1',
      'default-outdent' => '1',
      'default-indent' => '1',
      'default-undo' => '1',
      'default-redo' => '1',
      'default-link' => '1',
      'default-unlink' => '1',
      'default-image' => '1',
      'default-code' => '1',
      'default-fontselect' => '1',
      'default-fontsizeselect' => '1',
      'default-sub' => '1',
      'default-sup' => '1',
      'default-blockquote' => '1',
      'advimage' => '1',
      'font-fontselect' => '1',
      'font-fontsizeselect' => '1',
      'table-tablecontrols' => '1'),
    'toolbar_loc' => 'top',
    'toolbar_align' => 'left',
    'path_loc' => 'bottom',
    'resizing' => 'true',
    'block_formats' => 'p,address,pre,h1,h2,h3,h4,h5,h6',
    'verify_html' => 'true',
    'preformatted' => 'false',
    'convert_fonts_to_spans' => 'true',
    'remove_linebreaks' => 'true',
    'apply_source_formatting' => 'true',
    'css_setting' => 'theme',
    'css_path' => '',
    'css_classes' => '',
    'op' => 'Create profile',
    'form_build_id' => 'form-101203908424c0b7faec08cfde8b0da8',
    'form_token' => '5c71e443a8274e45f905611b0f1a6ba0',
    'form_id' => 'tinymce_profile_form_build'
  );

  db_query("INSERT INTO {tinymce_settings} (name, settings) VALUES ('%s', '%s')", $edit['name'], serialize($edit));
  db_query("INSERT INTO {tinymce_role} (name, rid) VALUES ('%s', %d)", $edit['name'], 2);
  
  //
  variable_set('node_options_champion', array('status', FALSE));
  variable_set('node_options_partner', array('status', FALSE));
  variable_set('node_options_news', array('status', FALSE));

  variable_set('number_of_individuals_who_pledged', '1');
  variable_set('combined_days_to_live_disposable_bag_free', '1');

  variable_set('filter_default_format', '2');

  // initialize how to be a champion
  variable_set('champion_how_to_be', '<p><strong>Why do we have Champions?</strong></p>
<p>With their different profiles, our Champions send the message that everyone is can be a part of the solution and that they have the power to reach different circles!</p>
<p><strong>You can be a champion, too! How?</strong></p>
<ol>
<li>Get the <a title="The Pin" href="/pin" target="_blank">Pin</a> and make the <a title="Make the Pledge" href="/make-pledge" target="_blank">Pledge</a> to live disposable bag-free.</li>
<li>Get 10 more Pins and get 10 of your friends to make the Pledge, too.</li>
<li>Send a picture or yourself with your pin and reusable bag and a short write-up about yourself.</li>
<li>Spread the word!</li>
</ol>');

  variable_set('partner_how_to_help', '<p><strong>Easy Ways You Can Contribute:</strong></p>
<ol>
<li>Help your customers say No. Train your staff to first ask customers (with a smile) if they need a bag, instead of automatically bagging purchases.</li>
<li>Remind staff not to double bag, unless insisted upon by the customer.</li>
<li>Charge a small price for plastic bags or offer discounts to customers who bring their own.</li>
<li>Supply reusable bags with your logo, giving customers an alternative while promoting your store.</li>
<li>Educate customers about your bag policy by posting a notice on your display, by the register, or at the bottom of receipts.</li>
<li>Team up with other retailers to buy reusable bags in bulk and save money.</li>
</ol>');

  variable_set('what_does_it_really_mean', '<p><strong>What does it really mean?</strong</p>
<ol>
<li>Not taking a bag unless you really need it, whether paper or plastic</li>
<li>Coming prepared with your own bag</li>
<li>Reusing bags you already have at home</li>
<li>Opting for products that use less packaging and are packaged in renewable materials</li>
</ol>');

  variable_set('easy_ways_to_live_the_pledge', '<p><strong>Easy Ways to Live the NBS Pledge</strong></p>
<ol>
<li>Refuse a plastic bag if you can carry your purchase – it’s that simple!</li>
<li>Plan your shopping trips so you can bring your own bags, baskets, or collapsible crates.</li>
<li>Keep a reusable bag in your car or carry one in your purse just in case you make an impromptu purchase.</li>
<li>Choose products with less packaging.</li>
<li>Opt for more environmentally sensible containers like metal or glass. You can also use wax paper.</li>
<li>Encourage your favorite retailers to stop giving away plastic bags.</li>
</ol>');

  // Create Country Taxonomy
  db_query("INSERT INTO {vocabulary} 
      (vid, name, description, help, relations, hierarchy, multiple, required, tags, module, weight) 
    VALUES 
      (%d, '%s', '%s', '%s', %d, %d, %d, %d, %d, '%s', %d)", 
      1, 'Country', '', '', 1, 0, 0, 1, 0, 'taxonomy', 0
  );

  db_query("INSERT INTO {vocabulary_node_types}
      (vid, type)
    VALUES
      (%d, '%s')",
      1, 'news'
  );

  $countries[] = 'Philippines';
  $countries[] = 'Afghanistan';
  $countries[] = 'Aland Islands';
  $countries[] = 'Albania';
  $countries[] = 'Algeria';
  $countries[] = 'American Samoa';
  $countries[] = 'Andorra';
  $countries[] = 'Angola';
  $countries[] = 'Anguilla';
  $countries[] = 'Antarctica';
  $countries[] = 'Antigua and Barbuda';
  $countries[] = 'Argentina';
  $countries[] = 'Armenia';
  $countries[] = 'Aruba';
  $countries[] = 'Australia';
  $countries[] = 'Austria';
  $countries[] = 'Azerbaijan';
  $countries[] = 'Bahamas';
  $countries[] = 'Bahrain';
  $countries[] = 'Bangladesh';
  $countries[] = 'Barbados';
  $countries[] = 'Belarus';
  $countries[] = 'Belgium';
  $countries[] = 'Belize';
  $countries[] = 'Benin';
  $countries[] = 'Bermuda';
  $countries[] = 'Bhutan';
  $countries[] = 'Bolivia';
  $countries[] = 'Bosnia and Herzegovina';
  $countries[] = 'Botswana';
  $countries[] = 'Bouvet Island';
  $countries[] = 'Brazil';
  $countries[] = 'British Indian Ocean Territory';
  $countries[] = 'Brunei Darussalam';
  $countries[] = 'Bulgaria';
  $countries[] = 'Burkina Faso';
  $countries[] = 'Burundi';
  $countries[] = 'Cambodia';
  $countries[] = 'Cameroon';
  $countries[] = 'Canada';
  $countries[] = 'Cape Verde';
  $countries[] = 'Caribbean Nations';
  $countries[] = 'Cayman Islands';
  $countries[] = 'Central African Republic';
  $countries[] = 'Chad';
  $countries[] = 'Chile';
  $countries[] = 'China';
  $countries[] = 'Christmas Island';
  $countries[] = 'Cocos (Keeling) Islands';
  $countries[] = 'Colombia';
  $countries[] = 'Comoros';
  $countries[] = 'Congo';
  $countries[] = 'Cook Islands';
  $countries[] = 'Costa Rica';
  $countries[] = 'Cote DIvoire (Ivory Coast)';
  $countries[] = 'Croatia';
  $countries[] = 'Cuba';
  $countries[] = 'Cyprus';
  $countries[] = 'Czech Republic';
  $countries[] = 'Democratic Republic of the Congo';
  $countries[] = 'Denmark';
  $countries[] = 'Djibouti';
  $countries[] = 'Dominica';
  $countries[] = 'Dominican Republic';
  $countries[] = 'East Timor';
  $countries[] = 'Ecuador';
  $countries[] = 'Egypt';
  $countries[] = 'El Salvador';
  $countries[] = 'Equatorial Guinea';
  $countries[] = 'Eritrea';
  $countries[] = 'Estonia';
  $countries[] = 'Ethiopia';
  $countries[] = 'Falkland Islands (Malvinas)';
  $countries[] = 'Faroe Islands';
  $countries[] = 'Federated States of Micronesia';
  $countries[] = 'Fiji';
  $countries[] = 'Finland';
  $countries[] = 'France';
  $countries[] = 'France, Metropolitan';
  $countries[] = 'French Guiana';
  $countries[] = 'French Polynesia';
  $countries[] = 'French Southern Territories';
  $countries[] = 'Gabon';
  $countries[] = 'Gambia';
  $countries[] = 'Georgia';
  $countries[] = 'Germany';
  $countries[] = 'Ghana';
  $countries[] = 'Gibraltar';
  $countries[] = 'Greece';
  $countries[] = 'Greenland';
  $countries[] = 'Grenada';
  $countries[] = 'Guadeloupe';
  $countries[] = 'Guam';
  $countries[] = 'Guatemala';
  $countries[] = 'Guinea';
  $countries[] = 'Guinea-Bissau';
  $countries[] = 'Guyana';
  $countries[] = 'Haiti';
  $countries[] = 'Heard Island and McDonald Islands';
  $countries[] = 'Honduras';
  $countries[] = 'Hong Kong';
  $countries[] = 'Hungary';
  $countries[] = 'Iceland';
  $countries[] = 'India';
  $countries[] = 'Indonesia';
  $countries[] = 'Iran';
  $countries[] = 'Iraq';
  $countries[] = 'Ireland';
  $countries[] = 'Israel';
  $countries[] = 'Italy';
  $countries[] = 'Jamaica';
  $countries[] = 'Japan';
  $countries[] = 'Jordan';
  $countries[] = 'Kazakhstan';
  $countries[] = 'Kenya';
  $countries[] = 'Kiribati';
  $countries[] = 'Korea';
  $countries[] = 'Korea (North)';
  $countries[] = 'Kuwait';
  $countries[] = 'Kyrgyzstan';
  $countries[] = 'Laos';
  $countries[] = 'Latvia';
  $countries[] = 'Lebanon';
  $countries[] = 'Lesotho';
  $countries[] = 'Liberia';
  $countries[] = 'Libya';
  $countries[] = 'Liechtenstein';
  $countries[] = 'Lithuania';
  $countries[] = 'Luxembourg';
  $countries[] = 'Macao';
  $countries[] = 'Macedonia';
  $countries[] = 'Madagascar';
  $countries[] = 'Malawi';
  $countries[] = 'Malaysia';
  $countries[] = 'Maldives';
  $countries[] = 'Mali';
  $countries[] = 'Malta';
  $countries[] = 'Marshall Islands';
  $countries[] = 'Martinique';
  $countries[] = 'Mauritania';
  $countries[] = 'Mauritius';
  $countries[] = 'Mayotte';
  $countries[] = 'Mexico';
  $countries[] = 'Moldova';
  $countries[] = 'Monaco';
  $countries[] = 'Mongolia';
  $countries[] = 'Montserrat';
  $countries[] = 'Morocco';
  $countries[] = 'Mozambique';
  $countries[] = 'Myanmar';
  $countries[] = 'Namibia';
  $countries[] = 'Nauru';
  $countries[] = 'Nepal';
  $countries[] = 'Netherlands';
  $countries[] = 'Netherlands Antilles';
  $countries[] = 'New Caledonia';
  $countries[] = 'New Zealand';
  $countries[] = 'Nicaragua';
  $countries[] = 'Niger';
  $countries[] = 'Nigeria';
  $countries[] = 'Niue';
  $countries[] = 'Norfolk Island';
  $countries[] = 'Northern Mariana Islands';
  $countries[] = 'Norway';
  $countries[] = 'Other';
  $countries[] = 'Pakistan';
  $countries[] = 'Palau';
  $countries[] = 'Palestinian Territory';
  $countries[] = 'Panama';
  $countries[] = 'Papua New Guinea';
  $countries[] = 'Paraguay';
  $countries[] = 'Peru';
  $countries[] = 'Pitcairn';
  $countries[] = 'Poland';
  $countries[] = 'Portugal';
  $countries[] = 'Puerto Rico';
  $countries[] = 'Qatar';
  $countries[] = 'Reunion';
  $countries[] = 'Romania';
  $countries[] = 'Russian Federation';
  $countries[] = 'Rwanda';
  $countries[] = 'S. Georgia and S. Sandwich Islands';
  $countries[] = 'Saint Helena';
  $countries[] = 'Saint Kitts and Nevis';
  $countries[] = 'Saint Lucia';
  $countries[] = 'Saint Pierre and Miquelon';
  $countries[] = 'Saint Vincent and the Grenadines';
  $countries[] = 'Samoa';
  $countries[] = 'San Marino';
  $countries[] = 'Sao Tome and Principe';
  $countries[] = 'Saudi Arabia';
  $countries[] = 'Senegal';
  $countries[] = 'Serbia and Montenegro';
  $countries[] = 'Seychelles';
  $countries[] = 'Sierra Leone';
  $countries[] = 'Singapore';
  $countries[] = 'Slovak Republic';
  $countries[] = 'Slovenia';
  $countries[] = 'Solomon Islands';
  $countries[] = 'Somalia';
  $countries[] = 'South Africa';
  $countries[] = 'Spain';
  $countries[] = 'Sri Lanka';
  $countries[] = 'Sudan';
  $countries[] = 'Sultanate of Oman';
  $countries[] = 'Suriname';
  $countries[] = 'Svalbard and Jan Mayen';
  $countries[] = 'Swaziland';
  $countries[] = 'Sweden';
  $countries[] = 'Switzerland';
  $countries[] = 'Syria';
  $countries[] = 'Taiwan';
  $countries[] = 'Tajikistan';
  $countries[] = 'Tanzania';
  $countries[] = 'Thailand';
  $countries[] = 'Timor-Leste';
  $countries[] = 'Togo';
  $countries[] = 'Tokelau';
  $countries[] = 'Tonga';
  $countries[] = 'Trinidad and Tobago';
  $countries[] = 'Tunisia';
  $countries[] = 'Turkey';
  $countries[] = 'Turkmenistan';
  $countries[] = 'Turks and Caicos Islands';
  $countries[] = 'Tuvalu';
  $countries[] = 'Uganda';
  $countries[] = 'Ukraine';
  $countries[] = 'United Arab Emirates';
  $countries[] = 'United Kingdom';
  $countries[] = 'United States';
  $countries[] = 'Uruguay';
  $countries[] = 'Uzbekistan';
  $countries[] = 'Vanuatu';
  $countries[] = 'Vatican City State (Holy See)';
  $countries[] = 'Venezuela';
  $countries[] = 'Viet Nam';
  $countries[] = 'Virgin Islands (British)';
  $countries[] = 'Virgin Islands (U.S.)';
  $countries[] = 'Wallis and Futuna';
  $countries[] = 'Western Sahara';
  $countries[] = 'Yemen';
  $countries[] = 'Yugoslavia';
  $countries[] = 'Zambia';
  $countries[] = 'Zimbabwe';

  nbs_term_save($countries);

  variable_set('pathauto_ignore_words', '');
  variable_set('pathauto_node_pattern', '[title-raw]');
  variable_set('pathauto_node_champion_pattern', 'champion/[title-raw]');
  variable_set('pathauto_node_news_pattern', 'news/[yyyy]/[mm]/[dd]/[title-raw]');
  variable_set('pathauto_node_partner_pattern', 'partner/[title-raw]');

  require_once './modules/node/node.pages.inc';
 
  nbs_page_save('About NBS');
  nbs_page_save('The Pin');
  nbs_page_save('The Bag');
  nbs_page_save('Why Bother?');

  // Update the menu router information.
  menu_rebuild();
}

/**
 *
 */
function nbs_page_save($title) {
  $node = (object) array(
	  'nid' => NULL,
	  'vid' => NULL,
	  'uid' => 1,
	  'created' => time(),
	  'type' => 'page',
	  'language' => 'en',
	  'title' => $title,
	  'body' => '',
	  'revision' => 0,
	  'status' => 1,
  );
  node_save($node);

}

function nbs_term_save($countries) {
  $weight = -128;

  foreach($countries as $country) {
    $weight++;

    db_query("INSERT INTO {term_data}
        (name, weight)
      VALUES
        ('%s', %d)",
        $country, $weight
    );

    $id = db_last_insert_id('term_data', 'tid');

    db_query("UPDATE {term_data}
      SET
        vid = %d
			WHERE tid = %d",
        1, $id
		);

    db_query("INSERT INTO {term_hierarchy}
        (tid, parent)
      VALUES
        (%d, %d)",
        $id, 0
    );
  }
}

/**
 * Implementation of hook_form_alter().
 *
 * Allows the profile to alter the site-configuration form. This is
 * called through custom invocation, so $form_state is not populated.
 */
function nbs_form_alter(&$form, $form_state, $form_id) {
  if ($form_id == 'install_configure') {
    // Set default for site name field.
    $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
  }
}
