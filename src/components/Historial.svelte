<script>
	import { onMount } from 'svelte';
	import SvelteInfiniteScroll from "svelte-infinite-scroll";

	let error = false;
	const API = 'https://covid19.patria.org.ve/api/v1/timeline';

	let data = [];
	let datos = [];
	let page = 0;
	let size = 20;
	let notSearch = false;

	onMount(async function() {
		try {
			const response = await fetch(API);
			data = await response.json();
		} catch (err) {
			error = true;
		}
    });

    $: datos = [
    ...datos,
    ...data.slice(size * page, size * (page + 1))
  ];

  function handlerDateSearch(e){
	const value = e.target.value;
	datos = data.filter(d =>
		d.Date.includes(value)
	);
	if(datos.length <= 0){ // validación para ver si consiguio o no consigio datos
		datos = data;
		notSearch = true;
	}else{
		size = 0;
		notSearch = false;
	}
  }
</script>
<div class="flex flex-row mb-3">
	<input type="date" class="p-4 {notSearch ? 'bg-red-500' : 'bg-gray-200'} border-red-300border rounded-md border-2 border-gray-800" placeholder="Fecha" on:change={handlerDateSearch}>
</div>
<div class="Historial overflow-y-scroll" style="height: 54em">
	<table class="w-full table-auto">
        <thead class="justify-between">
          <tr class="dark:bg-blue-500 bg-gray-800 border-2 border-gray-800">
            <th class="px-16 py-2">
              <span class="text-gray-300 dark:text-black text-left">Fecha</span>
            </th>
            <th class="px-16 py-2">
              <span class="text-gray-300 dark:text-black">Confirmados</span>
            </th>
            <th class="px-16 py-2">
              <span class="text-gray-300 dark:text-black">Recuperados</span>
            </th>

            <th class="px-16 py-2">
              <span class="text-red-500 dark:text-black">Fallecidos</span>
            </th>

            <th class="px-16 py-2">
              <span class="text-gray-300 dark:text-black">Activos</span>
            </th>
          </tr>
        </thead>
        <tbody class="bg-gray-200 w-full" >
        	{#each datos as response, index}
		      <tr class="bg-white border-2 border-gray-800">
		        <td class="text-center">
		          <span class="text-center ml-2 font-semibold">{response.Date}</span>
		        </td>
		        <td class="px-16 py-2 text-center">
		          <button class="bg-indigo-500 text-white px-4 py-2 border rounded-md hover:text-black ">
		            {response.Confirmed.Count}
		          </button>
		        </td>
		        <td class="px-16 py-2 text-center">
		          <span>{response.Recovered.Count}</span>
		        </td>
		        <td class="px-16 py-2 text-center">
		          <span>{response.Deaths.Count}</span>
		        </td>

		        <td class="px-16 py-2 text-center">
		          <span>{response.Active.Count}</span>
		        </td>
		      </tr>
		    {/each}
        </tbody>
    </table>
	<SvelteInfiniteScroll hasMore={data.length} threshold={100} on:loadMore={() => page++} />
</div>
