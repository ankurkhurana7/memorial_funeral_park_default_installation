<?php

/**
 * Implementation of hook_node_info().
 */
function obit_content_type_module_node_info() {
  $items = array(
    'obit_user_links' => array(
      'name' => t('obit_user_links'),
      'module' => 'features',
      'description' => '',
      'has_title' => '1',
      'title_label' => t('Title'),
      'has_body' => '1',
      'body_label' => t('Body'),
      'min_word_count' => '0',
      'help' => '',
    ),
  );
  return $items;
}
