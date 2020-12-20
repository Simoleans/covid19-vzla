<script>
	import router from 'page';
	import { onMount } from 'svelte';
	import { Router, Route } from "svelte-routing";
	import Global from '../components/Global.svelte';
	import Historial from "../components/Historial.svelte";
	import Footer from "../components/Footer.svelte";
	import Menu from "../components/Menu.svelte";
	import BackTop from '../components/BackTop.svelte';
	import Charts from '../components/Charts.svelte';
	import Test from '../components/Test.svelte';

	let page;
	let params;
	
	router('/test',() => page = Test);
	router('/', () => page = 'Home');

	// router('/*', () => (page = NotFound));

	router.start();
	
	// export let url = "";
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
	<div class="container-svelte">
		<!-- <Router url="{url}">
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
						<Charts {...data} />
					{:else}
						<p class="dark:text-white mt-3">{error ? 'Lo sentimos ha ocurrido un error, Actualiza la pagina.' : 'Cargando datos...'}</p>
					{/if}
				</Route>
			 </div>
		   </Router> -->
		   <Menu {checkedDarkMode}>
				<a href="/" class="{page == 'Home' ? 'activeLinkMenu' : 'inactiveLinkMenu'}">Resumen</a>
				<a href="/test"  class="{page == Test ? 'activeLinkMenu' : 'inactiveLinkMenu'}">Test</a>
			</Menu>
		   {#if page == 'Home'}
				{#if data}
					<Global {...data} />
					<Charts {...data} />
				{:else}
					<p class="dark:text-white mt-3">{error ? 'Lo sentimos ha ocurrido un error, Actualiza la pagina.' : 'Cargando datos...'}</p>
				{/if}
		   {/if}
		   {#if page == Test}
			   <Test />
		   {/if}
	  </div>
	  <Footer />
	  <BackTop />
</main>


