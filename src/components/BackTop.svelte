<script>
    export let showOnPx = 2;
    let hidden = true;
  
    function goTop() {
      document.body.scrollIntoView({behavior: "smooth"});
    }
  
    function scrollContainer() {
      return document.documentElement || document.body;
    }
  
    function handleOnScroll() {
      if (!scrollContainer()) {
        return;
      }
  
      if (scrollContainer().scrollTop > showOnPx) {
        hidden = false;
      } else {
        hidden = true;
      }
    }
  </script>
  
  
  
  <svelte:window on:scroll={handleOnScroll} />
  
<div class="BackTop">
    <button on:click={goTop} class:hidden role="button" class="bg-red-600 hover:bg-red-700 text-white text-sm px-4 py-2 fixed bottom-0 right-0">
      <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" viewBox="0 0 20 20" fill="currentColor">
          <path fill-rule="evenodd" d="M5.293 7.707a1 1 0 010-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 01-1.414 1.414L11 5.414V17a1 1 0 11-2 0V5.414L6.707 7.707a1 1 0 01-1.414 0z" clip-rule="evenodd" />
        </svg>
      </button>
</div>  
  