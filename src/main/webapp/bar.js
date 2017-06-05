// Create data array of values to visualize
var dataArray = [23, 13, 21, 14, 37, 15, 18, 34, 30];

var margin = {top: 20, right: 20, bottom: 30, left: 50},
width = 800 - margin.left - margin.right,
height = 500 - margin.top - margin.bottom;


//Create the SVG Viewport
var svgContainer = d3.select("body").append("svg").attr("class","svg1")
                                     .attr("width", width)
                                     .attr("height", height);


/*
//Create the Scale we will use for the Axis
var axisScale = d3.scale.linear().domain([0, 800]).range([0, 450]);

//Create the Axis
var xAxis = d3.svg.axis().scale(axisScale);


//Create an SVG group Element for the Axis elements and call the xAxis function
var xAxisGroup = svg.append("g").call(xAxis);
*/



//Select, append to SVG, and add attributes to rectangles for bar chart
svgContainer.selectAll("rect").filter(".bar1")
 .data(score1Arr)
 .enter().append("rect")
       .attr("class", "bar1")
       .attr("height", function(d, i) {return (d * 60)})
       .attr("width","30")
       .attr("x", function(d, i) {return (i * 70) + 25})
       .attr("y", function(d, i) {return 400 - (d * 60)});


svgContainer.selectAll("rect").filter(".bar2")
.data(score2Arr)
.enter().append("rect")
   .attr("class", "bar2")
   .attr("height", function(d, i) {return (d * 60)})
   .attr("width","30")
   .attr("x", function(d, i) {return (i * 70) + 55})
   .attr("y", function(d, i) {return 400 - (d * 60)});


//Select, append to SVG, and add attributes to text
svgContainer.selectAll("text").filter(".text1")
 .data(score1Arr)
 .enter().append("text")
 .text(function(d) {return d})
        .attr("class", "text1")
        .attr("x", function(d, i) {return (i * 70) + 28})
        .attr("y", function(d, i) {return 400 - (d * 60)});

svgContainer.selectAll("text").filter("text2")
.data(score2Arr)
.enter().append("text")
.text(function(d) {return d})
    .attr("class", "text2")
    .attr("x", function(d, i) {return (i * 70) + 56})
    .attr("y", function(d, i) {return 400 - (d * 60)});


svgContainer.append("text")
.attr("x", (300))             
.attr("y", (40))
.attr("text-anchor", "middle")  
.style("font-size", "30px") 
.text(name);
