<?php
/**
 * @file partner.install
 * author: Randell Benavidez (randell@randell.ph)
 * date-created: 20080914
 * date-updated: year-mm-dd "name" "description"
 *
 * Available variables:
 * - $partners
 */
?>
<div class="partners-left">
  <div class="partner">
    <div class="partners-header"><img src="<?php print base_path() . path_to_theme() ?>/images/partners.gif" /></div>
    <div class="clear"><!-- clear both --></div>
  </div>

  <div class="partners">
    <?php foreach($partners as $key => $partner): ?>
      <?php if ($partner->url == ""): ?>
        <div class="logo144"><?php if ($partner->logo != ""): ?><img src="<?php print $partner->logo ?>" title="<?php print $partner->title ?>" /></a><?php else: ?><img src="<?php print base_path() . path_to_theme() ?>/images/partner-no-logo.png" title="<?php print $partner->title ?>" /><?php endif ?></div>
      <?php else: ?>
        <div class="logo144"><a href="<?php print $partner->url ?>"><?php if ($partner->logo != ""): ?><img src="<?php print $partner->logo ?>" title="<?php print $partner->title ?>" /></a><?php else: ?><img src="<?php print base_path() . path_to_theme() ?>/images/partner-no-logo.png" title="<?php print $partner->title ?>" /><?php endif ?></a></div>
      <?php endif ?>
    <?php endforeach ?>
  </div>
</div>

<div class="partners-right">
  <?php print variable_get('partner_how_to_help')?>
</div>

<div class="clear"></div>
