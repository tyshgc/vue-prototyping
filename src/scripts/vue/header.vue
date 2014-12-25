<style lang="stylus">
.header
  max-width (720/2) px
  position fixed
  width 100%
  z-index 999
  overflow hidden
  img[layout_size="2x"]
    width 102%
    margin-left -4px
</style>

<template lang="jade">
nav.header
  img(src="/images/header.png" layout_size="2x")
</template>

<script>
module.exports = {};
</script>