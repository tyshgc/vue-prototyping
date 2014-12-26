
var Vue  = require("vue");

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