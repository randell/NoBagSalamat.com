<?php
/**
 * @file news.php
 * author: Randell Benavidez (randell@randell.ph)
 * date created: 20080928
 */
$news_philippines = news_philippines(1);
$news_around_the_world = news_around_the_world(1);
?>

<div id="front-news-1"><img src="<?php print base_path() . path_to_theme() ?>/images/front-news.gif" /></div>
<div id="front-news-2">Learning from Others</div>
<div id="front-news-3"></div>
<div id="front-news-4">
<?php if (sizeof($news_philippines)): ?>
  <?php foreach ($news_philippines as $news_p) : ?>
    <strong><a href="<?php print $news_p->dst; ?>"><?php print $news_p->title ?></a></strong><br />
    <em>From <?php print $news_p->source ?></em><br /><br />
  <?php endforeach; ?>
<?php endif ?>
<?php if (sizeof($news_around_the_world)): ?>
  <?php foreach ($news_around_the_world as $news_a) : ?>
    <strong><a href="<?php print $news_p->dst; ?>"><?php print $news_a->title ?></a></strong><br />
    <em>From <?php print $news_a->source ?></em>
  <?php endforeach; ?>
<?php endif ?>
</div>
<div id="front-news-5"><a href="<?php print base_path()?>news">&gt;&gt; Learn more</a></div>
