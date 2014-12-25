
var Vue  = require("vue");
var $ = require("jquery");
window.jQuery = $;

var ripples  = require("../lib/ripples");
var material  = require("../lib/material");

App = module.exports = new Vue({
  
  el: '#app',
  components: {
    'vue-header'  : require('./vue/header.vue'),
    'vue-main'    : require('./vue/main.vue'),
    'vue-ojisan'  : require('./vue/ojisan.vue'),
    'vue-floating-button'  : require('./vue/floating-button.vue')
  },
  
  data:{
    todo: []
  },
  
  created: function(){
    
  },
  
  methods: {
  
  }
  
});