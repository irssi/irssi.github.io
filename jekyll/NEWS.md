---
layout: page
title: Irssi NEWS
container_class: news
---
{% include relnews.markdown %}
<script src="https://scripts.irssi.org/assets/js/jquery.min.js"></script>
<script src="https://scripts.irssi.org/assets/js/jquery.timeago.js"></script>
<script>
$(function() {
  jQuery.timeago.settings.cutoff = 365*24*60*60*1000;
  $("abbr.timeago").timeago();
});
</script>
