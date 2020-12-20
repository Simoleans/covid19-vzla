<script>
    import Gender from './Gender.svelte';
    import AgeRange from './AgeRange.svelte';
    import Estados from './Estados.svelte';

    import FusionCharts from 'fusioncharts';
    import Charts from 'fusioncharts/fusioncharts.charts';
    import FusionTheme from 'fusioncharts/themes/fusioncharts.theme.fusion';
    import SvelteFC, { fcRoot } from 'svelte-fusioncharts';
    fcRoot(FusionCharts, Charts, FusionTheme);

    export let Confirmed;

    let range = Confirmed.ByAgeRange;
    let state =Confirmed.ByState;

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
    
  
   

    const dataSourceByRange = {
      "chart": {
        "caption": "CASOS DE COVID-19 EN VENEZUELA",
        "subCaption": "Por rango de Edad [0-99]",
        "xAxisName": "Rango de edad",
        "yAxisName": "Cantidad de personas",
        "theme": "fusion",
      },
      "data": [
      {
        "label": "0-9",
        "value": range["0-9"]
      },
      {
        "label": "10-19",
        "value": range["10-19"]
      },
      {
        "label": "20-29",
        "value": range["20-29"]
      },
      {
        "label": "30-39",
        "value": range["30-39"]
      },
      {
        "label": "40-49",
        "value": range["40-49"]
      },
      {
        "label": "50-59",
        "value": range["50-59"]
      },
      {
        "label": "60-69",
        "value": range["60-69"]
      },
      {
        "label": "70-79",
        "value": range["70-79"]
      },
      {
        "label" : "80-89",
        "value" : range["80-89"]
      },
      {
        "label" : "90-99",
       "value" : range["90-99"]
      }
    ]
    },
    chartConfigByRange = {
      type: 'column2d',
      width: '100%',
      height: '450',
      dataSource : dataSourceByRange
    };

const dataSourceEstados = {
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
          "value": state.Amazonas
        },
        {
          "value": state.Anzoátegui
        },
        {
          "value": state.Apure
        },
        {
          "value": state.Aragua
        },
        {
          "value": state.Barinas
        },
        {
          "value": state.Bolívar
        },
        {
          "value": state.Carabobo
        },
        {
          "value": state.Cojedes
        },
        {
          "value": state["Delta Amacuro"]
        },
        {
          "value": state["Distrito Capital"]
        },
        {
          "value": state.Anzoátegui
        },
        {
          "value": state.Falcón
        },
        {
          "value": state["La Guaira"]
        },
        {
          "value": state.Lara
        },
        {
          "value": state["Los Roques"]
        },
        {
          "value": state.Mérida
        },
        {
          "value": state.Miranda
        },
        {
          "value": state.Mérida
        },
        {
          "value": state["Nueva Esparta"]
        },
        {
          "value": state.Portuguesa
        },
        {
          "value": state.Sucre
        },
        {
          "value": state.Táchira
        },
        {
          "value": state.Trujillo
        },
        {
          "value": state.Yaracuy
        },
        {
          "value": state.Zulia
        }
      ]
    }
  ]
};

 const chartConfigsEstados = {
   type: 'scrollbar2d',
   width: '100%',
   height: 400,
   dataFormat: 'json',
   dataSource: dataSourceEstados
};
    
</script>

<div class="Charts">
    <div class="flex flex-col md:flex-row gap-4">
      <Gender>
          <SvelteFC {...chartConfig} />
      </Gender>
      <AgeRange>
        <SvelteFC {...chartConfigByRange} />
      </AgeRange>
    </div>
    <div class="flex flex-row mt-3 md:w-full lg:w-full">
      <Estados>
        <SvelteFC {...chartConfigsEstados} />
      </Estados>
    </div>
</div>