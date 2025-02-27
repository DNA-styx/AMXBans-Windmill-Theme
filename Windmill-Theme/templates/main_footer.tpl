
</div>
</div>

{include file="assets/version.json" assign="jsonContent"}
{assign var="theme_versionNumber" value=$jsonContent|regex_replace:'/.*"version":\s*"([^"]+)".*/s':'$1'}
{assign var="theme_gitNumber" value=$jsonContent|regex_replace:'/.*"git":\s*"(\d{1,5})".*/s':'$1'}

<div
class="flex items-center justify-between p-4 mb-4 text-sm px-4 py-3 bg-white rounded-lg shadow-md dark:bg-gray-800 text-gray-600 dark:text-gray-400"
>
    <span class="flex items-center">
    <span>
        <a class="font-semibold" href="https://sbpp.github.io/" target="_blank">AMXBans {$version_web}</a>
        Powered by <a class="font-semibold" href="https://www.amxmodx.org/" target="_blank">AMX Mod X</a>
    </span>
    </span>
    <span>
        <a class="font-semibold" href="https://github.com/DNA-styx/AMXBans-Windmill-Theme" target="_blank">Theme
        ({$theme_versionNumber} Git: {$theme_gitNumber})</a>
        based on <a class="font-semibold" href="https://github.com/estevanmaito/windmill-dashboard"
        target="_blank">Windmill</a> with code from <a class="font-semibold" href="https://github.com/fysiks1/amxbans/tree/php8-upgrade"
        target="_blank">Fysiks1</a>
    </span>
</div>


</div>
</main>




</div>
</body>
</html>