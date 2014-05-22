$('label.tree-toggler').click(function () {
  $(this).parent().children('ul.tree').toggle(100);
});

$(document).ready(function(){
    $("[rel=tooltip]").tooltip({ placement: 'bottom'});
});
