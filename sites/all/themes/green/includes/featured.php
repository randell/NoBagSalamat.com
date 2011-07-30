<?php
/**
 * @file featured.php
 * author: Randell Benavidez (randell@randell.ph)
 * date created: 20080927
 */
$featured_champion = champion_featured();
?>

<img src="<?php print base_path() . path_to_theme() ?>/images/featured-champion.gif" />
<div id="featured-1">
  <?php if ($featured_champion->photo != ""): ?>
    <img src="<?php print $featured_champion->photo ?>" />
  <?php else: ?>
    <img src="<?php print base_path() . path_to_theme() ?>/images/champion-no-photo.png" />
  <?php endif ?>
</div>
<div id="featured-2">
  <div id="featured-2-1">
    <strong><?php print $featured_champion->title ?></strong>, <?php if ($featured_champion->age > 0): print $featured_champion->age; endif ?><br />

    <?php if ($featured_champion->profile != "") :?>
      <?php print $featured_champion->profile ?><br />
    <?php endif ?>

    <?php if ($featured_champion->location != "") :?>
      <?php print $featured_champion->location ?><br /><br />
    <?php endif ?>

    <?php if ($featured_champion->champion_since != "") :?>
      Disposable Bag-Free since:<br />
      <strong><?php print $featured_champion->champion_since ?></strong><br /><br />
    <?php endif ?>

    <a href="<?php print base_path() ?>champions">&gt;&gt; See our other champions and be one, too!</a>
  </div>
</div>
