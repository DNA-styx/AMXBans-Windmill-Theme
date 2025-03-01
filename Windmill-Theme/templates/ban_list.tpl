<div class="main">

	<div class="post">

		<table frame="box" rules="groups" summary="" class="w-full whitespace-no-wrap">
				<tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
					<th class="px-4 py-3">&nbsp;</th>
					<th class="_center px-4 py-3">{"_DATE"|lang}</th>
					<th class="_center px-4 py-3">{"_PLAYER"|lang}</th>
					<th class="_center px-4 py-3">{"_ADMIN"|lang}</th>
					<th class="_center px-4 py-3">{"_REASON"|lang}</th>
					<th class="_center px-4 py-3">{"_LENGHT"|lang}</th>
					{if $ban_page.show_comments == 1 && $vars.use_comment == 1}<th class="px-4 py-3" style="width: 30px;">{"_BL_COMMENTS"|lang}</th>{/if}
					{if $ban_page.show_demos == 1 && $vars.use_demo == 1}<th class="px-4 py-3" style="width: 30px;">{"_BL_FILES"|lang}</th>{/if}
					{if $ban_page.show_kicks == 1}<th class="px-4 py-3" style="width: 30px;">{"_BL_KICKS"|lang}</th>{/if}
				</tr>

			<tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">

				{if $error}
				<!-- No Bans -->
					<tr>
						<td class="_center" colspan="9">{"_NO_BANS"|lang}</td>
					</tr>
				<!-- No Bans -->
				{else}
	
				<!-- Banlist -->

					{foreach from=$ban_list item=ban_entry}

						{if $ban_entry.ban_length>0 && $ban_entry.ban_end < $smarty.now}
							<tr onclick="NewToggleLayer('layer_{$ban_entry.bid}')" style="cursor: pointer;" class="text-gray-700 dark:text-gray-400">
						{else}
							<tr onclick="NewToggleLayer('layer_{$ban_entry.bid}')" style="cursor: pointer;" class="text-gray-700 dark:text-gray-400">
						{/if}

						<td class="px-4 py-3 text-sm"><img alt="{if $ban_entry.mod == "html"}{"_WEB"|lang}{else}{$ban_entry.mod|lang}{/if}" title="{if $ban_entry.mod == "html"}{"_WEB"|lang}{else}{$ban_entry.mod|lang}{/if}" src="templates/{$design}_gfx/games/{$ban_entry.mod}.gif"></td>
						<td class="_center px-4 py-3 text-sm">{$ban_entry.ban_created|date_format:"%Y-%m-%d"}</td>
						<td class="_center px-4 py-3 text-sm">{$ban_entry.player_nick}</td>
						<td class="_center px-4 py-3 text-sm">{$ban_entry.admin_nick}</td>
						<td class="_center px-4 py-3 text-sm">{$ban_entry.ban_reason}</td>
						<td class="_center px-4 py-3 text-sm">{if $ban_entry.ban_length>0}
								{($ban_entry.ban_length*60)|date2word:true}
							{else}
								{"_PERMANENT"|lang}
							{/if}
						</td>

						{if $ban_page.show_comments == 1 && $vars.use_comment == 1}<td class="_center">{$ban_entry.comment_count}</td>{/if}
						{if $ban_page.show_demos == 1 && $vars.use_demo == 1}<td class="_center">{$ban_entry.demo_count}</td>{/if}
						{if $ban_page.show_kicks == 1}<td class="_center">{$ban_entry.kick_count}</td>{/if}

					</tr>

					<tr id="layer_{$ban_entry.bid}" style="display:none;">
						<td class="server-info" colspan="9"><div style="display:none;">
							<table frame="box" rules="groups" summary="">
								<thead>
									<tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
										<th style="width:150px;">{"_BANDETAILS"|lang}</th>
										<th class="_right">

											<form method="post" action="" style="display:inline;">
												<input type="hidden" name="bid" value="{$ban_entry.bid}">
												<input type="hidden" name="site" value="{$ban_page.current}">
												<input class="img_input" name="details" type="image" src="templates/{$design}_gfx/page.png" title="{"_DETAILS"|lang}">
											</form>
											{if $smarty.session.bans_delete=="yes" || ($smarty.session.bans_delete=="own" && $smarty.session.uname == $ban_detail.username)}

											<form method="post" action="" style="display:inline;">
												<input class="img_input" name="del_ban" type="image" src="templates/{$design}_gfx/page_delete.png" onclick="return confirm('{"_DELBAN"|lang}{"_DATALOSS"|lang}');" border="0" title="{"_TIP_DEL"|lang}">
												<input type="hidden" name="bid" value="{$ban_entry.bid}">
												<input type="hidden" name="details_x" value="1">
											</form>
											{/if}

										</th>
									</tr>
								</thead>
								<tbody>

									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_NICKNAME"|lang}</td>
										<td>{$ban_entry.player_nick}</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_STEAMID"|lang}</td>
										<td>{if $ban_entry.player_id <> ""}{$ban_entry.player_id}{else}<span style='font-style:italic;font-weight:bold;'>{"_NOSTEAMID"|lang}</span>{/if}</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_STEAMCOMID"|lang}</td>
										<td>
											{if $ban_entry.player_id <> ""}
												<a target="_blank" href="http://steamcommunity.com/profiles/{$ban_entry.player_comid}">{$ban_entry.player_comid}</a>
											{else}
												{"_NOTAVAILABLE"|lang}
											{/if}
										</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_IP"|lang}</td>
										<td>
											{if $smarty.session.ip_view=="yes"}
												{if $ban_entry.player_ip}
													{$ban_entry.player_ip}
												{else}
													<i>{"_NOTAVAILABLE"|lang}</i>
												{/if}
											{else}
												<span style='font-style:italic;font-weight:bold'>{"_HIDDEN"|lang}</span>
											{/if}
										</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_BANTYPE"|lang}</td>
										<td>
											{if $ban_entry.ban_type=="S"}
												{"_STEAMID"|lang}
											{elseif $ban_entry.ban_type=="SI"}
												{"_STEAMID&IP"|lang}
											{else}
												{"_NOTAVAILABLE"|lang}
											{/if}
										</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_REASON"|lang}</td>
										<td>{$ban_entry.ban_reason}</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_INVOKED"|lang}</td>
										<td>{$ban_entry.ban_created|date_format:"%d %b %Y - %T"}</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_EXPIRES"|lang}</td>
										<td>
											{if $ban_entry.ban_length==0}
												<span style='font-style:italic;font-weight:bold;color:red'>{"_NOTAPPLICABLE"|lang}</span>
											{else}
												{$ban_entry.ban_end|date_format:"%d %b %Y - %T"}
												{if $ban_entry.ban_end < $smarty.now}
													({"_ALREADYEXP"|lang})
												{else}
													<i>({($ban_entry.ban_end-$smarty.now)|date2word} {"_REMAINING"|lang})</i>
												{/if}
											{/if}
										</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_BANBY"|lang}</td>
										<td>{$ban_entry.admin_nick}{if $ban_entry.nickname}<i>({$ban_entry.nickname})</i>{/if}</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_BANON"|lang}</td>
										<td>{if $ban_entry.server_name == "website"}{"_WEB"|lang}{else}{$ban_entry.server_name}{/if}</td>
									</tr>
									<tr class="text-gray-700 dark:text-gray-400">
										<td class="fat">{"_TOTALEXPBANS"|lang}</td>
										<td>{$ban_entry.bancount-1}</td>
									</tr>
								</tbody>
							</table> </div>
						</td>
					</tr>
					{/foreach}
				{/if}
				<!-- Banlist -->

				<tr class="text-gray-700 dark:text-gray-400">
					<td colspan="9">
						<!-- Pagenation -->

						<div
						class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800"
						  >
						  	<span class="flex items-center col-span-3">
								{"_SITE"|lang} {$ban_page.current} {"_OF"|lang} {$ban_page.max_page}
							</span>
							<span class="col-span-2"></span>
							<span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
								<nav aria-label="Table navigation">
									<ul class="inline-flex items-center">

									{if $pagenav.first}
										<li>
											<a href="?site={$pagenav.first}">
												<button class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple">
												<i class="fa fa-caret-left"></i><i class="fa fa-caret-left"></i>  
												</button>
											</a>
										</li>
									{/if}
									{if $pagenav.prev}
										<li>
											<a href="?site={$pagenav.prev}">	
												<button class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple">
												<i class="fa fa-caret-left"></i> 
												</button>
											</a>
										</li>
									{/if}
									{foreach from=$pagenav.pages item=page}
										{if $page.current}
											<li>
												<button
												class="px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple"
												>
													{$page.number}
												</button>
											</li>
										{else}
											<li>
												<a href="?site={$page.number}">
													<button class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
														{$page.number}
													</button>
												</a>
											</li>
										{/if}
									{/foreach}
									{if $pagenav.next}
										<li>
											<a href="?site={$pagenav.next}">
												<button class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple">
												<i class="fa fa-caret-right"></i> 
												</button>
											</a>
										</li>
									{/if}
									{if $pagenav.last}
										<li>
											<a href="?site={$pagenav.last}">
												<button class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple">
												<i class="fa fa-caret-right"></i><i class="fa fa-caret-right"></i> 
												</button>
											</a>
										</li>
									{/if}

									</ul>
								</nav>
						  	</span>
						</div>
					<!-- Pagenation -->
					</td>
				</tr>

			</tbody>
		</table>

		<div class="clearer">&nbsp;</div>

	</div>

	<div class="clearer">&nbsp;</div>


</div>

<!-- end ban_list.tpl -->