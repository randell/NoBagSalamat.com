<?php
// $Id: node.tpl.php,v 1.4 2008/01/25 21:21:44 goba Exp $

/**
 * @file node-champion.tpl.php
 * @file champion.install
 * author: Randell Benavidez (randell@randell.ph)
 * date-created: 20080914
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
 * - $readmore: Flags true if the teaser champion of the node cannot hold the
 *   main body champion.
 * - $is_front: Flags true when presented in the front page.
 * - $logged_in: Flags true when the current user is a logged-in member.
 * - $is_admin: Flags true when the current user is an administrator.
 *
 * @see template_preprocess()
 * @see template_preprocess_node()
 */
?>
<div class="champion">
  <div class="champions-header"><img src="<?php print base_path() . path_to_theme() ?>/images/champions.gif" /></div>
  <div class="featured">
    <div class="featured-1">
      <div class="photo128">
        <?php if ($photo != ""): ?>
          <img src="/<?php print $photo ?>" />
        <?php else: ?>
          <img src="<?php print base_path() . path_to_theme() ?>/images/champion-no-photo.png" />
        <?php endif ?>
      </div><!-- end of photo128 -->
    </div><!-- end of champion-2-1 -->
    <div class="featured-2">
      <?php if ($featured == 1): ?>
        <strong>Featured Champion</strong><br /><br />
      <?php endif ?>

      <strong><?php print $title ?></strong><br />

      <?php if ($age > 0) :?>
	      <?php print $age ?> yrs old<br />
      <?php endif ?>

      <?php if ($profile != "") :?>
	      <?php print $profile ?><br />
      <?php endif ?>

      <?php if ($location != "") :?>
        <?php print $location ?><br /><br />
      <?php endif ?>

      <?php if ($champion_since != "") :?>
	      Disposable Bag-Free since:<br />
        <strong><?php print $champion_since ?></strong><br /><br />
      <?php endif ?>

      <?php if ($quote != "") :?>
	      "<?php print $quote ?>"
      <?php endif ?>
    </div><!-- end of champion-2-2 -->
  </div><!-- end of champion-2 -->
  <div class="clear"><!-- clear both --></div>
</div>

<div class="champions">
  <?php foreach($champions as $key => $champion): ?>
    <div class="photo96"><a href="<?php print base_path() . $champion->dst ?>"><?php if ($champion->photo != ""): ?><img src="/<?php print $champion->photo ?>" title="<?php print $champion->title ?>" /></a><?php else: ?><img src="<?php print base_path() . path_to_theme() ?>/images/champion-no-photo.png" title="<?php print $champion->title ?>" /><?php endif ?></a></div>
  <?php endforeach ?>
  <?php print theme('pager') ?>
</div>
