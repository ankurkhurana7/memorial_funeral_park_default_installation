<?php
// $Id: site1.profile


// Define the default theme
define('site1_THEME', 'theme4');

// Define admin theme
define('site1_THEME_ADMIN', 'garland');

/**
 * Return an array of the modules to be enabled when this profile is installed.
 *
 * @return
 *   An array of modules to enable.
 */
function site1_profile_modules() {
  $modules = array(
    // Default Drupal modules.
    'help', 'menu', 'path',
    
    // Views
    'views', 'views_ui', 'views_export',
    
    // CCK
    'content','text', 'optionwidgets', 'content_copy', 'number',
    
    // Date
    'date_api', 'date_timezone', 'date',  
     
    // Rules
    'token', 
    
    // Misc
    'admin_menu', 'nodecomment', 'sharedemail', 'nice_menus',
    
    
    // Features
    'features',
    
    //custom
   'obit_content_type_module', 'obit_view', 'commentmodule', 
    
  );

  return $modules;
}

/**
 * Return a description of the profile for the initial installation screen.
 *
 * @return
 *   An array with keys 'name' and 'description' describing this profile,
 *   and optional 'language' to override the language selection for
 *   language-specific profiles.
 */
function site1_profile_details() {
  
  return array(
    'name' => 'memorial site1',
    'description' => 'memorial site1.'
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
function ste1_profile_task_list() {
  global $conf;
  $conf['site_name'] = 'memorial site1';
  
  return $tasks;

}

/**
 * Perform any final installation tasks for this profile.
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
function site1_profile_tasks(&$task, $url) {

  // Include the enabled modules

  site1_config_theme();
   // Create some instructional and example nodes.
      _site1_create_nodes();
  site1_config_menu(); 
  site1_cleanup();

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
  );

  foreach ($types as $type) {
    $type = (object) _node_type_set_defaults($type);
    node_type_save($type);
  }

}


// Install a few primary link menu items by default.
function site1_config_menu() {
  // Create additional primary menu items
  $items = array(
    array('link_path' => '<front>', 'link_title' => t('Home'), 'weight' => 0),
    array('link_path' => 'node/2', 'link_title' => t('Pre-planning'), 'weight' => 1),
    array('link_path' => '<front>', 'link_title' => t('obituries'), 'weight' => 2),
      array('link_path' => '<front>', 'link_title' => t('Funeral'), 'weight' => 3),
        array('link_path' => '<front>', 'link_title' => t('Cementary'), 'weight' => 4),
          array('link_path' => '<front>', 'link_title' => t('Cremation'), 'weight' => 5),
            array('link_path' => '<front>', 'link_title' => t('About us'), 'weight' => 6),
              array('link_path' => '<front>', 'link_title' => t('Local info'), 'weight' => 7),
                array('link_path' => '<front>', 'link_title' => t('How to plan a funeral'), 'weight' => 8),
                  array('link_path' => '<front>', 'link_title' => t('Veterans honors'), 'weight' => 9),
            array('link_path' => '<front>', 'link_title' => t('Signature services'), 'weight' => 10),
  );

  foreach ($items as $item) {
    $item += array(
      'mlid' => 0,
      'module' => 'menu',
      'has_children' => 0,
      'options' => array(
        'attributes' => array(
          'title' => '',
        ),
      ),
      'customized' => 1,
      'original_item' => array(
        'link_title' => '',
        'mlid' => 0,
        'plid' => 0,
        'menu_name' => 'primary-links',
        'weight' => 1,
        'link_path' => '',
        'options' => array(),
        'module' => 'menu',
        'expanded' => 0,
        'hidden' => 0,
        'has_children' => 0,
      ),
      'description' => '',
      'expanded' => 0,
      'parent' => 'primary-links:0',
      'hidden' => 0,
      'plid' => 0,
      'menu_name' => 'primary-links',
    );
    menu_link_save($item);
    $funeral_mlid = db_result(db_query("select mlid from {menu_links} where link_title='Funeral'"));
    db_query("update menu_links set has_children=1 where link_title='Funeral'");
    db_query("update `menu_links` set plid = %d, p1= %d, p2=mlid, depth=2 where link_title in ('How to plan a funeral','Veterans honors','Signature services')", $funeral_mlid, $funeral_mlid);
 
  }
}
/**
 * Configure theme
 */
function site1_config_theme() {
  // Disable garland
  db_query("UPDATE {system} SET status = 0 WHERE type = 'theme' and name = '%s'", 'garland');
  
  // Enable Rubik
  db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' and name = '%s'", site1_THEME_ADMIN);
  
  // Enable Cube theme
  db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' and name = '%s'", site1_THEME);
  
  // Set Rubik theme as the default
  variable_set('admin_theme', site1_THEME_ADMIN);
  
  // Set Cube theme as the default
  variable_set('theme_default', site1_THEME);

  // Refresh registry
  list_themes(TRUE);
  drupal_rebuild_theme_registry();
}


/**
 * Various actions needed to clean up after the installation
 */
function site1_cleanup() {
  // Rebuild node access database - required after OG installation
  node_access_rebuild();
  
  // Rebuild node types
  node_types_rebuild();
  
  // Rebuild the menu
  menu_rebuild();
  
  // Clear drupal message queue for non-warning/errors
  drupal_get_messages('status', TRUE);

  // Clear out caches
  $core = array('cache', 'cache_block', 'cache_filter', 'cache_page');
  $cache_tables = array_merge(module_invoke_all('flush_caches'), $core);
  foreach ($cache_tables as $table) {
    cache_clear_all('*', $table, TRUE);
  }
  
  // Clear out JS and CSS caches
  drupal_clear_css_cache();
  drupal_clear_js_cache();
  
  // Say hello to the dog!
  watchdog('site1', t('Welcome to site1!'));
}

function _site1_create_nodes() {
  // Add an instructional page and set it to the front page.
   $node = new stdClass();
    $node->title = 'Welcome to your store!';
    $node->body = "Now that you have completed installation, there is still plenty of work to do to make sure your store is ready for business.\n\n<strong>TODO:</strong> Post your ideas on what steps to include here at http://drupal.org/node/625906.";
    $node->type = 'page';
    $node->created = time();
    $node->changed = time();
    $node->status = 1;
    $node->promote = 1;
    $node->sticky = 0;
    $node->format = 1;
    $node->uid = 1;
    $node->language = 'en';
    node_save($node);
   
    variable_set('site_frontpage', 'node/1');
   
    $node = new stdClass();
    $node->title = 'About us';
    $node->body = 'This is a sample about us page that you can edit to fill with information about your store.';
    $node->type = 'page';
    $node->created = time();
    $node->changed = time();
    $node->path = 'about';
    $node->status = 1;
    $node->promote = 0;
    $node->sticky = 0;
    $node->format = 1;
    $node->uid = 1;
    $node->language = 'en';
    node_save($node);

#  $node = new stdClass();
#  $node->title = 'Example Product';
#  $node->body = 'This is a simple example product that you can modify or delete. Use it to test checkout for a shippable item.';
#  $node->type = 'product';
#  $node->created = time();
#  $node->changed = time();
#  $node->status = 1;
#  $node->promote = 0;
#  $node->sticky = 0;
#  $node->format = 1;
#  $node->uid = 1;
#  $node->language = 'en';
#  $node->model = 'PRODUCT';
#  $node->list_price = 15;
#  $node->cost = 5;
#  $node->sell_price = 10;
#  $node->weight = 5;
#  $node->weight_units = 'lb';
#  $node->default_qty = 1;
#  $node->shippable = 1;
#  node_save($node);

#  taxonomy_node_save($node, array(1));
}
