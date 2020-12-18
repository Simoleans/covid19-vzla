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
        "subCaption": "Por Edad (Masculino,Femenino)",
        "showValues": "1",
        "showPercentInTooltip": "0",
        "enableMultiSlicing": "1",
        "formatNumber": "0",
        "theme": "fusion",
      },
      "data": [{
        "label": "Masculino",
        "value": Confirmed.ByGender.male
      }, {
        "label": "Femenino",
        "value": Confirmed.ByGender.female
      }]
    },
    chartConfig = {
      type: 'pie3d',
      width: '100%',
      height: '450',
      renderAt: 'chart-container',
      dataSource
    };
  </script>
<div class="Gender flex-1 items-center">
    <div id='chart-container'>
      <SvelteFC {...chartConfig} />
    </div>
</div>