<style lang="stylus">
.main-view
  padding-top 200px
  height 1000px
  position relative
  background-image url(/images/main_background.png)
  background-size cover
  margin 0 auto
  width 100%
  
  .center
    text-align center
    position relative
    padding-top 20%
    
    img[layout_size="2x"]
      width 50%
      margin 0 auto
  .data-bind
    color #fff
</style>
<template lang="jade">
main.main-view
  p.center
    img(src="/images/main_text.png" layout_size="2x")
  .data-bind {{texts}}
</template>

<script>
module.exports = {
  data: function(){
    return {
      texts: 'でーたーばいんどー'
    };
  }
};
</script>