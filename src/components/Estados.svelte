<script>
import FusionCharts from 'fusioncharts';
import Charts from 'fusioncharts/fusioncharts.charts';
import FusionTheme from 'fusioncharts/themes/fusioncharts.theme.fusion';
import SvelteFC, { fcRoot } from 'svelte-fusioncharts';

// Always set FusionCharts as the first parameter
fcRoot(FusionCharts, Charts, FusionTheme);

const dataSource = {
  "chart": {
    "caption": "CASOS DE COVID-19 EN VENEZUELA",
    "yaxisname": "Por Ciudad",
    "aligncaptionwithcanvas": "0",
    "plottooltext": "<b>$dataValue</b> Casos",
    "theme": "fusion"
  },
  "data": [
    {
      "label": "Travel & Leisure",
      "value": "41"
    },
    {
      "label": "Advertising/Marketing/PR",
      "value": "39"
    },
    {
      "label": "Other",
      "value": "38"
    },
    {
      "label": "Real Estate",
      "value": "32"
    },
    {
      "label": "Communications/Cable/Phone",
      "value": "26"
    },
    {
      "label": "Construction",
      "value": "25"
    },
    {
      "label": "Entertainment",
      "value": "25"
    },
    {
      "label": "Staffing Firm/Full Time/Temporary",
      "value": "24"
    },
    {
      "label": "Transportation/Logistics",
      "value": "23"
    },
    {
      "label": "Utilities",
      "value": "22"
    },
    {
      "label": "Aerospace/Defense Products",
      "value": "18"
    },
    {
      "label": "Banking/Finance/Securities",
      "value": "16"
    },
    {
      "label": "Consumer Products - Non-Durables",
      "value": "15"
    },
    {
      "label": "Distribution",
      "value": "13"
    },
    {
      "label": "Education",
      "value": "12"
    },
    {
      "label": "Health Products & Services",
      "value": "11"
    },
    {
      "label": "Hospitality & Hotels",
      "value": "10"
    },
    {
      "label": "Non-Business/Residential",
      "value": "6"
    },
    {
      "label": "Pharmaceutical",
      "value": "4"
    },
    {
      "label": "Printing & Publishing",
      "value": "1"
    },
    {
      "label": "Professional Services",
      "value": "1"
    },
    {
      "label": "VAR/ISV",
      "value": "1"
    },
    {
      "label": "Warranty Administrators",
      "value": "1"
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