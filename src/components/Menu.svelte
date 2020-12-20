<script>

    export let checkedDarkMode;
   

    function darkMode()
    {
        let htmlClasses = document.querySelector('html').classList;
        
        if(localStorage.theme == 'dark') {
          checkedDarkMode = false;
            htmlClasses.remove('dark');
            localStorage.removeItem('theme')
        } else {
          checkedDarkMode = true;
            htmlClasses.add('dark');
            localStorage.theme = 'dark';
        }
    }
</script>
<div class="Menu">
<nav class="bg-gray-200 dark:bg-gray-600 border-2 border-white mb-3">
    <div class="max-w-7xl mx-auto px-2 sm:px-6 lg:px-8">
      <div class="relative flex items-center justify-between h-16">
        <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
        </div>
        <div class="flex-1 flex items-center justify-center sm:items-stretch sm:justify-start">
            <div class="flex ">
              <slot></slot>
            </div>
        </div>
        <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
            <div  class="relative inline-block w-10 mr-2 align-middle select-none transition duration-200 ease-in">
              <input on:click={darkMode} type="checkbox" bind:checked={checkedDarkMode} name="toggle" id="toggle" class="toggle-checkbox absolute block w-6 h-6 rounded-full bg-white border-4 appearance-none cursor-pointer"/>
              <label for="toggle" class="toggle-label block overflow-hidden h-6 rounded-full bg-gray-300 cursor-pointer"></label>
          </div>
        </div>
      </div>
    </div>
  </nav>
</div>