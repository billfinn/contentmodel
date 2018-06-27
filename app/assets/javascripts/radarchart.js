document.addEventListener("turbolinks:load", function() {

      /* Radar chart design created by Nadieh Bremer - VisualCinnamon.com */

			//////////////////////////////////////////////////////////////
			//////////////////////// Set-Up //////////////////////////////
			//////////////////////////////////////////////////////////////

			var margin = {top: 100, right: 100, bottom: 100, left: 100},
				width = Math.min(700, window.innerWidth - 10) - margin.left - margin.right,
				height = Math.min(width, window.innerHeight - margin.top - margin.bottom - 20);

        console.log(margin);
			//////////////////////////////////////////////////////////////
			////////////////////////// Data //////////////////////////////
			//////////////////////////////////////////////////////////////

			//Legend titles
			// var LegendOptions = ['Decision-Maker','Influencer','Contractor','Channel Partner'];

			var data = [
					  [//Decision-Maker
              {axis:"Offering Support",value:1},
              {axis:"Ease of Doing Business",value:4},
              {axis:"Value -Driven",value:5},
              {axis:"Simplicity",value:1},
              {axis:"Responsiveness",value:3},
              {axis:"Expert Understanding",value:3},
              {axis:"Confidence",value:5},
              {axis:"Engineering Quality",value:2}
            ]
						,
						[//Influencer
              {axis:"Offering Support",value:4},
  						{axis:"Ease of Doing Business",value:5},
  						{axis:"Value -Driven",value:5},
  						{axis:"Simplicity",value:3},
  						{axis:"Responsiveness",value:5},
  						{axis:"Expert Understanding",value:5},
  						{axis:"Confidence",value:5},
  						{axis:"Engineering Quality",value:4}
					  ],
						[//Contractor
              {axis:"Offering Support",value:5},
              {axis:"Ease of Doing Business",value:3},
              {axis:"Value -Driven",value:2},
              {axis:"Simplicity",value:5},
              {axis:"Responsiveness",value:5},
              {axis:"Expert Understanding",value:3},
              {axis:"Confidence",value:3},
              {axis:"Engineering Quality",value:5}
						]
						,
						[//Channel Partner
							{axis:"Offering Support",value:4},
							{axis:"Ease of Doing Business",value:5},
							{axis:"Value -Driven",value:2},
							{axis:"Simplicity",value:2},
							{axis:"Responsiveness",value:5},
							{axis:"Expert Understanding",value:3},
							{axis:"Confidence",value:5},
							{axis:"Engineering Quality",value:4}	]
					];
			//////////////////////////////////////////////////////////////
			//////////////////// Draw the Chart //////////////////////////
			//////////////////////////////////////////////////////////////

			var color = d3.scale.ordinal()
				.range(["#EDC951","#CC333F","#00A0B0"]);

			var radarChartOptions = {
			  w: width,
			  h: height,
			  margin: margin,
			  maxValue: 5,
			  levels: 5,
			  roundStrokes: true,
			  color: color,
				ExtraWidthX: 300
			};
			//Call function to draw the Radar chart
			RadarChart(".radarChart", data, radarChartOptions);

      //my_func();
      })
