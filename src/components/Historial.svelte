<script>
	import { onMount } from 'svelte';
	import SvelteInfiniteScroll from "svelte-infinite-scroll";

	let error = false;
	const API = 'https://covid19.patria.org.ve/api/v1/timeline';

	let data = [];
	let datos = [];
	let page = 0;
    let size = 20;

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
	 	// alert(value);
    	datos = data.filter(d =>
      		d.Date.includes(value)
    );
    	size = 0;
  }
</script>
<div class="flex flex-row mb-3">
	<input type="date" min={data} class="p-4 bg-gray-200" placeholder="Fecha" on:change={handlerDateSearch}>
</div>
<div class="Historial overflow-y-scroll" style="height: 54em">
	<table class="w-full table-fixed">
        <thead class="justify-between">
          <tr class="dark:bg-blue-500 bg-gray-800 border-2 border-gray-800">
            <th class="px-16 py-2">
              <span class="text-gray-300 dark:text-black text-left">Fecha</span>
            </th>
            <th class="px-16 py-2">
              <span class="text-gray-300 dark:text-black">Confirmados</span>
            </th>
            <th class="px-16 py-2">
              <span class="text-gray-300 dark:text-black">Date</span>
            </th>

            <th class="px-16 py-2">
              <span class="text-gray-300 d ark:text-black">Time</span>
            </th>

            <th class="px-16 py-2">
              <span class="text-gray-300 dark:text-black">Status</span>
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
		          <button class="bg-indigo-500 text-white px-4 py-2 border rounded-md hover:bg-white hover:border-indigo-500 hover:text-black ">
		            {response.Confirmed.Count}
		          </button>
		        </td>
		        <td class="px-16 py-2 text-center">
		          <span>05/06/2020</span>
		        </td>
		        <td class="px-16 py-2 text-center">
		          <span>10:00</span>
		        </td>

		        <td class="px-16 py-2 text-center">
		          <span class="text-green-500">
		            <svg
		              xmlns="http://www.w3.org/2000/svg"
		              class="w-5 h5 "
		              viewBox="0 0 24 24"
		              stroke-width="1.5"
		              stroke="#2c3e50"
		              fill="none"
		              stroke-linecap="round"
		              stroke-linejoin="round"
		            >
		              <path stroke="none" d="M0 0h24v24H0z" />
		              <path d="M5 12l5 5l10 -10" />
		            </svg>
		          </span>
		        </td>
		      </tr>
		    {/each}
        </tbody>
       
    </table>

<!-- 
    <table class="text-left w-full">
		<thead class=" flex text-white w-full border-1 border-gray-800">
			<tr class="flex w-full dark:bg-blue-500 bg-gray-800">
				<th class="p-4 w-1/4">One</th>
				<th class="p-4 w-1/4">Two</th>
				<th class="p-4 w-1/4">Three</th>
				<th class="p-4 w-1/4">Four</th>
			</tr>
		</thead>
		<tbody class="bg-grey-200 flex flex-col items-center justify-between overflow-y-scroll w-full" style="height: 50vh;">
			<tr class="flex w-full bg-white border-2 border-gray-800">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4 bg-white border-2 border-gray-800">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
			<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
          	<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
          	<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
          	<tr class="flex w-full mb-4">
				<td class="p-4 w-1/4">Dogs</td>
				<td class="p-4 w-1/4">Cats</td>
				<td class="p-4 w-1/4">Birds</td>
				<td class="p-4 w-1/4">Fish</td>
			</tr>
		</tbody>
	</table>
 -->

<SvelteInfiniteScroll
			      hasMore={data.length}
			      threshold={100}
			      on:loadMore={() => page++} />

</div>
