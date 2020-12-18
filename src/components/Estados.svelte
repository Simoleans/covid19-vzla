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
    "caption": "CASOS COVID-19 VENEZUELA",
    "subcaption": "Por estado",
    "plottooltext": "<strong>$label</strong>: $dataValue",
    "yaxisname": "CASOS",
    "xaxisname": "ESTADOS",
    "formatNumber": "0",
    "formatNumberScale": "0",
    "thousandSeparator": ".",
    "decimalSeparator": ",",
    "yaxismaxvalue": "25000",
    "numberSuffix": " /casos",
    "showValues": "1",
    "theme": "fusion"
  },
  "categories": [
    {
      "category": [
        {
          "label": "Amazonas",
        },
        {
          "label": "Anzoátegui",
        },
        {
          "label": "Apure",
        },
        {
          "label": "Aragua",
        },
        {
          "label": "Barinas",
        },
        {
          "label": "Bolívar",
        },
        {
          "label": "Carabobo",
        },
        {
          "label": "Cojedes",
        },
        {
          "label": "Delta Amacuro",
        },
        {
          "label": "Distrito Capital",
        },
        {
          "label": "Falcón",
        },
        {
          "label": "Guarico",
        },
        {
          "label": "La Guaira",
        },
        {
          "label": "Lara",
        },
        {
          "label": "Los Roques",
        },
        {
          "label": "Mérida",
        },
        {
          "label": "Miranda",
        },
        {
          "label": "Monagas",
        },
        {
          "label": "Nueva Esparta",
        },
        {
          "label": "Portuguesa",
        },
        {
          "label": "Sucre",
        },
        {
          "label": "Táchira",
        },
        {
          "label": "Trujillo",
        },
        {
          "label": "Yaracuy",
        },
        {
          "label": "Zulia",
        }
      ]
    }
  ],
  "dataset": [
    {
      "data": [
        {
          "label" : "Amazonas",
          "value": Confirmed.ByState.Amazonas
        },
        {
          "value": Confirmed.ByState.Anzoátegui
        },
        {
          "value": Confirmed.ByState.Apure
        },
        {
          "value": Confirmed.ByState.Aragua
        },
        {
          "value": Confirmed.ByState.Barinas
        },
        {
          "value": Confirmed.ByState.Bolívar
        },
        {
          "value": Confirmed.ByState.Carabobo
        },
        {
          "value": Confirmed.ByState.Cojedes
        },
        {
          "value": Confirmed.ByState["Delta Amacuro"]
        },
        {
          "value": Confirmed.ByState["Distrito Capital"]
        },
        {
          "value": Confirmed.ByState.Anzoátegui
        },
        {
          "value": Confirmed.ByState.Falcón
        },
        {
          "value": Confirmed.ByState["La Guaira"]
        },
        {
          "value": Confirmed.ByState.Lara
        },
        {
          "value": Confirmed.ByState["Los Roques"]
        },
        {
          "value": Confirmed.ByState.Mérida
        },
        {
          "value": Confirmed.ByState.Miranda
        },
        {
          "value": Confirmed.ByState.Mérida
        },
        {
          "value": Confirmed.ByState["Nueva Esparta"]
        },
        {
          "value": Confirmed.ByState.Portuguesa
        },
        {
          "value": Confirmed.ByState.Sucre
        },
        {
          "value": Confirmed.ByState.Táchira
        },
        {
          "value": Confirmed.ByState.Trujillo
        },
        {
          "value": Confirmed.ByState.Yaracuy
        },
        {
          "value": Confirmed.ByState.Zulia
        }
      ]
    }
  ]
};

const chartConfigs = {
   type: 'scrollbar2d',
   width: '100%',
   height: 400,
   dataFormat: 'json',
   dataSource
};
</script>
<div class="Estados flex-1">
    <SvelteFC {...chartConfigs} />
</div>