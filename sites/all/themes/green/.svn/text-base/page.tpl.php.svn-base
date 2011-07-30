<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title><?php print $head_title; ?></title>
<?php print $head ?>
<?php print $styles ?>
<?php print $scripts ?>
</head>
<body>
<div id="container">

  <?php include 'includes/header.php'; ?>

  <div class="sub">
    <?php 
    $path = $node->path;
    $type = $node->type;
   
    if ($path == "about-nbs") {
      include 'template-about-nbs.tpl.php';
    } elseif ($path == "the-pin") {
      include 'template-the-pin.tpl.php';
    } elseif ($path == "the-bag") {
      include 'template-the-bag.tpl.php';
    } elseif ($path == "why-bother") {
      include 'template-why-bother.tpl.php';
    } elseif ($type == "champion") {
      include 'template-champion.tpl.php';
    } elseif ($type == "news") {
      include 'template-news.tpl.php';
    } elseif ($path == "make-the-pledge") {
      include 'template-make-the-pledge.tpl.php';
    } else {
      include 'template.tpl.php';
    }
    ?>
  </div>
  <?php include 'includes/footer.php'; ?>

</div><!--end:container-->
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-6878490-1");
pageTracker._trackPageview();
} catch(err) {}</script>
</body>
</html>
