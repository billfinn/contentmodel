// Code goes here

$(document).ready(function(){
    
    $(".grid thead td").click(function(){
      showFilterOption(this);
    });
    
});

var arrayMap = {};

function showFilterOption(tdObject){
  var filterGrid = $(tdObject).find(".filter");
  
  if (filterGrid.is(":visible")){
    filterGrid.hide();
    return;
  }
  
  $(".filter").hide();
  
  filterGrid.empty();
  var allSelected = true;
  filterGrid.append('<div><input id="all" type="checkbox" checked>Select All</div>');
  
  var $rows = $(tdObject).parents("table").find("tbody tr");
  var isBoxChecked = {};
  var names = [];
  
  // Collect info from table about what checkboxes to show
  $rows.each(function(ind, ele){
    var checked = $(ele).is(":visible");
    var currentTd = $(ele).children()[$(tdObject).attr("index")];
    var checkboxText = currentTd.innerHTML;

    if (!checked){
      allSelected = false;
    }

    // List of box names
    if (!(containsObject(checkboxText, names))) {
      names.push(checkboxText);
    }

    // Checked status by name - if any show it should be checked, so we OR each status together
    if (!(checkboxText in isBoxChecked)) {
      isBoxChecked[checkboxText] = checked;
    }
    isBoxChecked[checkboxText] = isBoxChecked[checkboxText] || checked;

    // TR elements associated to names
    if (!(checkboxText in arrayMap)) {
      arrayMap[checkboxText] = [];
    }
    arrayMap[checkboxText].push(ele);
  });

  // Create the checkbox divs
  for (var i = 0; i < names.length; i++) {
    var checkboxText = names[i];
    var checked = isBoxChecked[checkboxText];

    
    var div = document.createElement("div");
    div.classList.add("grid-item")
    var checkedStr = checked ? 'checked' : '';
    div.innerHTML = '<input type="checkbox" '+checkedStr+' >'+checkboxText;
    filterGrid.append(div);
  }
  
  if (!allSelected){
    filterGrid.find("#all").removeAttr("checked");
  }
  
  filterGrid.append('<div><input id="close" type="button" value="Close"/><input id="ok" type="button" value="Ok"/></div>');
  filterGrid.show();
  
  var $closeBtn = filterGrid.find("#close");
  var $okBtn = filterGrid.find("#ok");
  var $checkElems = filterGrid.find("input[type='checkbox']");
  var $gridItems = filterGrid.find(".grid-item");
  var $all = filterGrid.find("#all");
  
  $closeBtn.click(function(){
    filterGrid.hide();
    return false;
  });
  
  $okBtn.click(function(){
    filterGrid.find(".grid-item").each(function(ind,ele){
      var checkboxText = $(ele).text();
      var rowsToHandle = arrayMap[checkboxText];
      var shouldShow = $(ele).find("input").is(":checked");
      for (var i = 0; i < rowsToHandle.length; i++) {
        if (shouldShow){
          $(rowsToHandle[i]).show();
        }else{
          $(rowsToHandle[i]).hide();
        }
      }
    });
    filterGrid.hide();
    return false;
  });
  
  $checkElems.click(function(event){
    event.stopPropagation();
  });
  
  $gridItems.click(function(event){
    var chk = $(this).find("input[type='checkbox']");
    $(chk).prop("checked",!$(chk).is(":checked"));
  });
  
  $all.change(function(){
    var chked = $(this).is(":checked");
    filterGrid.find(".grid-item [type='checkbox']").prop("checked",chked);
  })
  
  filterGrid.click(function(event){
    event.stopPropagation();
  });
  
  return filterGrid;
}

function containsObject(obj, list) {
  var i;
  for (i = 0; i < list.length; i++) {
      if (list[i] === obj) {
          return true;
      }
  }

  return false;
}