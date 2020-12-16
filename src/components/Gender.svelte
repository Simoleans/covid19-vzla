<script>
    import FusionCharts from 'fusioncharts';
    import Charts from 'fusioncharts/fusioncharts.charts';
    import FusionTheme from 'fusioncharts/themes/fusioncharts.theme.fusion';
    import SvelteFC, { fcRoot } from 'svelte-fusioncharts';

    export let Confirmed;
  
    // Always set FusionCharts as the first parameter
    fcRoot(FusionCharts, Charts, FusionTheme);
  
    let dataSource = {
      "chart": {
        "caption": "CASOS DE COVID-19 EN VENEZUELA",
        "subCaption": "Por Generos (Masculino,Femenino)",
        "showValues": "1",
        "showPercentInTooltip": "0",
        "enableMultiSlicing": "1",
        "theme": "fusion"
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
<div class="Gender">
    <!-- <div class="p-4 w-full">
        <div class="grid grid-cols-4 gap-4">
            <h2>Holibiris</h2>
            <div class="col-span-2 md:col-span-1 hover:shadow-lg">
                <div class="flex flex-col bg-gray-100 shadow-sm rounded p-4">
                    <div class="flex flex-col items-center justify-center flex-shrink-0 h-12 w-full rounded-xl bg-yellow-100 text-yellow-500">
                        <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M5 8a1 1 0 011-1h1V6a1 1 0 012 0v1h1a1 1 0 110 2H9v1a1 1 0 11-2 0V9H6a1 1 0 01-1-1z" />
                            <path fill-rule="evenodd" d="M2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8zm6-4a4 4 0 100 8 4 4 0 000-8z" clip-rule="evenodd" />
                          </svg>
                    </div>
                    <div class="flex flex-col flex-grow ml-4 items-center pt-2">
                        <div class="text-sm text-gray-500">{Confirmed.ByGender.male}</div>
                        <div class="font-bold text-lg">2</div>
                    </div>
                </div>
            </div>
           
        </div>
    </div> -->
    <div id='chart-container'>
        <SvelteFC {...chartConfig} />
      </div>
</div>