<?php
/**
 * @file champion.install
 * author: Randell Benavidez (randell@randell.ph)
 * date-created: 20081014
 * date-updated: year-mm-dd "name" "description"
 *
 * Available variables:
 * - $featured_champion
 * - $champions
 */
?>
<div class="champions-left">
  <div class="champion">
    <div class="champions-header"><img src="<?php print base_path() . path_to_theme() ?>/images/champions.gif" /></div>
    <div class="featured">
      <div class="featured-1">
        <div class="photo128">
          <?php if ($featured_champion->photo != ""): ?>
            <img src="<?php print $featured_champion->photo ?>" />
          <?php else: ?>
            <img src="<?php print base_path() . path_to_theme() ?>/images/champion-no-photo.png" />
          <?php endif ?>
        </div><!-- end of photo128 -->
      </div><!-- end of champion-2-1 -->
      <div class="featured-2">
        <?php if ($featured_champion->featured == 1): ?>
          <strong>Featured Champion</strong><br /><br />
        <?php endif ?>

        <strong><?php print $featured_champion->title ?></strong><br />

        <?php if ($featured_champion->age > 0) :?>
		      <?php print $featured_champion->age ?> yrs old<br />
        <?php endif ?>

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

        <?php if ($featured_champion->quote != "") :?>
		      "<?php print $featured_champion->quote ?>"
        <?php endif ?>
      </div><!-- end of champion-2-2 -->
    </div><!-- end of champion-2 -->
    <div class="clear"><!-- clear both --></div>
  </div>

  <div class="champions">
    <?php foreach($champions as $key => $champion): ?>
      <div class="photo96"><a href="<?php print $champion->dst ?>"><?php if ($champion->photo != ""): ?><img src="<?php print $champion->photo ?>" title="<?php print $champion->title ?>" /></a><?php else: ?><img src="<?php print base_path() . path_to_theme() ?>/images/champion-no-photo.png" title="<?php print $champion->title ?>" /><?php endif ?></a></div>
    <?php endforeach ?>
    <?php print theme('pager') ?>
  </div>
</div>

<div class="champions-right">
  <?php print variable_get('champion_how_to_be')?>
</div>

<div class="clear"></div>
