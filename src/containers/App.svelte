<script>
	import { onMount } from 'svelte';
	import { Router, Route, Link } from "svelte-routing";
	import Global from '../components/Global.svelte';
	import Gender from '../components/Gender.svelte';
	import Estados from "../components/Estados.svelte";
	import AgeRange from "../components/AgeRange.svelte";
	import Footer from "../components/Footer.svelte";
	import Menu from "../components/Menu.svelte";
	
	export let url = ""; //This property is necessary declare to avoid ignore the Router

	
	let error = false;
	const API = 'https://covid19.patria.org.ve/api/v1/summary';

	let data;

	onMount(async function() {
		if (localStorage.theme === 'dark' || (!'theme' in localStorage && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
			document.querySelector('html').classList.add('dark')
		} else if (localStorage.theme === 'dark') {
			document.querySelector('html').classList.add('dark')
		}
    });

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
			<!-- <nav>
			   <Link to="/">Home</Link>
			   <Link to="estados">Estados</Link>
			 </nav> -->
			 <Menu />
			 <div>
			   <Route path="estados">
				{#if data}
					<Estados/>
				{:else}
					<p>{error ? 'Lo sentimos ha ocurrido un error, Actualiza la pagina.' : 'Cargando datos...'}</p>
				{/if}
			   </Route> 
			   <Route path="/">
					{#if data}
						<Global {...data} />
						<div class="flex flex-col md:flex-row gap-2">
							<Gender {...data} />
							<AgeRange {...data} />
						</div>
					{:else}
						<p>{error ? 'Lo sentimos ha ocurrido un error, Actualiza la pagina.' : 'Cargando datos...'}</p>
					{/if}
				</Route>
			 </div>
		   </Router>
	  </div>
	  <Footer />
</main>


