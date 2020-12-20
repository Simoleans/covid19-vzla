<script>
	import router from 'page';
	import { onMount } from 'svelte';
	import Global from '../components/Global.svelte';
	import Footer from "../components/Footer.svelte";
	import Menu from "../components/Menu.svelte";
	import BackTop from '../components/BackTop.svelte';
	import Charts from '../components/Charts.svelte';
	import Historial from '../components/historial.svelte';

	let page;
	
	router('/historial',() => page = Historial);
	router('/', () => page = 'Home');

	// router('/*', () => (page = NotFound));

	router.start();
	
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
		   <Menu {checkedDarkMode}>
				<a href="/" class="{page == 'Home' ? 'activeLinkMenu' : 'inactiveLinkMenu'}">Resumen</a>
				<a href="/historial"  class="{page == Historial ? 'activeLinkMenu' : 'inactiveLinkMenu'}">Historial</a>
			</Menu>
		   {#if page == 'Home'}
				{#if data}
					<Global {...data} />
					<Charts {...data} />
				{:else}
					<p class="dark:text-white mt-3">{error ? 'Lo sentimos ha ocurrido un error, Actualiza la pagina.' : 'Cargando datos...'}</p>
				{/if}
		   {/if}
		   {#if page == Historial}
			   <Historial />
		   {/if}
	  </div>
	  <Footer />
	  <BackTop />
</main>


