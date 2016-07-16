

var options = {
  mainAngularModule: 'MeMayor'
};


options.modulesData = {
  proxy: {
    target: 'http://localhost:9000',
    preventWhen: function(req, res){
      var isPrevented = true;
      var byPass      = [
        'config/Config.js'
      ];

      byPass.forEach(function(item){
        isPrevented = isPrevented && req.url.indexOf(item) < 0;
      });

      var regexNext = /\.(html|css|js|png|jpg|jpeg|gif|ico|xml|rss|txt|eot|svg|ttf|woff|woff2|cur|json)(\?((r|v|rel|rev)=[\-\.\w]*)?)?$/;
      isPrevented = ( isPrevented && regexNext.test(req.url) ) || req.url === "/";

      return isPrevented;
    }
  },

  server: {
    routes: {
      '/bower-components' : 'bower_components',
      '/vendors'          : 'vendors'
    }
  }
};

require('basebuild-angular')(options);