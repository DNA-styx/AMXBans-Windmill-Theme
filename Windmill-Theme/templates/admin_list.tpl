<!-- start admin_list.tpl -->
		<table frame="box" rules="groups" summary="" class="w-full whitespace-no-wrap"> 
			<thead> 
				<tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
					<th style="width:18px;" class="px-4 py-3">&nbsp;</th>
					<th class="px-4 py-3">{"_NICKNAME"|lang}</th> 
					<th style="width:150px;" class="px-4 py-3">{"_STEAMID"|lang}</th>
					<th style="width:150px;" class="px-4 py-3">{"_ACCESS"|lang}</th>
					<th style="width:150px;" class="px-4 py-3">{"_ADMINSINCE"|lang}</th>
					<th style="width:150px;" class="px-4 py-3">{"_ADMINTO"|lang}</th>
				</tr> 
			</thead> 
			<tbody> 
				<!-- Start Loop -->
				{foreach from=$admins item=admin}
					<tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"> 
						<td><a href="http://steamcommunity.com/profiles/{$admin.comid}" target="_blank"><img src="templates/{$design}_gfx/Steam.png" alt="{"_OPENSTEAMCOMSITE"|lang}"/></a>&nbsp;</td>
						<td>{$admin.nickname}</td> 
						<td>{$admin.steamid}</td> 
						<td>{$admin.access}</td> 
						<td>{$admin.created|date_format:"%d. %b %Y - %T"}</td> 
						<td><em>
							{if $admin.expired=="0"}
								<i>{"_UNLIMITED"|lang}</i>
							{else}
								{$admin.expired|date_format:"%d. %b %Y - %T"}
							{/if}
						</em></td> 
					</tr> 
				{/foreach}
				<!-- Stop Loop -->
			</tbody> 
		</table> 
	</div>

	<div class="post _center">
		<form method="post" action="">
			<input type="button" class="px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple" name="showflags" value="{"_INFO_ACCESS"|lang}" onclick="$('#info_access').slideToggle('slow');"/><br/><br/>
		</form>
		<!--<a href="javascript:void(0);" class="button" onclick="ToggleLayer('info_access');">{"_INFO_ACCESS"|lang}</a>-->
	</div>

	<div id="info_access" class="post" style="display:none;">
		<table frame="box" rules="groups" class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"> 
			<thead> 
				<tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"> 
					<th class="px-4 py-3">{"_ACCESSPERMS"|lang}</th> 
					<th style="width:350px;" class="px-4 py-3">{"_ACCESSFLAGS"|lang}</th>
				</tr> 
			</thead> 
			<tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"> 
				<tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"> 
					<td class="px-4 py-3">
						{"_ACCESS_FLAGS"|lang}
					</td> 
					<td class="vtop px-4 py-3">
						{"_FLAG_FLAGS"|lang}
					</td> 
				</tr>
			</tbody> 
		</table> 
<!-- end admin_list.tpl -->