<script>
import FusionCharts from 'fusioncharts';
import Charts from 'fusioncharts/fusioncharts.charts';
import FusionTheme from 'fusioncharts/themes/fusioncharts.theme.fusion';
import SvelteFC, { fcRoot } from 'svelte-fusioncharts';

export let Confirmed;

// Always set FusionCharts as the first parameter
fcRoot(FusionCharts, Charts, FusionTheme);

const dataSource = {
  "chart": {
    "caption": "CASOS DE COVID-19 EN VENEZUELA",
    "yaxisname": "Por Ciudad",
    "aligncaptionwithcanvas": "0",
    "plottooltext": "<b>$dataValue</b> Casos",
    "labelDisplay": "Auto",
    "theme": "fusion"
  },
  "data": [
    {
      "label": "Amazonas",
      "value": Confirmed.ByState.Amazonas
    },
    {
      "label": "Anzoátegui",
      "value": Confirmed.ByState.Anzoátegui
    },
    {
      "label": "Apure",
      "value": Confirmed.ByState.Apure
    },
    {
      "label": "Aragua",
      "value": Confirmed.ByState.Aragua
    },
    {
      "label": "Barinas",
      "value": Confirmed.ByState.Barinas
    },
    {
      "label": "Bolívar",
      "value": Confirmed.ByState.Bolívar
    },
    {
      "label": "Carabobo",
      "value": Confirmed.ByState.Carabobo
    },
    {
      "label": "Cojedes",
      "value": Confirmed.ByState.Cojedes
    },
    {
      "label": "Delta Amacuro",
      "value": Confirmed.ByState["Delta Amacuro"]
    },
    {
      "label": "Distrito Capital",
      "value": Confirmed.ByState["Distrito Capital"]
    },
    {
      "label": "Falcón",
      "value": Confirmed.ByState.Anzoátegui
    },
    {
      "label": "Guarico",
      "value": Confirmed.ByState.Falcón
    },
    {
      "label": "La Guaira",
      "value": Confirmed.ByState["La Guaira"]
    },
    {
      "label": "Lara",
      "value": Confirmed.ByState.Lara
    },
    {
      "label": "Los Roques",
      "value": Confirmed.ByState["Los Roques"]
    },
    {
      "label": "Mérida",
      "value": Confirmed.ByState.Mérida
    },
    {
      "label": "Miranda",
      "value": Confirmed.ByState.Miranda
    },
    {
      "label": "Monagas",
      "value": Confirmed.ByState.Mérida
    },
    {
      "label": "Nueva Esparta",
      "value": Confirmed.ByState["Nueva Esparta"]
    },
    {
      "label": "Portuguesa",
      "value": Confirmed.ByState.Portuguesa
    },
    {
      "label": "Sucre",
      "value": Confirmed.ByState.Sucre
    },
    {
      "label": "Táchira",
      "value": Confirmed.ByState.Táchira
    },
    {
      "label": "Trujillo",
      "value": Confirmed.ByState.Trujillo
    },
    {
      "label": "Yaracuy",
      "value": Confirmed.ByState.Yaracuy
    },
    {
      "label": "Zulia",
      "value": Confirmed.ByState.Zulia
    }
  ]
};

const chartConfigs = {
   type: 'bar2d',
   width: 600,
   height: 400,
   dataFormat: 'json',
   dataSource
};
</script>
<div class="Estados">
    <SvelteFC {...chartConfigs} />
</div>