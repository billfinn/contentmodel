document.addEventListener("turbolinks:load", function() {


$(function() {
//get the site id
var site_id = $('#site').data('site');
console.log(site_id);

var data_type = $('#type').data('type');
console.log(data_type);

//create a variable to hold the JSON site data URL
var site_data;

//based on the site_id passed from the view, switch the JSON url used to populate the tree
//also, get the type of data we want, such as taxonomy data or sitemap data; we should be able to access multiple trees from one codeset
switch (site_id) {
    case 1:
        if (data_type == "taxonomy") {
          site_data = "/tree/jcitags"
        } else if (data_type == "sitemap") {
          site_data = "/tree/jcimap"
        } else {

        }
        break;
    case 2:
        if (data_type == "taxonomy") {
          site_data = "/tree/tycotags"
        } else if (data_type == "sitemap") {
          site_data = "/tree/tycomap"
        } else {

        }
        break;
}

console.log(site_id)
console.log(site_data);

//set the dimensions
var m = [20, 120, 20, 120],
    // w = d3.select('.col-xs-12').node();
    //     element.getBoundingClientRect().width;
    w = 1280 - m[1] - m[3],
    h = 800 - m[0] - m[2],
    i = 0,
    root;

var tree = d3.layout.tree()
    .size([h, w]);

var diagonal = d3.svg.diagonal()
    .projection(function(d) { return [d.y, d.x]; });

var vis = d3.select("#tree").append("svg")

  .attr("class","svg_container")
  .attr("width", w + m[1] + m[3])
  .attr("height", h + m[0] + m[2])
  .style("overflow", "scroll")
  // .append("svg:g")
  // .attr("transform", "translate(" + m[3] + "," + m[0] + ")");
  .append("svg:g")
    .attr("class","drawarea")
  .append("svg:g")
    .attr("transform", "translate(" + m[3] + "," + m[0] + ")");



$.getJSON(site_data, function(tag, error) {
  // if (error) throw error;
  console.log(tag);
  root = tag[0];
  root.x0 = h / 2;
  root.y0 = 0;
  console.log(root);

  // function toggleAll(d) {
  //   if (d.children) {
  //     d.children.forEach(toggleAll);
  //     toggle(d);
  //   }
  // }
  //
  // // Initialize the display to show a few nodes.
  // root.children.forEach(toggleAll);
  // toggle(root.children[0]);
  // toggle(root.children[1].children[2]);
  // toggle(root.children[9]);
  // toggle(root.children[9].children[0]);

  update(root);
});


function update(source) {
  var duration = d3.event && d3.event.altKey ? 5000 : 500;

  // Compute the new tree layout.
  var nodes = tree.nodes(root).reverse();

  // Normalize for fixed-depth.
  nodes.forEach(function(d) { d.y = d.depth * 180; });

  // Update the nodes…
  var node = vis.selectAll("g.node")
      .data(nodes, function(d) { return d.id || (d.id = ++i); });

  // Enter any new nodes at the parent's previous position.
  var nodeEnter = node.enter().append("svg:g")
      .attr("class", "node")
      .attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
      // .on("click", function(d) { toggle(d); update(d); });

  nodeEnter.append("svg:circle")
      .attr("r", 1e-6)
      .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; }).on("click", click);;

  nodeEnter.append("svg:text")
      .attr("x", function(d) { return d.children || d._children ? -10 : 10; })
      .attr("dy", ".35em")
      .attr("text-anchor", function(d) { return d.children || d._children ? "end" : "start"; })
      .text(function(d) { return d.name; })
      .style("fill-opacity", 1e-6)
      .attr("class", "hyper").on("click", clack);;

      //options for the click-action of the text label on tree nodes. one for sitemap, one for taxonomy
      function clack(d) {
        if (data_type == "taxonomy") {
            alert(d.name);
        } else if (data_type == "sitemap") {
            // alert("/page/" + d.id + "?site=" + site_id);
            window.location.href = "/page/" + d.id + "?site=" + site_id +"";
        } else {
            alert("An error occurred. Please contact a site administrator.");
        }

    }

  // Transition nodes to their new position.
  var nodeUpdate = node.transition()
      .duration(duration)
      .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });

  nodeUpdate.select("circle")
      .attr("r", 4.5)
      .style("fill", function(d) { return d._children ? "lightsteelblue" : "#fff"; });

  nodeUpdate.select("text")
      .style("fill-opacity", 1);

  // Transition exiting nodes to the parent's new position.
  var nodeExit = node.exit().transition()
      .duration(duration)
      .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
      .remove();

  nodeExit.select("circle")
      .attr("r", 1e-6);

  nodeExit.select("text")
      .style("fill-opacity", 1e-6);

  // Update the links…
  var link = vis.selectAll("path.link")
      .data(tree.links(nodes), function(d) { return d.target.id; });

  // Enter any new links at the parent's previous position.
  link.enter().insert("svg:path", "g")
      .attr("class", "link")
      .attr("d", function(d) {
        var o = {x: source.x0, y: source.y0};
        return diagonal({source: o, target: o});
      })
    .transition()
      .duration(duration)
      .attr("d", diagonal);

  // Transition links to their new position.
  link.transition()
      .duration(duration)
      .attr("d", diagonal);

  // Transition exiting nodes to the parent's new position.
  link.exit().transition()
      .duration(duration)
      .attr("d", function(d) {
        var o = {x: source.x, y: source.y};
        return diagonal({source: o, target: o});
      })
      .remove();

  // Stash the old positions for transition.
  nodes.forEach(function(d) {
    d.x0 = d.x;
    d.y0 = d.y;
  });

  d3.select("svg")
    .call(d3.behavior.zoom()
          .scaleExtent([0.5, 5])
          .on("zoom", zoom));

}

// Toggle children.
// function toggle(d) {
//   if (d.children) {
//     d._children = d.children;
//     d.children = null;
//   } else {
//     d.children = d._children;
//     d._children = null;
//   }
// }

// Toggle children on click. This is add-on code from https://stackoverflow.com/questions/14951392/add-hyperlink-to-node-text-on-a-collapsible-tree, Check out my fiddle here: http://jsfiddle.net/empie/EX83X/
function click(d) {
  if (d.children) {
    d._children = d.children;
    d.children = null;
  } else {
    d.children = d._children;
    d._children = null;
  }
  update(d);
}

// function clack(d) {
//     alert(d.id);
//     return "http://google.com";
// }

// based on code updates found here:  https://stackoverflow.com/questions/17405638/d3-js-zooming-and-panning-a-collapsible-tree-diagram ///http://jsfiddle.net/nrabinowitz/fF4L4/2/
function zoom() {
    var scale = d3.event.scale,
        translation = d3.event.translate,
        tbound = -h * scale,
        bbound = h * scale,
        lbound = (-w + m[1]) * scale,
        rbound = (w - m[3]) * scale;
    // limit translation to thresholds
    translation = [
        Math.max(Math.min(translation[0], rbound), lbound),
        Math.max(Math.min(translation[1], bbound), tbound)
    ];
    d3.select(".drawarea")
        .attr("transform", "translate(" + translation + ")" +
              " scale(" + scale + ")");
}

});

//my_func();
})
