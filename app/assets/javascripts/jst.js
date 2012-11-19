window.JST || (window.JST = {});

JST.template = function(name) {
  return JST["backbone/templates/" + name];
};

