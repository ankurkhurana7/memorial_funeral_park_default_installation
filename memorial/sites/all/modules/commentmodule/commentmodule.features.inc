<?php

/**
 * Implementation of hook_node_info().
 */
function commentmodule_node_info() {
  $items = array(
    'comment' => array(
      'name' => t('Comment'),
      'module' => 'features',
      'description' => t('A comment for use with the nodecomment module.'),
      'has_title' => '1',
      'title_label' => t('Subject'),
      'has_body' => '1',
      'body_label' => t('Body'),
      'min_word_count' => '0',
      'help' => '',
    ),
  );
  return $items;
}
