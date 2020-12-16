<script>
	import { onMount } from 'svelte';
	import { Router, Route, Link } from "svelte-routing";
	import Global from '../components/Global.svelte';
	import Gender from '../components/Gender.svelte';
	import Estados from "../components/Estados.svelte";
	
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
			   <!--for now the router just support case sensitive,
				   one workaround colud be add two time the route
				   Example.
				  <Route path="About" component="{About}" /> 
			   -->
			   <Route path="/">
					{#if data}
						<Global {...data}/>
						<Gender {...data}/>
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

<!-- <script>
	import { onMount } from 'svelte';
	import Global from '../components/Global.svelte';

	let row;
	let error = false;
	const API = 'https://covid19.patria.org.ve/api/v1/summary';

	let myTodo = getTodo();

 async function getTodo() {
   const response = await fetch(API);
   const todo = await response.json();

   if (response.ok) {
     return todo;
   } else {
     throw new Error(todo);
   }
  
 }

 
</script>


<main>
	<div class="container-svelte">
		
		{#await myTodo}
		<p>...waiting</p>
		{:then todo}
		<Global active={todo.Active.Count} />
		{:catch error}
		<p style="color: red">{error.message}</p>
		{/await}
		
</main> -->


