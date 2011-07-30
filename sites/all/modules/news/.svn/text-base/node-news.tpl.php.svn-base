<?php
// $Id: node.tpl.php,v 1.4 2008/01/25 21:21:44 goba Exp $

/**
 * @file node-news.tpl.php
 * @file news.install
 * author: Randell Benavidez (randell@randell.ph)
 * date-created: 20081020
 * date-updated: year-mm-dd "name" "description"
 *
 *
 * Theme implementation to display a node.
 *
 * Available variables:
 * - $title: the (sanitized) title of the node.
 * - $content: Node body or teaser depending on $teaser flag.
 * - $picture: The authors picture of the node output from
 *   theme_user_picture().
 * - $date: Formatted creation date (use $created to reformat with
 *   format_date()).
 * - $links: Themed links like "Read more", "Add new comment", etc. output
 *   from theme_links().
 * - $name: Themed username of node author output from theme_user().
 * - $node_url: Direct url of the current node.
 * - $terms: the themed list of taxonomy term links output from theme_links().
 * - $submitted: themed submission information output from
 *   theme_node_submitted().
 *
 * Other variables:
 * - $node: Full node object. Contains data that may not be safe.
 * - $type: Node type, i.e. story, page, blog, etc.
 * - $comment_count: Number of comments attached to the node.
 * - $uid: User ID of the node author.
 * - $created: Time the node was published formatted in Unix timestamp.
 * - $zebra: Outputs either "even" or "odd". Useful for zebra striping in
 *   teaser listings.
 * - $id: Position of the node. Increments each time it's output.
 *
 * Node status variables:
 * - $teaser: Flag for the teaser state.
 * - $page: Flag for the full page state.
 * - $promote: Flag for front page promotion state.
 * - $sticky: Flags for sticky post setting.
 * - $status: Flag for published status.
 * - $comment: State of comment settings for the node.
 * - $readmore: Flags true if the teaser news of the node cannot hold the
 *   main body news.
 * - $is_front: Flags true when presented in the front page.
 * - $logged_in: Flags true when the current user is a logged-in member.
 * - $is_admin: Flags true when the current user is an administrator.
 *
 * @see template_preprocess()
 * @see template_preprocess_node()
 */
?>
<div class="news-left">
  <div class="news">
    <div class="news-header"><img src="<?php print base_path() . path_to_theme() ?>/images/news.gif" /></div>
    <div class="clear"><!-- clear both --></div>
  </div>

  <div class="newss">
      <div class="news-title"><?php print $title ?></div>
      <div class="news-body"><?php print $body ?></div>
      <div class="news-source"><a href="<?php echo $url ?>">From <?php print $source ?></a></div>
  </div>
</div>

<div class="news-right">
  <?php if (sizeof($news_philippines) > 0): ?>
    <?php print "<strong>Philippines</strong><br /><br />" ?>
  <?php endif ?>
  <?php foreach($news_philippines as $key => $article):?>
    <a href="<?php print $article->dst ?>"><?php print $article->title ?></a><br />
  <?php endforeach ?>
  <?php if (sizeof($news_philippines) > 0): ?><?php print "<br />" ?><?php endif ?>
  
  <?php if (sizeof($news_around_the_world) > 0): ?>
    <?php print "<strong>Around the World</strong>" ?><br /><br />
  <?php endif ?>
  <?php foreach($news_around_the_world as $key => $article):?>
    <a href="<?php print $article->dst ?>"><?php print $article->title ?></a><br />
  <?php endforeach ?>
</div>

<div class="clear"></div>
