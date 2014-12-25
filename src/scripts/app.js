
var $    = require("jquery");
var Vue  = require("vue");

App = module.exports = new Vue({
  
  el: '#app',
  components: {
    'vue-header'  : require('./vue/header.vue')
  },
  
  data:{
    todo: []
  },
  
  methods: {
  
  }
  
});