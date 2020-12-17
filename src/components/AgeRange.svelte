<script>
	import FusionCharts from 'fusioncharts';
    import Charts from 'fusioncharts/fusioncharts.charts';
    import FusionTheme from 'fusioncharts/themes/fusioncharts.theme.fusion';
    import SvelteFC, { fcRoot } from 'svelte-fusioncharts';

	export let Confirmed; 

	fcRoot(FusionCharts, Charts, FusionTheme);
  
    let dataSource = {
      "chart": {
        "caption": "CASOS DE COVID-19 EN VENEZUELA",
      "subCaption": "Por rango de Edad [0-99]",
      "xAxisName": "Rango de edad",
      "yAxisName": "Cantidad de personas",
      "theme": "fusion"
      },
      "data": [
      {
        "label": "0-9",
        "value": Confirmed.ByAgeRange["0-9"]
      },
      {
        "label": "10-19",
        "value": Confirmed.ByAgeRange["10-19"]
      },
      {
        "label": "20-29",
        "value": Confirmed.ByAgeRange["20-29"]
      },
      {
        "label": "30-39",
        "value": Confirmed.ByAgeRange["30-39"]
      },
      {
        "label": "40-49",
        "value": Confirmed.ByAgeRange["40-49"]
      },
      {
        "label": "50-59",
        "value": Confirmed.ByAgeRange["50-59"]
      },
      {
        "label": "60-69",
        "value": Confirmed.ByAgeRange["60-69"]
      },
      {
        "label": "70-79",
        "value": Confirmed.ByAgeRange["70-79"]
      },
      {
        "label" : "80-89",
        "value" : Confirmed.ByAgeRange["80-89"]
      },
      {
        "label" : "90-99",
       "value" : Confirmed.ByAgeRange["90-99"]
      }
    ]
    },
    chartConfig = {
      type: 'column2d',
       width: '100%',
      height: '450',
      renderAt: 'chart-container',
      dataSource
    };
</script>

<div class="AgeRange flex-1 items-center">
      <SvelteFC {...chartConfig} />
</div>