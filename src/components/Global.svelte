<script>
    export let Active;
    export let Confirmed;
    export let Deaths;
    export let Recovered;
</script>
<div class="Global">
    <div class="p-4 w-full">
        <div class="grid grid-cols-4 gap-4">
            <div class="col-span-2 md:col-span-1 hover:shadow-lg">
                <div class="flex flex-col bg-gray-100 dark:bg-gray-600 shadow-sm rounded p-4">
                    <div class="flex flex-col items-center justify-center flex-shrink-0 h-12 w-full rounded-xl bg-yellow-100 dark:bg-yellow-300 text-yellow-700">
                        <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M5 8a1 1 0 011-1h1V6a1 1 0 012 0v1h1a1 1 0 110 2H9v1a1 1 0 11-2 0V9H6a1 1 0 01-1-1z" />
                            <path fill-rule="evenodd" d="M2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8zm6-4a4 4 0 100 8 4 4 0 000-8z" clip-rule="evenodd" />
                          </svg>
                    </div>
                    <div class="flex flex-col flex-grow ml-4 items-center pt-2">
                        <div class="text-sm text-gray-500 dark:text-white">Activos</div>
                        <div class="font-bold text-lg dark:text-white">{Active.Count}</div>
                    </div>
                </div>
            </div>
            <div class="col-span-2 md:col-span-1  hover:shadow-lg">
                <div class="flex flex-col bg-gray-100 dark:bg-gray-600 shadow-sm rounded p-4">
                    <div class="flex flex-col items-center justify-center flex-shrink-0 h-12 w-full rounded-xl bg-blue-100 text-blue-500 dark:bg-blue-300 dark:text-blue-700">
                        <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M8 9a3 3 0 100-6 3 3 0 000 6zM8 11a6 6 0 016 6H2a6 6 0 016-6zM16 7a1 1 0 10-2 0v1h-1a1 1 0 100 2h1v1a1 1 0 102 0v-1h1a1 1 0 100-2h-1V7z" />
                          </svg>
                    </div>
                    <div class="flex flex-col flex-grow ml-4 items-center pt-2">
                        <div class="text-sm text-gray-500 dark:text-white">Recuperados</div>
                        <div class="font-bold text-lg dark:text-white">{Recovered.Count}</div>
                    </div>
                </div>
            </div>
            <div class="col-span-2 md:col-span-1  hover:shadow-lg">
                <div class="flex flex-col bg-gray-100 dark:bg-gray-600 shadow-sm rounded p-4 ">
                    <div class="flex flex-col items-center justify-center flex-shrink-0 h-12 w-full rounded-xl bg-red-100 text-red-500 dark:bg-red-300 dark:text-red-800">
                        <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M11 6a3 3 0 11-6 0 3 3 0 016 0zM14 17a6 6 0 00-12 0h12zM13 8a1 1 0 100 2h4a1 1 0 100-2h-4z" />
                          </svg>
                    </div>
                    <div class="flex flex-col flex-grow ml-4 items-center pt-2">
                        <div class="text-sm text-gray-500 dark:text-white">Fallecidos</div>
                        <div class="font-bold text-lg dark:text-white">{Deaths.Count}</div>
                    </div>
                </div>
            </div>
            <div class="col-span-2 md:col-span-1  hover:shadow-lg">
                <div class="flex flex-col bg-gray-100 dark:bg-gray-600 shadow-sm rounded p-4">
                    <div class="flex flex-col items-center justify-center flex-shrink-0 h-12 w-full rounded-xl bg-gray-300 dark:bg-gray-500 dark:text-white">
                        <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M5 3a1 1 0 000 2c5.523 0 10 4.477 10 10a1 1 0 102 0C17 8.373 11.627 3 5 3z" />
                            <path d="M4 9a1 1 0 011-1 7 7 0 017 7 1 1 0 11-2 0 5 5 0 00-5-5 1 1 0 01-1-1zM3 15a2 2 0 114 0 2 2 0 01-4 0z" />
                          </svg>
                    </div>
                    <div class="flex flex-col flex-grow ml-4 items-center pt-2">
                        <div class="text-sm text-gray-500 dark:text-white">Casos Positivos</div>
                        <div class="font-bold text-lg dark:text-white">{Confirmed.Count}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>