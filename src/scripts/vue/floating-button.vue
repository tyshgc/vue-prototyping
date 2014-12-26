<style lang="stylus">
.floating-button
  position fixed
  right 15px
  bottom 15px
  width (140/2) px
  z-index 998
  img[layout_size="2x"]
    width 100%
</style>

<template lang="jade">
nav.floating-button
  a(href="http://vuejs.org" target="_blank")
    img(src="/images/floating-button.png" layout_size="2x")
</template>

<script>
module.exports = {};
</script>