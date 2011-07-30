<?php
/**
 * @file news-list.tpl.php
 * author: Randell Benavidez (randell@randell.ph)
 * date-created: 20080914
 * date-updated: year-mm-dd "name" "description"
 *
 * Available variables:
 * - $news
 * - $news_philippines
 * - $news_around_the_world
 */
?>
<div class="news-left">
  <div class="news">
    <div class="news-header"><img src="<?php print base_path() . path_to_theme() ?>/images/news.gif" /></div>
    <div class="clear"><!-- clear both --></div>
  </div>

  <div class="newss">
    <?php foreach($news as $key => $article): ?>
      <div class="news-title"><?php print $article->title ?></div>
      <div class="news-body"><?php print $article->body ?></div>
      <div class="news-source"><a href="<?php print $article->url ?>">From <?php print $article->source ?></a></div>
    <?php endforeach ?>
    <?php print theme('pager') ?>
  </div>
</div>

<div class="news-right">
  <?php if (sizeof($news_philippines) > 0): ?>
    <?php print "<strong>Philippines</strong><br /><br />" ?>
  <?php endif ?>
  <?php foreach($news_philippines as $key => $article): ?>
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
