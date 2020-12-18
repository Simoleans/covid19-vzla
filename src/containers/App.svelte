<script>
	import { onMount } from 'svelte';
	import { Router, Route, Link } from "svelte-routing";
	import Global from '../components/Global.svelte';
	import Gender from '../components/Gender.svelte';
	import Estados from "../components/Estados.svelte";
	import Historial from "../components/Historial.svelte";
	import AgeRange from "../components/AgeRange.svelte";
	import Footer from "../components/Footer.svelte";
	import Menu from "../components/Menu.svelte";
	import BackTop from '../components/BackTop.svelte';
	
	export let url = ""; //This property is necessary declare to avoid ignore the Router
	let checkedDarkMode = false;
	let error = false;
	const API = 'https://covid19.patria.org.ve/api/v1/summary';

	let data;

	onMount(async function() {
		if (localStorage.theme === 'dark' || (!'theme' in localStorage && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
			checkedDarkMode = true;
			document.querySelector('html').classList.add('dark')
		} else if (localStorage.theme === 'dark') {
			checkedDarkMode = false;
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
	<div class="container-svelte overflow-auto	">
		
		<Router url="{url}">
			<!-- <nav>
			   <Link to="/">Home</Link>
			   <Link to="estados">Estados</Link>
			 </nav> -->
			 <Menu {checkedDarkMode}/>
			 <div>
			   <Route path="historial">
				{#if data}
					<Historial/>
				{:else}
					<p>{error ? 'Lo sentimos ha ocurrido un error, Actualiza la pagina.' : 'Cargando datos...'}</p>
				{/if}
			   </Route> 
			   <Route path="/">
					{#if data}
						<Global {...data} />
						<div class="flex flex-col md:flex-row gap-2">
							<Gender {...data}/>
							<AgeRange {...data}  />
						</div>
						<div class="flex flex-row mt-3 md:w-full lg:w-full">
							<Estados {...data}/>
						</div>
					{:else}
						<p>{error ? 'Lo sentimos ha ocurrido un error, Actualiza la pagina.' : 'Cargando datos...'}</p>
					{/if}
				</Route>
			 </div>
		   </Router>
	  </div>
	  <Footer />
	  <BackTop />
</main>


