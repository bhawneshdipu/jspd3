alert("bar");


// set the dimensions and margins of the graph
var margin = {top: 10, right: 20, bottom: 40, left: 50},
    width = 800 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

// set the ranges
var x = d3.scaleBand().range([0, width]).padding(0.1);
var y = d3.scaleLinear().range([height, 0]);
// append the svg obgect to the body of the page
// appends a 'group' element to 'svg'
// moves the 'group' element to the top left margin
x.domain(0,width);

y.domain([0, d3.max(col1Arr, function (d) {
    return parseInt(d)+1;
})])
.nice();





var svgContainer2 = d3.select("body").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform","translate(" + margin.left + "," + margin.top + ")");









svgContainer2.append("g")
      .attr("transform", "translate(0," + height + ")")
      .call(d3.axisBottom(x)).attr("y","0")
      .selectAll("text")
      .attr("y","0")
      .attr("x","10")
      .attr("transform","rotate(90)")
      .style("text-anchor", "start");
      
  // Add the Y Axis
  svgContainer2.append("g")
      	.call(d3.axisLeft(y))
        .attr("y","0")
        .attr("x","0")
        .attr("transform","rotate(0)").style("text-anchor", "end");
  		

  
  
  
//Select, append to SVG, and add attributes to rectangles for bar chart
  svgContainer2.selectAll("rect").filter(".bar1")
   .data(col1Arr)
   .enter().append("rect")
         .attr("class", "bar1")
         .attr("height", function(d, i) {return (d * 90)})
         .attr("width","50")
         .attr("x", function(d, i) {return (i * 70) + 25})
         .attr("y", function(d, i) {return 450 - (d * 90)});
/*

  svgContainer2.selectAll("rect").filter(".bar2")
  .data(col2Arr)
  .enter().append("rect")
     .attr("class", "bar2")
     .attr("height", function(d, i) {return (d * 90)})
     .attr("width","30")
     .attr("x", function(d, i) {return (i * 70) + 55})
     .attr("y", function(d, i) {return 450 - (d * 90)});

*/
  //Select, append to SVG, and add attributes to text
  svgContainer2.selectAll("text").filter(".text1")
   .data(col1Arr)
   .enter().append("text")
   .text(function(d) {return d})
          .attr("class", "text1")
          .attr("x", function(d, i) {return (i * 70) + 28})
          .attr("y", function(d, i) {return 450 - (d * 90)});
/*
  svgContainer2.selectAll("text").filter("text2")
  .data(col2Arr)
  .enter().append("text")
  .text(function(d) {return d})
      .attr("class", "text2")
      .attr("x", function(d, i) {return (i * 70) + 56})
      .attr("y", function(d, i) {return 450 - (d * 90)});


  svgContainer2.append("text")
  .attr("x", (300))             
  .attr("y", (40))
  .attr("text-anchor", "middle")  
  .style("font-size", "30px") 
  .text(col1Arr);
*/