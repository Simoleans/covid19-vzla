<script>
	import { onMount } from 'svelte';
	import { Router, Route, Link } from "svelte-routing";
	import Global from '../components/Global.svelte';
	import Gender from '../components/Gender.svelte';
	import Estados from "../components/Estados.svelte";
	import AgeRange from "../components/AgeRange.svelte";
	
	export let url = ""; //This property is necessary declare to avoid ignore the Router

	
	let error = false;
	const API = 'https://covid19.patria.org.ve/api/v1/summary';

	let data;

	onMount(async function() {
		try {
			const response = await fetch(API);
			data = await response.json();
		} catch (err) {
			error = true;
		}
		
    });
</script>


<main>
	<div class="container-svelte">
		<Router url="{url}">
			<nav>
			   <Link to="/">Home</Link>
			   <Link to="about">Estados</Link>
			 </nav>
			 <div>
			   <Route path="about">
				{#if data}
					<Estados/>
				{:else}
					<p>{error ? 'Lo sentimos ha ocurrido un error, Actualiza la pagina.' : 'Cargando datos...'}</p>
				{/if}
			   </Route> 
			   <Route path="/">
					{#if data}
						<Global {...data} />
						<div class="flex flex-col md:flex-row">
							<Gender {...data} />
							<AgeRange {...data} />
						</div>
						<h1 class="text-green-500">Hello !</h1>
						<p>Svelte + Tailwind 2.0.2</p>
						<a href="/about">about</a>
					{:else}
						<p>{error ? 'Lo sentimos ha ocurrido un error, Actualiza la pagina.' : 'Cargando datos...'}</p>
					{/if}
			</Route>
			 </div>
		   </Router>
	  </div>
</main>


